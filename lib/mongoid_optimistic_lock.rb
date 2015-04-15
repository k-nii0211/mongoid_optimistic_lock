require 'mongoid_optimistic_lock/version'

module Mongoid
  module OptimisticLock
    extend ActiveSupport::Concern

    included do
      field :version, type: Integer, default: 1

      set_callback :save, :before, :revise, unless: :new_record?
    end

    protected

    def revise
      return false if version_changed?
      self.version = (version || 1) + 1
    end
  end
end
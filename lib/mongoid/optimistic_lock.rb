module Mongoid
  module OptimisticLock
    extend ActiveSupport::Concern

    included do
      field :lock_version, type: Integer, default: 1

      set_callback :save, :before, :revise, unless: :new_record?
    end

    protected

    def revise
      if lock_version_changed?
        errors[:base] << 'Attempted to update a stale document.'
        return false
      end

      self.lock_version = (lock_version || 1) + 1
    end
  end
end

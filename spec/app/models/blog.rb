class Blog
  include Mongoid::Document
  include Mongoid::OptimisticLock

  field :title, type: String
  field :text, type: String

  has_many :comments
end
class Group
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  ## Field
  field :name, type: String
  field :description, type: String, default: ""

  ## Relation
  belongs_to :supervisor, :class_name => "User", :inverse_of => "supervising_groups"
  has_and_belongs_to_many :users, :class_name => "User", :inverse_of => "groups"

  ## Validation
  validates :name, :presence => true

  validates :supervisor, :presence => true
end

class Word
  include Mongoid::Document

  ## Field
  field :shape, type: String # 모양
  field :sound, type: String # 음

  ## Relation
  has_and_belongs_to_many :characters

  ## Validation
  validates :shape, :presence => true
  validates :sound, :presence => true
end

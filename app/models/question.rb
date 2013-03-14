class Question
  include Mongoid::Document

  ## Field
  field :corret, type: Boolean, default: false
  field :examples, type: Hash, default: []
  field :answer, type: Hash, default: {}

  ## Relation
  belongs_to :quiz
  belongs_to :character

  ## Validation
  validates :examples, :presence => true
  validates :answer, :presence => true

  validates :quiz, :presence => true
  validates :character, :presence => true
end

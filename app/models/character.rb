class Character
  include Mongoid::Document

  ## Field
  field :shape, type: String # 모양
  field :meaning, type: String # 뜻
  field :sound, type: String # 음

  ## Relation
  has_many :questions, :dependent => :destroy

  ## Validation
  validates :shape, :presence => true
  validates :meaning, :presence => true
  validates :sound, :presence => true
end

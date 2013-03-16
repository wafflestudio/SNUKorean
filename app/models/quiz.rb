class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps

  NUMBER=4 # 보기 갯수

  ## Field
  field :name, type: String, default: "#{Time.now.to_s} 시작한 퀴즈"
  field :solved, type: Boolean, default: false

  ## Relation
  belongs_to :user
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions

  ## Validation
  validates :name, :presence => true
  validates :solved, :presence => true

  ## Method
  def self.generate_questions(number, user = nil)
    quiz = Quiz.new
    quiz.user = user
    if quiz.save
      characters = Character.all.shuffle[0...number*4]
      characters[0...number].each do |c|
        question = Question.new(:quiz_id => quiz.id, :character_id => c.id)
        question.examples = (characters.shuffle[0...(NUMBER-1)] + [c]).shuffle.map {|e| {:id => e.id, :shape => e.shape, :meaning => e.meaning, :sound => e.sound}}
        logger.error question.errors.full_messages.to_s unless question.save
      end
    else
      quiz = nil
    end
    quiz
  end

  def score
    ((self.questions.where(:correct => true).count / self.questions.count) * 100).to_i
  end
end

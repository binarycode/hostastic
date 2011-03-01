class Ticket < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :replies

  attr_accessor :reply

  as_enum :status, {
    :waiting_for_staff => 0,
    :waiting_for_customer => 1,
    :on_hold => 2,
    :cancelled => 3,
    :completed => 4
  }

  accepts_nested_attributes_for :replies

  scope :unassigned, where(:user_id => nil)
  scope :open, where(:status_cd.in => [0, 1])
  scope :on_hold, where(:status_cd => 2)
  scope :closed, where(:status_cd.in => [3, 4])

  def to_s
    subject
  end

  before_create :generate_ref

  def generate_ref
    chars = ("A".."Z").to_a
    prefix = (1..3).map { chars.shuffle.first }.join
    postfix = "%06d" % rand(1000000)
    self.ref = "#{prefix}-#{postfix}"
  end
end

class Post < ActiveRecord::Base
  belongs_to :author
  validate :is_title_case

  before_validation :make_title_case

  before_save :email_author_about_post

  private

  def is_title_case
    errors.add(:title, 'Title must be in title case') if title.split.any? { |w| w[0].upcase != w[0] }
  end

  def email_author_about_post
    # not implemented
    # look up actionmailer later
  end

  def make_title_case
    self.title = title.titlecase
  end
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :linkedin_account, optional: true

  validates :content, presence: true
  validates :scheduled_at, presence: true

  def attachment
    (super || {}).with_indifferent_access
  end

  def attachment=(value)
    super(value.to_h.with_indifferent_access)
  end

  def formatted_content
    # Convert Markdown-style links [text](url) to HTML for LinkedIn
    content.gsub(/\[([^\]]+)\]\((https?:\/\/[^\)]+)\)/) do |match|
      "<a href='#{$2}' target='_blank' style='color: #0073b1; text-decoration: underline;'>#{$1}</a>"
    end.html_safe
  end
  
end
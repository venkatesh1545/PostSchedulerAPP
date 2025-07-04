class PostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    return unless post.scheduled? && post.scheduled_at <= Time.now

    # LinkedIn API call to publish post
    client = LinkedIn::Client.new(ENV['LINKEDIN_CLIENT_ID'], ENV['LINKEDIN_CLIENT_SECRET'])
    client.access_token = post.user.access_token
    client.create_post(post.content)
    post.update(status: :published, published_at: Time.now)
  end
end
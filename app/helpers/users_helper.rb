module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if user_logged_in?
      image_tag(gravatar_url, alt: user.nickname, class: "gravatar")
    elsif dev_logged_in?
      image_tag(gravatar_url, alt: user.developername, class: "gravatar")
    end
  end
end
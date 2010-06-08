class Mailinator
  BASE_URL = 'http://mailinator.com'

  attr_accessor :email, :name

  def initialize(name = nil, opts = {})
    @name = name
    @email = format_email(name)
  end

  def inbox_url
    action_url('maildir')
  end

  def rss_url
    action_url('rss')
  end

  def atom_url
    action_url('atom')
  end

  def widget_url(width = '250', height = '250')
    URI.parse("#{BASE_URL}/widget/mailin8r.jsp?w=#{width}&h=#{height}&b=#{@name}").to_s
  end

 private

  def action_url(action)
    URI.parse("#{BASE_URL}/#{action}.jsp?email=#{@name}").to_s
  end

  def format_email(email)
    email =~ /^[a-zA-Z0-9]+@mailinator.com$/ ? email : "#{email}@mailinator.com"
  end
end

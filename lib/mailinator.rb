require 'digest/sha1'
require 'open-uri'
require 'nokogiri'
require 'cgi'
require 'mail'

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

  def mailbox
    doc = Nokogiri::HTML(open(atom_url))

    doc.css('feed entry').map do |entry|
      mail = Mail.new

      mail.subject = entry.at_css('title').text
      mail.body = entry.at_css('summary').text

      mail.to = @email
      mail.from = entry.at_css('author name').text

      mail
    end
  end

  def self.mostly_random
    now = Time.now
    sha = Digest::SHA1.hexdigest("#{now.to_i}#{now.usec}").to_s
    
    new(sha.slice(0, 25))
  end

  def self.domain=(domain)
    @domain = domain
  end

  def self.reset_domain!
    @domain = nil
  end

  def self.domain
    @domain ||= "mailinator.com"
  end

 private

  def action_url(action)
    URI.parse("#{BASE_URL}/#{action}.jsp?email=#{@name}").to_s
  end

  def format_email(email)
    email =~ /^[a-zA-Z0-9]+@#{self.class.domain}$/ ? email : "#{email}@#{self.class.domain}"
  end
end

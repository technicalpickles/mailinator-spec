require File.join(File.dirname(__FILE__), 'spec_helper')

describe Mailinator do
  context "with default domain" do
    before(:each) do
      @random_name = "awesomemail#{rand(420)}"
      @primary_email = "#{@random_name}@mailinator.com"
      @mail = Mailinator.new(@random_name)
    end

    it 'should have a primary email address' do
      @mail.email.should == @primary_email
    end

    it 'should have an inbox URL' do
      @mail.inbox_url.should == "http://mailinator.com/maildir.jsp?email=#{@random_name}"
    end

    it 'should have an RSS URL' do
      @mail.rss_url.should == "http://mailinator.com/rss.jsp?email=#{@random_name}"
    end

    it 'should have an RSS URL' do
      @mail.atom_url.should == "http://mailinator.com/atom.jsp?email=#{@random_name}"
    end

    it 'should have a widget URL' do
      width  = '500'
      height = '250'
      widget_url = "http://mailinator.com/widget/mailin8r.jsp?w=#{width}&h=#{height}&b=#{@random_name}"
      @mail.widget_url(width, height).should == widget_url
    end

    it 'should have an alternate email address'
    it 'should have an RSS feed'
    it 'should fetch a random primary email address'
  end

  context "configured custom domain" do
    before(:each) do
      Mailinator.domain = "zombo.com"

      @random_name = "awesomemail#{rand(420)}"
      @primary_email = "#{@random_name}@zombo.com"
      @mail = Mailinator.new(@random_name)
    end

    after(:each) do
      Mailinator.reset_domain!
    end

    it "should figure use the correct domain"  do
      @mail.email.should == @primary_email
    end
  end
end

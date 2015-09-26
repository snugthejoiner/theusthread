require "rails_helper"

describe 'digest_email' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @mail = DigestMailer.digest_email(@user)
  end

  it 'renders the subject' do
    expect(@mail.subject).to eql('This month\'s events')
  end

  it 'renders the receiver email' do
    expect(@mail.to).to eql([@user.email])
  end

  it 'renders the sender email' do
    expect(@mail.from).to eql(['no-reply@theusthread.com'])
  end

  it 'assigns @username' do
    expect(@mail.body.encoded).to match(@user.username)
  end

end

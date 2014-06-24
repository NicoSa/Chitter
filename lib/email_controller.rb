require 'rest_client'

module Email

  def base_url
    ENV["RACK_ENV"] == "production" ? "chitter3000.herokuapp.com" : "localhost:9393"
  end

  def send_recovery_email(token, email)
    RestClient.post "https://api:key-7ap14r7nxhar8f19n1xrbp6c3lz9-k99"\
      "@api.mailgun.net/v2/app25052767.mailgun.org/messages",
      :from => "Password Recovery Chitter <password_recovery@nicosaueressig.de>",
      :to => "#{email}",
      :subject => "Reset password for Chitter",
      :text => "Is this your email: #{email} ? To reset your password copy and paste this link to your browser:\n\n
        http://#{base_url}/reset_password/#{token}"
      puts "Send without Errors"
  end

end

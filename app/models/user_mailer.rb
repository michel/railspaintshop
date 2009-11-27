class UserMailer < ActionMailer::Base

   def activation(user)
        recipients    user.email
        from          "noreply@railspaintshop.com"
        subject       "Account confirmation railspaintshop"
        body          :user => user
   end

end

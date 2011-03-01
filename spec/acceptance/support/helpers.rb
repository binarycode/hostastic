module HelperMethods
  def login_as(user)
    logout
    visit "/users/sign_in"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "user_submit"
  end

  def logout
    visit "/users/sign_out"
  end

  def create_users
    @staff = Factory :user
  end

  def visit(object)
    case object
    when Symbol
      super send("#{object}_path")
    when String
      super object
    else
      super send("#{object.class.to_s.downcase}_path", object)
    end
  end

  def fill_form(object, fields)
    fields.each do |field|
      fill_in "#{object.class.to_s.downcase}_#{field}", :with => object.send(field)
    end
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance

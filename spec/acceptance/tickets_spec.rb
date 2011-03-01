require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Tickets" do
  background do
    create_users
  end

  scenario "User creates tickets" do
    ticket = Factory.build :ticket
    visit :root

    fill_form ticket, %w(name email subject body)
    click_button "ticket_submit"

    visit Ticket.last
    page.should have_content(ticket.name) 
    page.should have_content(ticket.email) 
    page.should have_content(ticket.subject) 
    page.should have_content(ticket.body) 
  end

  scenario "Staff views tickets", :wip => true do
    ticket1 = Factory :ticket, :user => nil
    ticket2 = Factory :ticket, :status => :waiting_for_customer
    ticket3 = Factory :ticket, :status => :on_hold
    ticket4 = Factory :ticket, :status => :cancelled
    ticket5 = Factory :ticket, :status => :completed

    login_as @staff

    visit :tickets
    page.should have_content(ticket1.subject)
    page.should have_no_content(ticket2.subject)
    page.should have_no_content(ticket3.subject)
    page.should have_no_content(ticket4.subject)
    page.should have_no_content(ticket5.subject)

    click_link "Open tickets"
    page.should have_content(ticket1.subject)
    page.should have_content(ticket2.subject)
    page.should have_no_content(ticket3.subject)
    page.should have_no_content(ticket4.subject)
    page.should have_no_content(ticket5.subject)

    click_link "On hold tickets"
    page.should have_no_content(ticket1.subject)
    page.should have_no_content(ticket2.subject)
    page.should have_content(ticket3.subject)
    page.should have_no_content(ticket4.subject)
    page.should have_no_content(ticket5.subject)

    click_link "Closed tickets"
    page.should have_no_content(ticket1.subject)
    page.should have_no_content(ticket2.subject)
    page.should have_no_content(ticket3.subject)
    page.should have_content(ticket4.subject)
    page.should have_content(ticket5.subject)
  end

  scenario "Staff takes ownership of unassigned tickets"
  scenario "Staff searches tickets"
end

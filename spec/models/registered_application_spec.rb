require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { User.create!(email: "testing@testing.com") }
  let(:registered_application) { RegisteredApplication.create!(name: "Reg App Test Name", url: 'test_url_here', user: user) }

  describe 'attributes' do
    it "has a name attribute" do
      expect(registered_application.attribute).to have_attribute(name: "Reg App Test Name")
    end
    it "has a url attribute" do
      expect(registered_application.attribute).to have_attribute(url: "http://testurl.com")
    end
  end
end

require 'rails_helper'

describe MessagesController do
  describe 'GET #new' do
    it "renders the :new template" do
      get "groups/messages#new", group_id: 1
      expect(response).to render_template :new
    end
  end
end

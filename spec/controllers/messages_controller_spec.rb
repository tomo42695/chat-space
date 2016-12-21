require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:group) { create(:group) }
  describe 'with user logged in' do
    before do
      login_user
    end
    describe 'GET #new' do
      let(:request) { get :new, group_id: group }
      it 'renders the :new template' do
        request
        expect(response).to render_template :new
      end
      it 'assigns the requested contact to @group' do
        request
        expect(assigns(:group)).to eq group
      end
      it 'populates an array of tweets ordered by created_at DESC' do
        messages = create_list(:message, 3, group: group)
        request
        expect(assigns(:messages)).to match(messages.sort{|a, b| b.created_at <=> a.created_at })
      end
      it 'assigns a new message to @message' do
        request
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

    describe 'POST #create' do
      describe 'with valid params' do
        let(:request) { post :create, group_id: group, message: { text: 'test' } }
        it 'redirects to the :new template' do
          request
          expect(response).to redirect_to new_group_message_path
        end
        it 'should increment the Message count' do
          expect do
            request
          end.to change(Message, :count).by(1)
        end
        it 'should show flash notice message' do
          request
          expect(flash[:notice]).not_to be_empty
        end
      end

      describe 'with invalid params' do
        let(:bad_request) { post :create, group_id: group, message: { text: nil } }
        it 'should not increment the Message count' do
          expect do
            bad_request
          end.to change(Message, :count).by(0)
        end
        it 'should show flash alert message' do
          bad_request
          expect(flash[:alert]).not_to be_empty
        end
      end
    end
  end

  describe 'with user logged out' do
    let(:get_new) { get :new, params: {group_id: group} }
    describe 'GET #new' do
      it 'should not render the :new template' do
        get_new
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'POST #create' do
      let(:logout_create) { post :create, group_id: group, message: { text: 'test' } }
      it 'should not increment the Message count' do
        expect do
          logout_create
        end.to change(Message, :count).by(0)
      end
    end
  end
end

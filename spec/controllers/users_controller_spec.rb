require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      email: 'person_1@example.com',
      password: 'C0mpL3xP4sS!',
      password_confirmation: 'C0mpL3xP4sS!'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  def valid_session(user) user
                          { user_id: user.id }
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }

  describe 'GET index' do
    it 'assigns all users as @users' do
      user = create(:user)
      get :index, nil, valid_session(user)
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET show' do
    it 'assigns the requested user as @user' do
      user = create(:user)
      get :show, { id: user.to_param }, valid_session(user)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET new' do
    it 'assigns a new user as @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested user as @user' do
      user = create(:user)
      get :edit, { id: user.to_param }, valid_session(user)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, user: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, user: valid_attributes
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, user: valid_attributes
        expect(response).to redirect_to(User.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        expect { post :create, user: {} }.to raise_error
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested user' do
        user = User.create! valid_attributes
        allow(User).to receive(:find).and_return(user)

        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect(user).to receive(:update_attributes).with('email' => 'test@gmail.com')
        put :update, { id: user.to_param, user: { 'email' => 'test@gmail.com' } }, valid_session(user)
      end

      it 'assigns the requested user as @user' do
        user = create(:user)
        put :update, { id: user.to_param, user: valid_attributes }, valid_session(user)
        expect(assigns(:user)).to eq(user)
      end

      it 'doesnt update if not signed in as the correct user' do
        user = create(:user)
        parameters = { id: user.to_param, user: valid_attributes }
        put :update, parameters, valid_session(wrong_user)
        expect(response).to redirect_to(signin_path)
      end

      it 'redirects to the user' do
        user = create(:user)
        put :update, { id: user.to_param, user: valid_attributes }, valid_session(user)
        expect(response).to redirect_to(user)
      end
    end

    describe 'with invalid params' do
      it 'assigns the user as @user' do
        user = create(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(User).to receive(:save).and_return(false)
        expect { put :update, { id: user.to_param, user: {} }, valid_session(user) }.to raise_error
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested user' do
      user = create(:user)
      expect do
        delete :destroy, { id: user.to_param }, valid_session(user)
      end.to change(User, :count).by(-1)
    end

    it 'doesnt destroy if not signed in as the correct user' do
      delete :destroy, { id: user.to_param }, valid_session(wrong_user)
      expect(response).to redirect_to(signin_path)
    end

    it 'redirects to the users list' do
      delete :destroy, { id: user.to_param }, valid_session(user)
      expect(response).to redirect_to(users_url)
    end
  end
end

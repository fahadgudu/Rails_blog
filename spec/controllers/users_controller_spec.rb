require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user)
      get :show, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = FactoryGirl.create(:user)
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = FactoryGirl.create(:user)
      delete :destroy, {:id => user.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
end

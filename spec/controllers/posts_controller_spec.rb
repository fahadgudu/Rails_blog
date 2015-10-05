require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "assigns all posts as @posts" do
      #post = Post.create! valid_attributes
      post = FactoryGirl.create(:post)
      get :index, {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      #post = Post.create! valid_attributes
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      #post = Post.create! valid_attributes
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "does not save the new post in the database" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
        }.to_not change(Post, :count)
      end

      it "re-renders the 'new' template" do
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @post = FactoryGirl.create(:post,
                                 title: 'Test',
                                 body: 'Body test',
                                 author: 'Test Admin')
      end
    context "with valid params" do
      
      it "updates the requested post" do
        post = @post
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        post.reload
        expect(assigns(:post)).to eq(post)
      end

      it "assigns the requested post as @post" do
        post = @post
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = @post
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "does not change the @post's attributes" do
        #post = @post
        #put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:invalid_post)}
        #expect(assigns(:post)).to eq(post)
        put :update, id: @post,
          post: FactoryGirl.attributes_for(:post,
            title: 'Check', body: nil)
        @post.reload
        expect(@post.title).to_not eq('Check')
        expect(@post.body).to eq('Body test')
      end

      it "re-renders the 'edit' template" do
        post = @post
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:invalid_post)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = FactoryGirl.create(:post)
      delete :destroy, {:id => post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end

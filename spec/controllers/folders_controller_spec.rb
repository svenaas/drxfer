require 'rails_helper'

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

describe FoldersController do
  # Creates a user to sign in before each test because authenticate_user! is called before action
  before (:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all folders as @folders" do
      folder = Folder.create! attributes_for(:folder)
      get :index
      expect(assigns(:folders)).to eq([folder])
    end
  end

  describe "GET show" do
    it "assigns the requested folder as @folder" do
      folder = Folder.create! attributes_for(:folder)
      get :show, params: { :id => folder.id.to_s }
      expect(assigns(:folder)).to eq(folder)
    end
  end

  describe "GET new" do
    it "assigns a new folder as @folder" do
      get :new
      expect(assigns(:folder)).to be_a_new(Folder)
    end
  end

  describe "GET edit" do
    it "assigns the requested folder as @folder" do
      folder = Folder.create! attributes_for(:folder)
      get :edit, params: { :id => folder.id.to_s }
      expect(assigns(:folder)).to eq(folder)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Folder" do
        expect {
          post :create, params: { :folder => attributes_for(:folder) }
        }.to change(Folder, :count).by(1)
      end

      it "assigns a newly created folder as @folder" do
        post :create, params: { :folder => attributes_for(:folder) }
        expect(assigns(:folder)).to be_a(Folder)
        expect(assigns(:folder)).to be_persisted
      end

      it "redirects to the created folder" do
        post :create, params: { :folder => attributes_for(:folder) }
        expect(response).to redirect_to(Folder.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved folder as @folder" do
        post :create, params: { :folder => { :path => "" } }
        expect(assigns(:folder)).to be_a_new(Folder)
      end

      it "re-renders the 'new' template" do
        post :create, params: { :folder => { :path => "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested folder" do
        folder = Folder.create! attributes_for(:folder)
        # Assuming there are no other folders in the database, this
        # specifies that the Folder created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :update, params: { :id => folder.id, :folder => {'name' => 'New Name'} }
        folder.reload
        expect(folder).to have_attributes({'name' => 'New Name'})
      end

      it "assigns the requested folder as @folder" do
        folder = Folder.create! attributes_for(:folder)
        put :update, params: { :id => folder.id, :folder => {'name' => 'New Name'} }
        expect(assigns(:folder)).to eq(folder)
      end

      it "redirects to the folder" do
        folder = Folder.create! attributes_for(:folder)
        put :update, params: { :id => folder.id, :folder => {'name' => 'New Name'} }
        expect(response).to redirect_to(folder)
      end
    end

    context "with invalid params" do
      it "assigns the folder as @folder" do
        folder = Folder.create! attributes_for(:folder)
          put :update, params: { :id => folder.id.to_s, :folder => { path: "" } }
        expect(assigns(:folder)).to eq(folder)
      end

      it "re-renders the 'edit' template" do
        folder = Folder.create! attributes_for(:folder)
          put :update, params: { :id => folder.id.to_s, :folder => { path: "" } }
        expect(response).to render_template("edit")
      end
    end
  end

end

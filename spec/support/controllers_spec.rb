require 'spec_helper'

RSpec.shared_examples "a controller" do

  describe "GET #new" do
    let(:medium) {described_class.model.new}

    before(:each) do
      get :new

    end

    it "creates a new item" do
      # expect(assigns(:medium)).to be_a_new(described_class.model)
      expect(response).to render_template(:new)
    end

  end # describe new


  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end #describe

      #
  describe "POST #create" do
    # + media params valid
    context "Valid params" do

      it "creates an Album record" do
        post :create, media_params
        expect(described_class.model.count).to eq 1
      end

      it "rank is 0 right after creation" do
        post :create, media_params
        expect(described_class.model.last.rank).to eq 0
      end

      it "redirect_to #show" do
        post :create, media_params
        expect(response).to redirect_to(media_path)
      end
    end # + context

    # - album params invalid
    context "Invalid media parameters" do

      it "does not create media" do
        post :create, missing_params
        expect(described_class.model.count).to eq 0
      end
    end
  end # POST #create

  describe "DELETE #destroy" do
    # + case: album is destroyed
    context "when resource is found" do
      before(:each) do
        @media_del = described_class.model.create(name: "dizzy")
      end

      it "media counts changes by -1" do
        expect{delete :destroy, {id: @media_del.id}}.to change(described_class.model, :count).by(-1)
        # Album count should decrease by 1 if album sucessfully deleted.
        # If say album count = 0, may not be correct b/c of persistent test data
      end

      it "redirect_to :media" do
        delete :destroy, id: @media_del.id
        expect(response).to redirect_to(medias)
      end
    end # context
  end #describe DELETE

  describe "PUT #update" do
    let(:media_update) do
      described_class.model.create!(
        name: "namie-poo",
        creator: "ms. fancy pants",
        description: "best durn thing ever!"
      )
    end

    it "sucessfully updates name" do
      put :update, :id => @media.id, :media => {name: "Albums"}
      binding.pry
      @media.reload
      expect(@media.name).to eq("Albums")
    end

  end # describe #update

  describe "POST #upvote" do
    before(:each) do
      @media_upvote = described_class.model.create!(
        name: "namezzz",
      )
    end

    it "increases rank by 1" do
      post :upvote, :id => @media_upvote.id
      @media_upvote.reload
      expect(@media_upvote.rank).to eq 1
    end
  end # post upvote



end #controller

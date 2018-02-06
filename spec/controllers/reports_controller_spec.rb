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
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ReportsController, type: :controller do
  render_views
  
  # This should return the minimal set of attributes required to create a valid
  # Report. As you add validations to Report, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {initials: "AA"}
  }

  let(:invalid_attributes) {
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    before :each do 
      @user = FactoryGirl.create(:user)
    end
    
    it "returns a success response" do
      report = @user.reports.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to( new_user_session_path )
      # expect(response.body).to include( "Using this link, patient can access" )
      
    end
    
    it "returns a success response when signed in" do
      report = @user.reports.create! valid_attributes
      
      sign_in @user
      
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(response).to_not redirect_to( new_user_session_path )
      
      # expect(response.body).to include( "Using this link, patient can access" )
    end
  end

  describe "GET #show" do
    before :each do 
      @user = FactoryGirl.create(:user)
    end
    
    it "returns a success response" do
      report = @user.reports.create! valid_attributes
      get :show, params: {id: report.to_param}, session: valid_session
      expect(response).to redirect_to( new_user_session_path )
    end

    it "returns a success response when accessing with valid key" do
      report = @user.reports.create! valid_attributes
      get :show, params: {id: report.to_param, key: report.key}, session: valid_session
      expect(response).to_not redirect_to( new_user_session_path )
    end


    it "returns a success response when signed in" do
      report = @user.reports.create! valid_attributes
      
      sign_in @user
      
      get :show, params: {id: report.to_param}, session: valid_session
      expect(response).to be_success
      expect(response).to_not redirect_to( new_user_session_path )
    end

  end

  describe "GET #new" do
    before :each do 
      @user = FactoryGirl.create(:user)
    end

    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to redirect_to( new_user_session_path )
    end

    it "returns a success response if signed in" do
      sign_in @user
      
      get :new, params: {}, session: valid_session
      expect(response).to be_success
      expect(response).to_not redirect_to( new_user_session_path )
    end

  end

  describe "GET #edit" do
    before :each do 
      @user = FactoryGirl.create(:user)
    end

    it "returns a success response" do
      report = @user.reports.create! valid_attributes
      get :edit, params: {id: report.to_param}, session: valid_session
      expect(response).to redirect_to( new_user_session_path )
    end
    
    it "returns a success response when signed in" do
      report = @user.reports.create! valid_attributes
      sign_in @user
      
      get :edit, params: {id: report.to_param}, session: valid_session
      
      expect(response).to be_success
      expect(response).to_not redirect_to( new_user_session_path )
      
    end
  end

  describe "POST #create" do
    context "with valid signed in user" do
      before :each do 
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "creates a new Report" do
        expect {
          post :create, params: {report: valid_attributes}, session: valid_session
        }.to change(Report, :count).by(1)
      end

      it "assigns signed in user as creator" do
        expect {
          post :create, params: {report: valid_attributes}, session: valid_session
        }.to change(Report, :count).by(1)
      end


      it "redirects to the created report" do
        post :create, params: {report: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Report.last)
      end
    end

    context "with no signed in user" do
      before :each do 
        @user = FactoryGirl.create(:user)
      end

      it "redirects to login" do
        post :create, params: {report: invalid_attributes}, session: valid_session
        expect(response).to redirect_to( new_user_session_path )
      end
    end
  end

  describe "PUT #update" do
    
    context "with valid login" do
      before :each do 
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
      
      
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested report" do
        report = @user.reports.create! valid_attributes
        put :update, params: {id: report.to_param, report: new_attributes}, session: valid_session
        report.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the report" do
        report = @user.reports.create! valid_attributes
        put :update, params: {id: report.to_param, report: valid_attributes}, session: valid_session
        expect(response).to redirect_to(report)
      end
    end

    context "with invalid login" do
      before :each do 
        @user = FactoryGirl.create(:user)
      end
      
      it "redirects to login page" do
        report = @user.reports.create! valid_attributes
        put :update, params: {id: report.to_param, report: invalid_attributes}, session: valid_session
        expect(response).to redirect_to( new_user_session_path )
        
      end
    end
  end

  describe "DELETE #destroy" do
    context "when signed in" do
      before :each do 
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
    
      it "destroys the requested report" do
        report = @user.reports.create! valid_attributes
        expect {
          delete :destroy, params: {id: report.to_param}, session: valid_session
        }.to change(Report, :count).by(-1)
      end

      it "redirects to the reports list" do
        report = @user.reports.create! valid_attributes
        delete :destroy, params: {id: report.to_param}, session: valid_session
        expect(response).to redirect_to(reports_url)
      end
    end
    
    context "when not signed in" do
      before :each do 
        @user = FactoryGirl.create(:user)
      end
    
      it "destroys the requested report" do
        report = @user.reports.create! valid_attributes
        delete :destroy, params: {id: report.to_param}, session: valid_session
        
        expect(response).to redirect_to( new_user_session_path )
        
      end

      it "redirects to the reports list" do
        report = @user.reports.create! valid_attributes
        delete :destroy, params: {id: report.to_param}, session: valid_session
        expect(response).to redirect_to( new_user_session_path )
      end
    end
    
  end

end

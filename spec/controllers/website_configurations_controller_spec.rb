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

describe WebsiteConfigurationsController do

  # This should return the minimal set of attributes required to create a valid
  # WebsiteConfiguration. As you add validations to WebsiteConfiguration, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WebsiteConfigurationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all website_configurations as @website_configurations" do
      website_configuration = WebsiteConfiguration.create! valid_attributes
      get :index, {}, valid_session
      assigns(:website_configurations).should eq([website_configuration])
    end
  end

  describe "GET show" do
    it "assigns the requested website_configuration as @website_configuration" do
      website_configuration = WebsiteConfiguration.create! valid_attributes
      get :show, {:id => website_configuration.to_param}, valid_session
      assigns(:website_configuration).should eq(website_configuration)
    end
  end

  describe "GET new" do
    it "assigns a new website_configuration as @website_configuration" do
      get :new, {}, valid_session
      assigns(:website_configuration).should be_a_new(WebsiteConfiguration)
    end
  end

  describe "GET edit" do
    it "assigns the requested website_configuration as @website_configuration" do
      website_configuration = WebsiteConfiguration.create! valid_attributes
      get :edit, {:id => website_configuration.to_param}, valid_session
      assigns(:website_configuration).should eq(website_configuration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WebsiteConfiguration" do
        expect {
          post :create, {:website_configuration => valid_attributes}, valid_session
        }.to change(WebsiteConfiguration, :count).by(1)
      end

      it "assigns a newly created website_configuration as @website_configuration" do
        post :create, {:website_configuration => valid_attributes}, valid_session
        assigns(:website_configuration).should be_a(WebsiteConfiguration)
        assigns(:website_configuration).should be_persisted
      end

      it "redirects to the created website_configuration" do
        post :create, {:website_configuration => valid_attributes}, valid_session
        response.should redirect_to(WebsiteConfiguration.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved website_configuration as @website_configuration" do
        # Trigger the behavior that occurs when invalid params are submitted
        WebsiteConfiguration.any_instance.stub(:save).and_return(false)
        post :create, {:website_configuration => { "name" => "invalid value" }}, valid_session
        assigns(:website_configuration).should be_a_new(WebsiteConfiguration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WebsiteConfiguration.any_instance.stub(:save).and_return(false)
        post :create, {:website_configuration => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested website_configuration" do
        website_configuration = WebsiteConfiguration.create! valid_attributes
        # Assuming there are no other website_configurations in the database, this
        # specifies that the WebsiteConfiguration created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WebsiteConfiguration.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => website_configuration.to_param, :website_configuration => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested website_configuration as @website_configuration" do
        website_configuration = WebsiteConfiguration.create! valid_attributes
        put :update, {:id => website_configuration.to_param, :website_configuration => valid_attributes}, valid_session
        assigns(:website_configuration).should eq(website_configuration)
      end

      it "redirects to the website_configuration" do
        website_configuration = WebsiteConfiguration.create! valid_attributes
        put :update, {:id => website_configuration.to_param, :website_configuration => valid_attributes}, valid_session
        response.should redirect_to(website_configuration)
      end
    end

    describe "with invalid params" do
      it "assigns the website_configuration as @website_configuration" do
        website_configuration = WebsiteConfiguration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WebsiteConfiguration.any_instance.stub(:save).and_return(false)
        put :update, {:id => website_configuration.to_param, :website_configuration => { "name" => "invalid value" }}, valid_session
        assigns(:website_configuration).should eq(website_configuration)
      end

      it "re-renders the 'edit' template" do
        website_configuration = WebsiteConfiguration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WebsiteConfiguration.any_instance.stub(:save).and_return(false)
        put :update, {:id => website_configuration.to_param, :website_configuration => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested website_configuration" do
      website_configuration = WebsiteConfiguration.create! valid_attributes
      expect {
        delete :destroy, {:id => website_configuration.to_param}, valid_session
      }.to change(WebsiteConfiguration, :count).by(-1)
    end

    it "redirects to the website_configurations list" do
      website_configuration = WebsiteConfiguration.create! valid_attributes
      delete :destroy, {:id => website_configuration.to_param}, valid_session
      response.should redirect_to(website_configurations_url)
    end
  end

end

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
describe "GET #index" do
    it "assigns all events as @events" do
      #event = event.create! valid_attributes
      event = FactoryGirl.create(:event)
      get :index, {}
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET #show" do
    it "assigns the requested event as @event" do
      #event = event.create! valid_attributes
      event = FactoryGirl.create(:event)
      get :show, {:id => event.to_param}
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET #new" do
    it "assigns a new event as @event" do
      get :new, {}
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "GET #edit" do
    it "assigns the requested event as @event" do
      #event = event.create! valid_attributes
      event = FactoryGirl.create(:event)
      get :edit, {:id => event.to_param}
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new event" do
        expect {
          post :create, event: FactoryGirl.attributes_for(:event)
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to the created event" do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "does not save the new event in the database" do
        expect {
          post :create, event: FactoryGirl.attributes_for(:invalid_event)
        }.to_not change(Event, :count)
      end

      it "re-renders the 'new' template" do
        post :create, event: FactoryGirl.attributes_for(:invalid_event)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @event = FactoryGirl.create(:event,
                                 title: 'Test',
                                 body: 'Body test',
                                 author: 'Test Admin')
      end
    context "with valid params" do
      
      it "updates the requested event" do
        event = @event
        put :update, {:id => event.to_param, :event => FactoryGirl.attributes_for(:event)}
        event.reload
        expect(assigns(:event)).to eq(event)
      end

      it "assigns the requested event as @event" do
        event = @event
        put :update, {:id => event.to_param, :event => FactoryGirl.attributes_for(:event)}
        expect(assigns(:event)).to eq(event)
      end

      it "redirects to the event" do
        event = @event
        put :update, {:id => event.to_param, :event => FactoryGirl.attributes_for(:event)}
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      it "does not change the @event's attributes" do
        #event = @event
        #put :update, {:id => event.to_param, :event => FactoryGirl.attributes_for(:invalid_event)}
        #expect(assigns(:event)).to eq(event)
        put :update, id: @event,
          event: FactoryGirl.attributes_for(:event,
            title: 'Check', body: nil)
        @event.reload
        expect(@event.title).to_not eq('Check')
        expect(@event.body).to eq('Body test')
      end

      it "re-renders the 'edit' template" do
        event = @event
        put :update, {:id => event.to_param, :event => FactoryGirl.attributes_for(:invalid_event)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = FactoryGirl.create(:event)
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = FactoryGirl.create(:event)
      delete :destroy, {:id => event.to_param}
      expect(response).to redirect_to(events_url)
    end
  end
end

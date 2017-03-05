require 'rails_helper'

RSpec.describe ::TagsController, type: :controller do
  describe 'GET edit' do
    let!(:tag) {
      Tag.create!(name: "Moon")
    }
    let(:call_action) do
      get :edit, id: tag
    end
    context 'normal interaction' do
      before { call_action }

      it {should render_template('edit')}
    end
  end

  describe 'GET new' do
    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'GET index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    let!(:tag) {
      Tag.create!(name: "Moon")
    }
    let(:call_action) do
      get :show, id: tag
    end
    context 'normal interaction' do
      before { call_action }

      it {should render_template('show')}
    end
  end
end

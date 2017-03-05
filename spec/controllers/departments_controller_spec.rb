require 'rails_helper'

RSpec.describe ::DepartmentsController, type: :controller do
  describe 'GET edit' do
    let!(:department) {
      Department.create!(name: "Nasa")
    }
    let(:call_action) do
      get :edit, id: department
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
    let!(:department) {
      Department.create!(name: "Nasa")
    }
    let(:call_action) do
      get :show, id: department
    end
    context 'normal interaction' do
      before { call_action }

      it {should render_template('show')}
    end
  end
end

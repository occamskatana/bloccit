require 'rails_helper'
include RandomData


RSpec.describe QuestionsController, :type => :controller do

let (:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  

  describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns(my_question) to @quesiton" do
        get :index
        expect(assigns(:question)).to eq([my_question])
      end
    end
  

  describe "PUT update" do 
    it "updates question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}

      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.body).to eq new_body
      expect(updated_question.title).to eq new_title
    end

    it "redirects to updated post" do 

      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body}

      expect(response).to redirect_to my_question
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do 
      get :show, {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns my_question to @question" do 
      get :show, {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end

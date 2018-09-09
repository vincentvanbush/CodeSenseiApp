require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) do
    User.create(email: 'asdf@qwer.pl', password: 'qwer1234')
  end

  describe '#new' do

  end

  describe '#index' do
    let!(:articles) do
      [
        Article.create(title: 'qwerty', text: 'qwerasdf', user: user),
        Article.create(title: 'asdfzxcv', text: 'zxcvasdf', user: user)
      ]
    end

    before do
      get :index
    end

    it 'responds with OK code' do
      expect(response).to have_http_status 200
    end

    it 'assigns all articles to @articles' do
      expect(assigns[:articles].size).to eq 2
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    before do
      sign_in user if user
      post :create, params: {
        article: {
          title: 'qwerasdf',
          text: 'asdfqwer'
        }
      }
    end

    context 'when user is not signed in' do
      let(:user) { nil }

      it 'redirects to login screen' do
        expect(response).to redirect_to new_user_session_path
      end

      it 'does not create article' do
        expect(Article.count).to eq 0
      end
    end

    context 'when user is signed in' do
      it 'redirects to created article' do
        expect(response).to redirect_to article_path(Article.last)
      end
    end
  end

  describe '#show' do

  end

  describe '#edit' do

  end

  describe '#update' do

  end

  describe '#destroy' do

  end
end

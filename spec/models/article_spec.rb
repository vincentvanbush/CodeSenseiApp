require 'rails_helper'

RSpec.describe Article do
  subject(:article) { Article.new(title: title, text: text, user: user) }

  let(:user) { User.create(email: 'qwer@asdf.pl', password: 'qwer1234')}
  let(:text) { 'lorem ipsum'}

  context 'when title does not exist' do
    let(:title) { nil }



    # it 'is valid' do
    #   expect(article.valid?).to eq false
    # zamiast tego dajemy ponizsza linijke

    it { is_expected.not_to be_valid }

  end

  context 'when title has fewer than 5 characters' do
    let(:title) { 'asdf' }

    it { is_expected.not_to be_valid }
  end

  context 'when title has 5 characters' do
    let(:title) { 'asdfg' }

    it { is_expected.to be_valid }
  end

  context 'when title has 20 characters' do
    let(:title) { 'asdfgasdfgasdfgasdfg' }

    it { is_expected.to be_valid }
  end

  context 'when title has 21 characters' do
    let(:title) { 'asdfgasdfgasdfgasdfgh' }

    it { is_expected.not_to be_valid }
  end

end

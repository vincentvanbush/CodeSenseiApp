require 'rails_helper'

RSpec.describe Article do
	subject(:article) do
		Article.new(title: title, text: text, user: user)
	end
	
	let(:text) { 'Lorem ipsum'}

	let(:user) { User.create(email: 'adsdfs@pl', password: '123456')}	

	context 'when title does not exist' do
		let(:title) { nil }

		it { is_expected.not_to be_valid }

		# it 'is invalid' do
		# 	expect(article).not_to be_valid
		# end	
	end

	context 'when title has fewer then 5 characters' do
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
		let(:title) { 'asdfgasdfgasdfgasdfga' }

		it { is_expected.not_to be_valid }
	end	
end
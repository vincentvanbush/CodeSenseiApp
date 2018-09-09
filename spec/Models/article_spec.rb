require 'rails_helper'

RSpec.describe Article do 
	subject(:article) do
		Article.new(title: title, text: text, user: user)
	end

	let(:text) { 'lorem ipsum' }

	let(:user) { User.create(email: 'qwer@ssss.pl', password: 'qwer1234') }

	context 'when title does not exist' do 
		let(:title) { nil }

		it { is_expected.not_to be_valid }
		# it 'is invaild' do 
		# 	expect(article.valid?).not_to be_valid
		# end	
	end

	context 'when title has fewer than 5 characters' do
		let(:title) { 'asdf' }

		it { is_expected.not_to be_valid }
	end
	
	context 'when title has 5 characters' do 
		let(:title) { 'ssddd' }

		it { is_expected.to be_valid }
	end

	context 'when title has 20 characters' do 
		let(:title) { 'ssdddssdddssdddssddd' }

		it { is_expected.to be_valid }
	end

	context 'when title has 21 characters' do 
		let(:title) { 'ssdddsssdddssdddssddd' }

		it { is_expected.not_to be_valid }
	end
end	
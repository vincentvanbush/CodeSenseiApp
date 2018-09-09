require 'rails_helper'

RSpec.describe Article do
  subject(:article) {Article.new(title: title, text: text, user: user)}


  let(:text) {'lorem ipsum'}

  let(:user) {User.create(email: 'qwer@asdf.pl', password: 'qwer1234')}



  context 'when title does not exist' do
    let(:title) {nil}

  it {is_expected.not_to be_valid}
 end

  context 'when title has fewer than 5 characters' do
    let(:title) {'asdf'}
      it {is_expected.not_to be_valid}
  end

  context 'when title has 5 characters' do
    let(:title) {'asdfg'}
      it {is_expected.to be_valid}
  end


  context'when title has 20 characters' do
    let(:title){'asdfasdfasdfasdfasdf'}
      it {is_expected.to be_valid}
  end

    context 'when title has 21 characters' do
      let(:title) {'asdfasdfasdfasdfasdfg'}
        it {is_expected.not_to be_valid}
    end

end

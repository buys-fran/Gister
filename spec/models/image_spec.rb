require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'validations' do
    context 'with a valid image' do
      it 'works' do
        expect(create(:image).valid?).to eq(true)
      end
    end

    context 'with a invalid image' do
      it 'marks big images as invalid' do
        big_image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/too_big.jpg'), 'image/jpg')
        invalid_image = build(:image, image: big_image)
        expect(invalid_image.valid?).to eq(false)
      end
    end
  end
end

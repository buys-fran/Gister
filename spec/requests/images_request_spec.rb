require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe '.create' do
    context 'with a valid image' do
      it 'creates image and redirects to show' do
        user = create(:user)
        image = build(:image)
        sign_in user
        expect(Image.count).to eq(0)

        post images_path, params: { image: { image: image.image } }

        expect(response).to redirect_to(image_path(Image.last))
        expect(Image.count).to eq(1)
      end
    end

    context 'without a valid image' do
      it 'does not create image and returns errors' do
        user = create(:user)
        invalid_image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/too_big.jpg'), 'image/jpg')
        sign_in user

        post images_path, params: { image: { image: invalid_image } }

        expect(Image.count).to eq(0)
        expect(controller.view_assigns['image'].errors).not_to be_empty
      end
    end
  end

  describe '.show' do
    context 'with a valid image' do
      it 'works' do
        user = create(:user)
        image = create(:image)
        sign_in user

        get image_path(image)

        expect(response.status).to eq(200)
        expect(controller.view_assigns['image']).not_to be_nil
      end
    end
  end
end

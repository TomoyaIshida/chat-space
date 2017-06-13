require 'rails_helper'

describe Message do
  describe '#create' do
    context 'メッセージを保存できる場合' do
      it "is valid with a body, image" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "is valid with a body" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "is valid with a image" do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'メッセージを保存できない場合' do
      it "is invalid without a body, image" do
        user = build(:message, body: nil, image: nil)
        user.valid?
        expect(user.errors[:body]).to include("を入力してください")
      end

      it "is invalid without a group_id" do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group_id]).to include("を入力してください")
      end

      it "is invalid without a user_id" do
        message = build(:message, user_id: "")
        message.valid?
        expect(message.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end

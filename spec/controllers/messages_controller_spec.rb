require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message, user_id: user.id, group_id: group.id) }
    describe 'GET #index' do
      context 'ログインしている場合' do
        before do
          login_user user
        end

        before :each do
         get :index, params: {group_id: group.id}
        end

        it "アクション内で定義している@messageがあるか？" do
          message = Message.new
          expect(assigns(:message)).to be_a_new Message
        end

        it "アクション内で定義している@groupがあるか？" do
          expect(assigns(:group)).to eq group
        end

        it "トップ画面に遷移するか？" do
          expect(response).to render_template :index
        end
      end

      context 'ログインしていない場合' do
        it "新規登録画面に遷移するか？" do
          get :index, params: {group_id: group.id}
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe 'POST #create' do
      before :each do
        login_user user
      end
      context 'ログインしているかつ、保存に成功した場合' do
        it "メッセージの保存はできたのか？" do
          expect{
            post :create, params: { message: attributes_for(:message, { body: message.body }), group_id: group.id, user_id: user.id}}.to change(Message, :count).by(1)
        end

        it "チャット画面に遷移しているか？" do
          post :create, params: { message: attributes_for(:message, { body: message.body }),group_id: group.id, user_id: user.id}
          expect(response).to redirect_to group_messages_path(group.id)
        end

        it "成功時のフラッシュメッセージが表示されるか？" do
          post :create, params: { message: attributes_for(:message, { body: message.body }),group_id: group.id, user_id: user.id}
          expect(flash[:notice]).to include("メッセージを送信しました")
        end
      end

      context 'ログインしているが、保存に失敗した場合' do
        it "メッセージの保存は行われなかったか？" do
          expect{
            post :create, params: { message: attributes_for(:message, { body: nil, image: nil}),group_id: group.id, user_id: user.id}}.not_to change(Message, :count)
        end
        it "意図したビュー(index)に遷移するか？" do
          post :create, params: { message: attributes_for(:message, { body: nil, image: nil }),group_id: group.id, user_id: user.id}
          expect(response).to render_template :index
        end
        it "失敗時のフラッシュメッセージが表示されるか？" do
          post :create, params: { message: attributes_for(:message, { body: nil, image: nil }),group_id: group.id, user_id: user.id}
          expect(flash[:alert]).to include("メッセージを入力してください")
        end
      end
    end
    context 'ログインしていない場合' do
        it "意図した画面にリダイレクトできているか？" do
          post :create, params: {group_id: group.id}
          expect(response).to redirect_to user_session_path
        end
    end
end

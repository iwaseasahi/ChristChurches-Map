require 'rails_helper'

RSpec.describe ChurchesController, type: :controller do
  before { geocoder_default_mock }

  describe 'GET ***REMOVED***show' do
    let(:church) { create(:church) }

    it '@churchに要求された教会を割り当てること' do
      get :show, params: { id: church }

      expect(assigns(:church)).to eq church
    end

    it '@commentに新しいコメントを割り当てること' do
      get :show, params: { id: church }

      expect(assigns(:comment)).to be_a_new Comment
    end

    it '@hashに教会の位置情報を割り当てること' do
      get :show, params: { id: church }

      expect(assigns(:hash)).not_to eq nil
    end

    it ':showテンプレートを表示すること' do
      get :show, params: { id: church }

      expect(response).to render_template(:show)
    end
  end

  describe 'GET ***REMOVED***new' do
    it '@churchに新しい教会を割り当てること' do
      get :new

      expect(assigns(:church)).to be_a_new Church
    end

    it ':newテンプレートを表示すること' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'GET ***REMOVED***edit' do
    include_context 'user_authorized'

    let!(:church) { create(:church) }

    subject { get :edit, params: { id: church } }

    it '@churchに要求された教会を割り当てること' do
      subject

      expect(assigns(:church)).to eq church
    end

    it ':editテンプレートを表示すること' do
      subject

      expect(response).to render_template(:edit)
    end
  end

  describe 'POST ***REMOVED***create' do
    context '有効な属性の場合' do
      let!(:group) { create(:group) }
      let!(:prefecture) { create(:prefecture, :tokyo) }

      it '教会を保存すること' do
        church_params = build(:church, group: group, prefecture: prefecture).attributes

        expect{
          post :create, params: { church: church_params }
        }.to change(Church, :count).by(1)
      end

      it 'churches***REMOVED***showにリダイレクトすること' do
        church_params = build(:church, group: group, prefecture: prefecture).attributes

        post :create, params: { church: church_params }

        expect(response).to redirect_to church_path(assigns[:church])
      end
    end

    context '無効な属性の場合' do
      let!(:group) { create(:group) }
      let!(:prefecture) { create(:prefecture, :tokyo) }

      it '教会を保存しないこと' do
        church_params = build(:church, group: group, prefecture: prefecture, name: nil).attributes

        expect{
          post :create, params: { church: church_params }
        }.not_to change(Church, :count)
      end

      it ':newテンプレートを再表示すること' do
        church_params = build(:church, group: group, prefecture: prefecture, name: nil).attributes

        post :create, params: { church: church_params }

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH ***REMOVED***update' do
    let!(:church) { create(:church) }

    include_context 'user_authorized'

    context '有効な属性の場合' do
      it '要求された@churchを取得すること' do
        patch :update, params: { id: church, church: attributes_for(:church) }

        expect(assigns(:church)).to eq church
      end

      it 'churchの属性を変更すること' do
        patch :update, params: { id: church, church: attributes_for(:church, name: 'エクレシア') }
        church.reload

        expect(church.name).to eq 'エクレシア'
      end

      it '更新した教会のページへリダイレクトすること' do
        patch :update, params: { id: church, church: attributes_for(:church) }

        expect(response).to redirect_to church
      end
    end

    context '無効な属性の場合' do
      it '教会の属性を変更しないこと' do
        name = church.name

        patch :update, params: { id: church, church: attributes_for(:church, name: nil) }
        church.reload

        expect(church.name).to eq name
      end

      it 'editテンプレートを再表示すること' do
        patch :update, params: { id: church, church: attributes_for(:church, name: nil) }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE ***REMOVED***destroy' do
    let!(:church) { create(:church) }

    include_context 'user_authorized'

    it '教会を削除すること' do
      delete :destroy, params: { id: church, church: attributes_for(:church) }

      expect(Church.exists?(id: church)).to eq false
    end

    it 'maps***REMOVED***indexにリダイレクトすること' do
      delete :destroy, params: { id: church }

      expect(response).to redirect_to maps_url
    end
  end
end

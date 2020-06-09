***REMOVED*** frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChurchDecorator do
  let(:church) { Church.new.extend ChurchDecorator }
  subject { church }
  it { should be_a Church }

  describe '***REMOVED***display_tel' do
    it '電話番号が入力されていれば表示すること' do
      church = create(:church, :shinjuku_shalom)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_tel).to eq church.tel
    end

    it '電話番号が未入力であれば未設定を表示すること' do
      church = create(:church, :shinjuku_shalom, tel: nil)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_tel).to eq '未設定'
    end
  end

  describe '***REMOVED***display_email' do
    it 'メールアドレスが入力されていればaタグで表示すること' do
      church = create(:church, :with_info)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_email).to eq "<a href='mailto:***REMOVED***{church.email}'>メールはこちら</a>"
    end

    it 'メールアドレスが未入力であれば未設定を表示すること' do
      church = create(:church)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_email).to eq '未設定'
    end
  end

  describe '***REMOVED***display_url' do
    it 'ホームページが入力されていれば表示すること' do
      church = create(:church, :with_info)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_url).to eq "<a href=***REMOVED***{church.url} target='_blank'>ホームページはこちら</a>"
    end

    it 'ホームページが未入力であれば未設定を表示すること' do
      church = create(:church)
      decorated_church = ActiveDecorator::Decorator.instance.decorate(church)

      expect(decorated_church.display_url).to eq '未設定'
    end
  end
end

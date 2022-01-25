require 'rails_helper'

RSpec.describe EndUser, type: :model do
  it "必要事項があれば、有効である。" do
    expect(FactoryBot.build(:end_user)).to be_valid
  end

  it "名前がなければ、無効である。" do
    expect(FactoryBot.build(:end_user, name: "")).to_not be_valid
  end
  
  it "フリガナがなければ、無効である。" do
    expect(FactoryBot.build(:end_user, name_kana: "")).to_not be_valid
  end
  
  it "電話番号がなければ、無効である。" do
    expect(FactoryBot.build(:end_user, telephone_number: "")).to_not be_valid
  end
  
  it "電話番号が重複していれば、無効である。" do
    end_user = FactoryBot.create(:end_user)
    expect(FactoryBot.build(:end_user, email: "b@b.com", telephone_number: end_user.telephone_number)).to_not be_valid
  end

  it "性別がなければ、無効である。" do
    expect(FactoryBot.build(:end_user, sex: "")).to_not be_valid
  end
  
  it "メールアドレスがなければ、無効である。" do
    expect(FactoryBot.build(:end_user, email: "")).to_not be_valid
  end
  
  it "メールアドレスが重複していれば、無効である。" do
    end_user = FactoryBot.create(:end_user)
    expect(FactoryBot.build(:end_user, telephone_number: "09011111111", email: end_user.email)).to_not be_valid
  end
  
  it "パスワードがなければ、無効である。" do
    expect(FactoryBot.build(:end_user, password: "")).to_not be_valid
  end
end

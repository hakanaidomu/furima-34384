FactoryBot.define do
  factory :user do
    nickname              { 'ふりまたろう' }
    email                 { 'aaa@bbb' }
    first_name            { 'ふりま' }
    last_name             { '太郎' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'フリマ' }
    birthday              { '1999-09-11' }
    password              { 'aaa111' }
    password_confirmation { password }
  end
end

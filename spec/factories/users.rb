FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'123abc'}
    password_confirmation {password}
    family_name_kanji     {'大阪'}
    first_name_kanji      {'太郎'}
    family_name_kana      {'オオサカ'}
    first_name_kana       {'タロウ'}
    day_of_birth          {'1996/12/17'}
  end
end
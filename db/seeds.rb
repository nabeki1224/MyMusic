# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  User.create(name: '田中花子', name_kana: 'タナカハナコ', introduction: 'はなこです。', telephone_number: '09012345678', nickname:'はなちゃん', birth_date: '2000.')
EndUser.create(name: '佐藤たける', name_kana: 'サトウタケル', introduction: 'たけるだよ。', telephone_number: '1111', nickname: 'たけ', birth_date: '1111.11.11', sex: 0, email: "takeru@com", password: "aaaaaa")
EndUser.create(name: '小島花子', name_kana: 'コジマハナコ', introduction: 'はなこだよ。', telephone_number: '2222', nickname: 'はな', birth_date: '2222.22.22', sex: 1, email: "hanako@com", password: "aaaaaa")
EndUser.create(name: '吉田マイケル', name_kana: 'ヨシダマイケル', introduction: 'マイケルデース！', telephone_number: '3333', nickname: 'マイク', birth_date: '3333.33.33', sex: 0, email: "michael@com", password: "aaaaaa")
EndUser.create(name: '赤羽翔太', name_kana: 'アカバネショウタ', introduction: 'しょうただよ。', telephone_number: '4444', nickname: 'しょーた', birth_date: '4444.44.44', sex: 2, email: "shota@com", password: "aaaaaa")
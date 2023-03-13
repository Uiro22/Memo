require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_s # ユーザーの入力値を取得し、数字へ変換しています
input_number = memo_type.chomp

# if文を使用して続きを作成していきましょう。
if input_number == "1"
     puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
     file_name = gets.chomp
     
     puts "メモしたい内容を記入してください。完了したらCtrl＋Dを押します"
     input_memo = STDIN.read
     memo = input_memo.chomp

     CSV.open("#{file_name}.csv", "w") do |csv|
     csv << [memo]
end

else input_number == "2"
     puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
     file_name = gets.chomp
     
     puts "メモの内容です。"
     memo_list = []
    CSV.foreach("#{file_name}.csv") do |row|
    memo_list << row[0]
    puts "#{memo_list.length}. #{row[0]}"
    
    memo = ""
    CSV.foreach("#{file_name}.csv") do |row|
    memo = row[0]
    end

    puts "メモの内容を記入して下さい。Ctrl+Dで保存します。"
    input_memo = STDIN.read
    memo = input_memo.chomp

    CSV.open("#{file_name}.csv", "w") do |csv|
    memo_list.pop
    memo_list << memo
    memo_list.each do |m|
      csv << [m]
    end
end
    puts "メモを更新しました。"
    end
end

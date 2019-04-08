def txtxech
puts "日付,移管先,住所コード,回数,移管先"
date = gets.chomp! #日付
storeid = gets #移管先店舗
t = gets.to_i
l = []
@n = []
@@arr = []
t.times do
adnum = gets #住所コード入力
  l << adnum.chomp! # 改行を削除
end
l.each do |i|
    i.chomp!
    storeid.chomp!
     @n << "\"#{storeid}\",\"#{i}\""
end
fromid = gets.chomp! #移管元店舗
@@arr << "EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt"
file = File.open("EXCHANGE_ADDRESS_tmprate.txt","r")
lines = file.readlines
file.close
#テンプレートのコピーをベツファイルに出力(同DIR)
file = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","w")
file.write(lines.join)
file.close()
#必要事項に応じて書き込み
f = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","r")
buffer = f.read();
buffer.gsub!(/from/,"#{fromid}")
f = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","w")
f.write(buffer)
 @n.each do |v|
    f.puts v
 end
f.close()
puts "--------------------------------"
puts "生成完了"
puts "--------------------------------"
end
txtxech

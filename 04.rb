#パラメータファイル置き換え
puts "日付、移管先、回数、住所コード、移管元"
date = gets.chomp! #日付
storeid = gets #移管先店舗
t = gets.to_i
l = []
@n = []
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
f = File.open("EXCHANGE_ADDRESS_tmprate.txt","r")
buffer = f.read();
buffer.gsub!(/from/,"#{fromid}")
f = File.open("EXCHANGE_ADDRESS_tmprate.txt","w")
f.write(buffer)
 @n.each do |v|
    f.puts v
 end
f.close()

File.open("EXCHANGE_ADDRESS_tmprate.txt","a") do |text|
file = File.open("EXCHANGE_ADDRESS_tmprate.txt","r")
lines = file.readlines
file.close

#ベツファイルに出力(同DIR)
file = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","w")
file.write(lines.join)
text.close()

#ファイル名変更
#File.rename('bar.txt', 'EXCHANGE_ADDRESS_tmprate.txt')
end

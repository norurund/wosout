class Wos
def txtxech
puts "日付,移管先,住所コード,回数,移管先"
date = gets.chomp! #日付
storeid = gets #移管先店舗
t = gets.to_i
l = []
@n = []
@arr = []
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
@arr << "EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt"
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
def jobnet
date = gets.to_i
file1 = File.open("jobnet_#{date}0930.txt","w")
file2 = File.open("jobnet_tmprate.txt","r")
file3 = File.open("joborder.txt","r")
lines2 = file2.readlines
lines3 = file3.readlines
file1.write(lines2.join)
file1.write(lines3.join)
file1.close()
end
job = Wos.new
  while true do
    puts "[0]ジョブネットファイル生成\n[1]パラメータファイル生成"
    input = gets.to_i
    if input == 0
      job.txtxech
    elsif input == 1
      job.jobnet
    else
      puts "無効な数字"
      break
  end
end
end

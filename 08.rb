class Wos
  バッチ生成
  Encoding.default_external = 'UTF-8'
  def txtxech
      puts "日付,移管先,住所コード,回数,移管先"
      date = gets.chomp! #日付
      storeid = gets.chomp! #移管先店舗
      t = gets.to_i #回数
      l = []
      @n = []
      @arr = []
      if t > 0
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
        @arr << "EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt" #バッチ名保存
        題名を別ファイルに留保
        anfile = File.open("tmp_#{date}.txt","w")
        anfile.write(@arr.join)
        anfile.close()
        file = File.open("adbat.txt","r")
        lines = file.readlines
        file.close
        テンプレートのコピーをベツファイルに出力(同DIR)
        file = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","w")
        file.write(lines.join)
        file.close()
        住所コード書き込み
        f = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","r")
        buffer = f.read();
        buffer.gsub!(/from/,"#{fromid}")
        f = File.open("EXCHANGE_ADDRESS_#{date}_#{fromid}TO#{storeid}.txt","w")
        f.write(buffer)
         @n.each do |v|
            f.puts v
         end
        f.close()
     else #店舗移管の場合
      fromid = gets.chomp! #移管元店舗
        @arr << "EXCHANGE_SHOP_#{date}_#{fromid}TO#{storeid}.txt" #バッチ名保存
        題名を別ファイルに留保
        anfile = File.open("tmp_#{date}.txt","w")
        anfile.write(@arr.join)
        anfile.close()
        file = File.open("shbat.txt","r")
        lines = file.readlines
        file.close
        file = File.open("EXCHANGE_SHOP_#{date}_#{fromid}TO#{storeid}.txt","w")
        file.write(lines.join)
        file.close()
        f = File.open("EXCHANGE_SHOP_#{date}_#{fromid}TO#{storeid}.txt","r")
        buffer = f.read();
        buffer.gsub!(/from/,"#{fromid}")
        buffer.gsub!(/to/,"#{storeid}")
        f = File.open("EXCHANGE_SHOP_#{date}_#{fromid}TO#{storeid}.txt","w")
        f.write(buffer)
        f.close()
     end
      puts "--------------------------------\n生成完了\n--------------------------------"
    end

  def jobxp
    puts "日付"
    date = gets.to_i
    @arr = []
      ファイル書き出し
      @ar = File.open("tmp_#{date}.txt","r").readlines
      lnum = @ar.count
        @ar.each_index do |l|
           jnum = l+1
           title = @ar[l]
           title.include?("ADDRESS") ? @arr = File.open("address.txt","r").readlines : @arr =  File.open("shop.txt","r").readlines
           file1 = File.open("jobnet_#{date}0930.txt","a")
             @arr.each do |i|
              file1.puts i
             end
           file1.close()
           正規表現
           jobfile = File.open("jobnet_#{date}0930.txt","r")
           buffer = jobfile.read()
             buffer.gsub!(/pre_job 0/, "\n")
             (buffer.gsub!(/title/,"#{title}"); buffer.gsub!(/\[\"/,""); buffer.gsub!(/\"\]/,""))
             (buffer.gsub!(/date/,"#{date}"); buffer.gsub!(/jnum/,"#{jnum}"); buffer.gsub!(/pnum/,"#{l}"); buffer.gsub!(/lnum/,"#{lnum}"))
             buffer.gsub!(/\n(\s|　)*\n/, "\n")
           jobfile = File.open("jobnet_#{date}0930.txt","w")
           jobfile.write(buffer)
           jobfile.close()
        end
  end

  def jobnet
    puts "日付"
    date = gets.to_i
    file1 = File.open("jobnet_#{date}0930.txt","w")
    file2 = File.open("jobnet_tmprate.txt","r")
    lines2 = file2.readlines
    file1.write(lines2.join)
    file1.close()
  end

  job = Wos.new

   while true do
      puts "[0]パラメータ生成\n[1]ジョブネット初期生成\n[2]ジョブネット完成\n[3]終了"
      input = gets.to_i
      if input == 0
        job.txtxech
      elsif input == 1
        job.jobnet
      elsif input == 2
        job.jobxp
      elsif input == 3
        puts "終了"
        break
    end
   end

end

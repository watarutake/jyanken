puts "じゃんけん..."

#ーーーーーじゃんけんプログラムーーーーーー
def jyanken()
	puts " 0 (グー)  1 (チョキ) 2 (パー) 3 (戦わない) ※半角英数字入力"
	@jyanken_type = gets.chomp.to_i
	if @jyanken_type == 0
		jyanken_jibun = "あなた：（グー）を出しました"
	elsif @jyanken_type == 1
		jyanken_jibun = "あなた：（チョキ）を出しました"
  elsif @jyanken_type == 2
    jyanken_jibun = "あなた：（パー）を出しました"
  elsif @jyanken_type == 3
    jyanken_jibun = "あなたは、戦わない選択をしました"  
  else
  	jyanken_jibun = "入力エラーにより反則です。※半角英数字入力"
  end
  puts "ホイ！"
  puts "---------------------"
  puts jyanken_jibun
  @aite_jyanken = rand(2)
  if @aite_jyanken == 0
    jyanken_aite = "相手：(グー)を出しました"
  elsif @aite_jyanken == 1
    jyanken_aite = "相手：(チョキ)を出しました"
  elsif @aite_jyanken == 2
    jyanken_aite = "相手：(パー)を出しました"	
  end
  if @jyanken_type <= 3
  	puts jyanken_aite
  end
  puts "---------------------"
#ーーーーーじゃんけん勝敗の定義ーーーーーー  
  if @jyanken_type == @aite_jyanken
    puts "あいこで〜"
    @jyanken_katimake = 0
  elsif (@jyanken_type - @aite_jyanken == -1) || (@jyanken_type - @aite_jyanken == 2)
    @jyanken_katimake = 1 #じゃんけんで自分が勝ち
  else
    @jyanken_katimake = 2 #じゃんけんで自分が負け
  end
end
	
#ーーーーーあっち向いてホイプログラムーーーーーー
def aittimuitehoi()
	puts "あっち向いて〜"
	puts "0 (上) 1 (下) 2 (左) 3 (右)"
	@attimuite_type = gets.chomp.to_i
	if @attimuite_type == 0
		attimuite_jibun = "あなた：(上)"
	elsif @attimuite_type == 1
		attimuite_jibun = "あなた：(下)"
	elsif @attimuite_type == 2
		attimuite_jibun = "あなた：(左)"
	elsif @attimuite_type == 3
		attimuite_jibun = "あなた：(右)"
	else 	
		attimuite_jibun = "入力エラーですじゃんけんに戻ります※半角英数字入力"
	end
	puts "ホイ！"
	puts "---------------------"
	puts attimuite_jibun
	@aite_attimuite = rand(3)
	if @aite_attimuite == 0
	  attimuite_aite = "相手：(上)"
	elsif @aite_attimuite == 1
	  attimuite_aite = "相手：(下)"
  elsif @aite_attimuite == 2
	  attimuite_aite = "相手：(左)"	
	elsif @aite_attimuite == 3
	  attimuite_aite = "相手：(右)"	  
  end
  if @attimuite_type <= 3
  	puts attimuite_aite
  end
  puts "---------------------"
#ーーーーーあっち向いてホイ勝敗の定義ーーーーーー    
  if @attimuite_type == @aite_attimuite
  	@attimuite_kakimate = 0 #勝負がついた
  else
  	@attimuite_kakimate = 1
  end
end


@jyanken_katimake = 0#じゃっんけんスタート値
@attimuite_kakimate = 2#あっち向いてホイスタート値


#ーーーーープログラムの流れーーーーーー
while @attimuite_kakimate == 1 || @attimuite_kakimate == 2 #あっち向いてホイの勝敗がつくまでループ
	while @jyanken_katimake == 0#じゃんけんの勝敗がつくまでループ
 	  jyanken()
 	end
 if @jyanken_katimake != 0
   if @jyanken_type >= 3#戦わない選択をしたらブレイク
   	break
   end
   aittimuitehoi()
     if @attimuite_kakimate == 0#あっち向いてホイの勝敗がついたらブレイク
     	break
     end
   @attimuite_kakimate = 2#じゃっんけんスタート値
 	 @jyanken_katimake = 0#あっち向いてホイスタート値
 	 puts "じゃんけん..."
 end
end
 
 
#ーーーーー結果発表ーーーーーー 
 if @attimuite_kakimate == 0 && @jyanken_katimake == 1
 	puts "あなたの勝ちです"
 elsif @jyanken_type == 3
 	puts "勝負が成り立ちませんでした"
 else
 	puts "あなたの負けです"
 end
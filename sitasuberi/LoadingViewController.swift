//
//  LoadingViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/25.
//

import UIKit

class LoadingViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var countLabel: UILabel!
    var time = 0
    var timer = Timer()
    var i = 0
    var hayakutiArray = [String]()
    var selectArray = [String]()
    
    let agyolist: [String] = ["　　　　　　　　　　　　　　　　　あら、また、赤い旗が上がった、かった、かった、赤がかった　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あんなかたいかたはなかなかないわ、あなただったら、あんな若い方は笑ったら、たまらなかったわ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　爽やかな朝、あたたかな朝だ。はなが咲いたまっかなばらが、ぱっと咲いた　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　朝は魚だったから、晩は野菜が買いたかったが、高かったから、買わなかった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","川から上がったかっぱさんは、さらが乾いたから、頭がなかなか働かなかった。なんだか頭がガンガンなった。からかさが買いたかったが、高かったから買わなかった。かっぱはあーんあーん泣いた。山からからすが、カラカラ笑った。　▼次へ","　　　　　　　　　　　　　　　　　青なっぱ、赤なっぱ、赤なっぱ、青なっぱ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　青い家をおいおい売る・上へ青い葵をおいおい植える。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お綾や親におあやまり、お綾や八百屋におあやまりとおいい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　いちり、にり、しちり、いちいちに、ぎりぎり、しちり、といった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　きみじしん、いんぎんに、いちいちに、いいに、いきなさい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　いまぎかいはかいさいしないほうがいい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　しんしんぎいん、、いいんにしんにん、いちいちきびんにぎじをしんぎ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　しきりにしちりん、しちりんにひ、しちりんしきにしみ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　威勢のいい医者　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　戌年の次は亥の年だ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　飯島石七郎の言い分に偽りがある　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　抜きにくい釘、引き抜きにくい釘、釘抜でぬく釘　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　歌うたいが歌うたいにきて歌うたえというが歌うたいが歌うだけ歌い切れば歌うたうけれども、歌うたいだけ歌歌いきれないから歌歌わぬ。　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　謡うたいの前で、うたえうたえと責められて私もうたいにくい謡を歌うたことはあるけれど、謡うたいの前で謡うたうほど、うたいにくい謡をうとうたことはない。　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ぜんぜんてれて、せんせー、てんで、めーれーせん。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　せんせー、てんでねんねでね、せけんへでてせーぜーねられねばだめだ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　絵扇、絵うちわ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　絵姿になる江差追分　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　蝦夷でくらすも一生、江戸でくらすも一生　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あの映画はいい映画だ、絵の綺麗ないい映画だ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　このおとこのこのホントーの心をとこーとおもーのよ。そのおとこをころそーちおもーのよ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　おっと、そこそこ、そのところを、どんどんほろー、どろをほろー、よこのほーももっとほろー。どろをとろっこにもろー。とろっこをおそー、ごろごろ、ごとごとおもいとろっこをおそー、どんどんおそー。　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　良い本をもっと読もう、この本良い本、ほんものの本。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　この鯉、緋鯉、ここに来い、緋鯉も青い鯉も白い鯉もよっといで。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　老いては負うた子に教えられ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　奥様の前の大きな覚え帳。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お皿のお蓬餅およばれたい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　大どこの大鍋の大まなばし、小どこの小鍋の小まなばし。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　きこりごりごりきをきりに、きこりのこどももきをきりに、のこぎりのおとごりごり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お家の、お庭のお池のお蓮のお葉にお蛙のお子がお三匹止まり遊ばして、お山椒のようなお目おぱちくりおぱちくり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let kagyolist : [String] = ["　　　　　　　　　　　　　　　　　今日、午後、学校で剣劇ごっこ、きっかけ聞く子がごくきかんきで、きっかけ聞く気かきかん気かお小言くいくいきっかけを聞く。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あ神田鍛冶町の、角の乾物屋の勝栗買ったが、固くて噛めない、返しにいったら、勘兵衛のかみさんが帰ってきて、かんしゃく起こしてかりかり噛んだら、かりかりかめた。　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　粉米の生がみ、こごめの生がみ、こんこごめのこなまがみ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　うちの潜戸は栗の木の潜戸、くぐり良い潜り戸、となりの潜り戸は栗の木の潜戸、潜りにくい潜り戸、潜りつければ、潜り良い潜戸。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　京の狂言師が京から今日来て、今日狂言して京の故郷へ帰った。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　菊桐菊桐三菊桐、合わせて菊桐六菊桐。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　菊吉菊吉菊吉切りまで菊吉大吉吉。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　毛虫に欅が、欅に毛虫が、欅と毛虫、毛虫と欅。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　かんかんづくしを言おうなら、蜜柑金柑酒に燗子供に羊羹やりゃ泣かん親の折っかん子がきかん。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　橋の下でかっぱごは河童子産だ。産た子も河童子その子も河童子、親河童子、子河童子。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　河童と亀が賭け事してかちかち山を駆け上がる河童は途中で脚気にかかり葛根湯を飲んでいた亀は構わずかっかかっかと駆け上がって賭けものをすっかり勝ち取った。　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　雀米噛む生米噛むここん小雀小生米噛む。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　くりくり坊主が栗食ってくりくり舞をくりかえしくるりと庫裡へくり込んだ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　黒田さんの黒助が黒茶町に黒鯛を買いに行って黒犬に食いつかれて黒血が流れた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　姉さん前髪さげまえがみ、お前の前髪ハゲ前髪　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　巣鴨駒込駒込巣鴨親鴨小鴨大鴨小鴨　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　赤釜赤合羽　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　長町の長巻紙長巻紙　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　豊後の牛蒡は毛ごぼう長ごぼう長毛長ごぼう　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　御前が午前五時に御膳を五膳召し上がった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　この胡麻殻は生胡麻殻か干胡麻殻か。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　貨客船の旅客　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　農商務省特許局日本銀行国庫局　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　東京特許許可局　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お前の脚絆は川獺の皮の皮脚絆、私の脚絆も川獺の皮の皮脚絆、川向こうで川獺の皮比べしよう。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　うちの客は柿を食う客だ、隣の客も柿を食う客だ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　甲州甲府に紅梅町の穀屋の小僧が米を背負ってこぐり戸をこぐる所で転んでこぶをこしらえてこれからこぐり戸をこぐらないと後悔した。　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　向こうの小山の小寺の小僧が小棚の小鉢の小味噌をこ嘗めて、小頭こきんとこづかれた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　盆米盆ござ盆牛蒡お米の生米おなが米　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　客一人に柿一つ客二人に柿二つ、客三人に柿三つ客四人に柿四つ、客五人に書き五つ客六人に柿六つ、客七人に柿七つ客八人に柿八つ客九人に柿九つ、客十人に柿十。　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　一寸ばりに小小僧が小袈裟に紺ころもに小数珠にこがけて、小坂を小降りに小寺に参り候　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　義歯義眼義手義足　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お台所の切れたお障子からお風がおこうおこうとお吹き遊ばしておすりこ木がおばったりおばったり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ガラガラごめんなさい米屋でございます昨日五升今日五俵　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　小卵大卵大卵小卵　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　城の番場で合羽ほすにわかに天狗風合羽舞い上がり合羽屋が慌てておほりへ落ちた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　怪我負け、怪我勝ち、大怪我、小怪我。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let sagyolist: [String] =  ["　　　　　　　　　　　　　　　　　椰子の実を獅子がくい、菱の実を狒々がくう　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　信州信濃渋谷村、新家の重さんの尻に虱が四匹しがみついて死んだ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　浅草寺の千手観音専念千日千遍拝んで千束町で煎餅買って千食べた　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　笹原さん、佐々木さん、佐々三郎さん、三人早速あさって誘って差し上げましょう。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　梨の芯と茄子の芯は、茄子の芯と梨の芯だけ違い、茄子の芯と梨の芯は梨の芯と茄子の芯だけ違う。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　住吉のすみにすずめが巣を食って、巣早すずめの巣立ちするらん。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　さあさあ、させさせ、ずんずんさせ。騒々しいぞ。しずしずさせ、図々しいぞ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　新設診察室視察。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　かしめのしんざ池の四万四千四百四十匹尻並べて死んどった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　繻子ひじゅす繻子しゅちん　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　大阪市四丁目塩谷の新助さん塩四升しがんで白目むいて死んだ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　猪汁猪鍋猪丼猪シチュー以上猪食試食審査員試食済み新案猪食七種中の四種　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　せんがとこの千なりひょうたん千なって一つ呉りょうというたならば、せんが居らんでようやらぬ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　この牛は月に三石三斗三升三合三勺三歳食う牛にてござ候ほどに、皆寄りとめて下され。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　そんじょそこらのそばかす小僧が措置をそしって逃げたとしても、そちはそれほどそっとこらえてそしらぬ顔とは感心だ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　裏の山椒の木に百舌の子が巣をかけ何と言ってもさえずる立ち聞きすれば君はきんくるまいてくるくるまいてりんと鳴く。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　次へ","　　　　　　　　　　　　　　　　　柄も四尺刃も四尺合わせて八尺の大長刀　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　必死の疾走紙　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　前述の事情前日の実情。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　下駄百足せった二百足　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　書写山の社僧上　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　桑野山には蛇がいるじゃげな牡蛇か牝蛇かわしゃ知らぬじゃが、じゃじゃもじゃもじゃとなくじゃげな。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ちょうこう山しょうこう院ちょうこく寺のしょうこうちょうこう坊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let tagyolist: [String] = ["　　　　　　　　　　　　　　　　　飛んだ、飛んだ、とっとと飛んだ。堂々と飛んで、ちゃっと立て。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　とちった、とちった、とんだドジだと、多田のとっちゃん、ただ地団駄。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　とてちてた、とてちて、とてちて、とてちてたおっと踊った。とんつつ、とんつつ、ととんつつ、どんたく踊りを踊ろうぜ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　田どじょう、あぜどじょう、あぜどじょう、田どじょう。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　うちのつりびんはつぶれぬつりびん、となりのつりびんは、つぶれるつりびん。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　この竹垣に竹立てかけたのは、竹立てかけたかったから、竹立てかけたのです。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　山王の桜の木に猿が三匹下がって、お手と手と手と手と手と手。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　月々に月見る月は多けれど月見る月はこの月の月。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　つるてんつるてんはぎわらてん、やぶれた前垂れあててんてん、夏は寒天ところてん、とう島弁天手をうちゃ合点、一天合中六天、それで私のもとでこてん。　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　手前味噌を並べる手前勝手な父親　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　十日市の藤兵衛さんがとうきびだんご十食って十日目にはてた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　向こうの土手を唐人さんが提灯を十つけて通った　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　天王寺の塔々念仏十申したら仏になるといいな　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　東金の藤右衛門どんの床の間に唐の芋が十あったらばどのこかとうぞ付けて十食うた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　妻堤の月を見つつ待つ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　そこの立った鶴首は白鶴首か黒鶴首かあれこそほんのまっくろくろの黒鶴首。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　貴殿の頭ははげ頭接者の刀は」錆刀。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お旦那のおねまにお蚤がおたんとおよっておとろと思たらお逃げたお逃げた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　向かいのの山のつるつるつるつる首は白鶴首かあい鶴首か真っ黒くろくろつる首。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　向こうの天狗どんよく鼻さし出しなさるなぜそないに鼻さし出しなさると問えばお鼻さし出しなさる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　茶たばこのんでたばこ茶のむ茶たばこたばこ茶々たばこのむ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　行者ののむ茶は下茶か上茶か。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　おらの茶釜は金茶釜隣の茶釜も金茶釜向こうの茶釜も金茶釜三つ合わせて三金茶釜。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　私の娘を茶筅に結わせお茶たてさせたさも立てさせたしご奉公いたさせたさもいたさせたし。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　備中の家中が道中の府中で夜中に焼酎のんで口中が痛んで夢中になった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　上高畑に行くのですか下高畑に行くのですかいいえ上高畑でもなし下高畑でもなし中高畑に行くのです。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　テレピン油を掌に垂らして手と手でもんでおてんてんへつけて見ろ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let nagyolist: [String] = ["　　　　　　　　　　　　　　　　　あのアイヌの女の縫う布の名はなに。あの布は名の無い布なの。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あの女何年いないの。二年いないの。あの女いないのに何をいうの。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　今日の生鱈、奈良生まな鰹。奈良の奈良漬、丸奈良漬け、まんまるまるまる丸奈良漬け。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　長持ちの上に、生麦、生米、生卵。なた豆七粒生米七粒、七粒なた豆、七粒生米。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　のら如来のら如来、三のら如来に、六のら如来。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　生米、生松葉、生すぎっぱ生すぎっぱ、二つ合わせて二生すぎっぱ。生すぎっぱ、生すぎっぱ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　向こうの長押の長薙刀は誰が長薙刀ぞ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　馬屋の前のぬれ生わら　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　どじょうにょろにょろ三にょろにょろ、合わせてにょろにょろ六にょろにょろ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　長町の長眉毛、長町の七曲り長い七曲り、曲がってみれば、曲がりやすい七曲り。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　農閑期の農村で農夫に、兼業家を説いたが銭がないと逃げらた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　年々ふえる年粗捻出、なんとかならぬか泣き言並べた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　七草に七種煮詰めて七草がゆ、七草がゆか、七草汁か。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　七鯰は七鯰では生消化、七鯰煮て食お煮鯰を　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　盗人と濡れ衣担い、悩み拭えず、七日七晩泣き濡れる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ならず者の兄の二の舞にならぬうちに、田舎に赴任、難任務。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　雨に濡れてる濡れ縁の上に、主ない濡れ手拭い。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　二条の西の洞院、西入人形屋の二階で、にわとりが二羽、西向いて逃げた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　佇むな、行くな、戻るな、居座るな、寝るな、起きるな、立つな、座るな。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　西側の庭の楡の木に錦蛇が二匹。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]

    let hagyolist:[String] = ["　　　　　　　　　　　　　　　　　母の頬にほおえみを見、速男はほっとした。母の皮肉なほおえみ、母は母なりの抱負や批判を持っているのだ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　八匹の鉢が八公のはげばちびたいを八針刺した。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　福助福助福袋、ふくふくかついで福袋。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　伝染病予防院予防室、伝染病予防法。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　坊主がびょうぶに上手に坊主の絵を描いた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　かえるひょこひょこ三ひょこひょこ、四ひょこ五ひょこ六ひょこひょこ、七ひょこ八ひょこ九ひょこ十ひょこ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　武具馬具、武具馬具、三武具馬具、合わせて武具馬具、六武具馬具。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　へりふみゃれ、へりふみゃれ、おへりふみゃれ、おへへりおふふみゃれ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　人の非は非とぞにくみて非とすれど、わが非は非とぞ知れぞ非とせず。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　狸百匹、箸百ぜん、天目百杯、棒八百本。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","向こうの方から光り物がふかりふかりふっ飛んできて、向こうの人の頭え、ふたりとふっついた、ふっぱってもふっぱってもとれないから、ふんどすふっかけてふっぱったら、ふたりとも吹っ切れた。　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　坊主が貧乏、非常に不憫と坊主の父母が、奉仕と募金。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　富士のふもとで疱瘡があったと放送があった変事があったら返事をくれ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　パイプの火の不始末から火花を吹いて、本家分家を灰にした。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　繻子、緋繻子、緋沙綾、繻珍、緋縮緬。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　不撓不屈の精神をふだんに養えば、不幸や不遇などは、ふふんと吹きとばせる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　橋善で貝柱の天ぷら八杯食ったら、やっと腹八分目になった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　家の牛こはよい牛こ、隣の牛こもよい牛こ、向こうの牛こもよい牛こ、三つ合わせて三よい三牛こ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　去年の盆も紅木綿の衣（べべ）着て盆をした今年の盆も紅木綿の衣着て盆をした。来年の盆も紅木綿の衣を着て盆をしよう。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　備後の貧乏なお坊さん、豊後へ行って豊後の屏風に備後の貧乏なお坊さんの絵をかいた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let magyolist: [String] = ["　　　　　　　　　　　　　　　　　馬の耳に念仏、寝耳に水。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　梅の実も桃の実もみんなうまい。ママの見舞いにうまい桃の実をもう三つ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　物真似のうまいママの姪。お前の真似もお前のママの真似もみんなうまい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ママの目も耳も胸も、もうみんな見えない。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　すももも桃ももうみんな熟れたから、もう売れよう。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　青巻紙赤巻紙黄巻紙、黄巻紙赤巻紙青巻紙、長巻紙に赤巻紙。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　麦ごみ麦ごみ三麦ごみ、合わせて麦ごみ六麦ごみ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　猫が拝みゃがる犬が拝みゃがる、馬が拝みゃがる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　次へ","家の小僧に、寒三十日、寒念仏を申せと申し付けましたが、申したことやら申さぬことやら、申したら申したと申しましょうが、申さんけりゃこそ、申したと申しませぬ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　天王寺の舞い堂から舞を前との毎度のお使い前度のように舞が舞えるなら、参って　舞いますなれど、前度のように舞が舞えませぬ故、参って舞は舞いませぬ。　　　　　　　　　　　　　　　　　　▼次へ","お宮の前の飴屋に、あんまと尼が雨宿り。雨止むまであんまももうとあんま申す。あんま尼もみ、尼あんまもむ。あんまうまいか尼うまいか、あんまも尼もみなうまい。あんまもおもみやれ、尼もおもみやれ、雨宿り。っぱったら、ふたりとも吹っ切れた。　　▼次へ","　　　　　　　　　　　　　　　　　お盆の上へ団子ころころお盆の上へ団子ころころ、三つ合わせて三盆の上の三団子三つころころ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　樫の木の丸薪、割る丸薪わり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　六曲がり曲がって三曲がり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ちょっと流し目したら、目くじら立てて怒られて、酷い目にあった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　真向こうの店から毎度のお使い、たまにはあかりを持って街を見廻らせろ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　うちの行燈丸行燈、隣の行燈丸行燈、向こうの行燈丸行燈、三つ合わせて三丸丸丸行燈。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　奇妙キテレツ、妙不思議。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let yagyolist:[String] = ["　　　　　　　　　　　　　　　　　弥生の宵、お湯屋へ寄った居合屋さん。やいやい言われて、湯屋でいやいや居合をやる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　居合の用意は良いな。用意はいいよ。良い良い。やあやあ、いよいよ居合をやるぞ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お綾や、宵のうちにお湯屋へおいで。いいお湯だよ。よい湯だねあのお湯屋は。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　やいやい言われ、いやいや家を売るよ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お綾や親におあやまり。お綾やお湯屋へ行くと八百屋にお言い。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　おやおや、八百屋さん、お綾は親とお湯屋よ　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お綾はいやいや八百屋の親を負い、八百屋は嫌々お綾の親を負い。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　良き人のよしとよく見てよしといいし吉野よく見よよき人よく見つ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　役者が役所へ役人に会いに行き、役人が楽屋へ役者に会いに行く。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　八寸紙の歪まんか。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　湯河原に遊びに行って夕月を眺めたら愉快になった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　闇の夜に、勇気を出して湯屋に行き、八百屋にからかわれたお綾。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あやしみとあやしむべきをあやしまず、あやしからぬをあやしむあやし。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　世の中は夢と思うも夢なれや、夢を迷いというも夢なり。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　よいよい、やいのやいのとやいやい言うよって、いややがやいとを据えようわい。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　やいやい言われて山芋を掘り、いやいや山芋をゆでる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let ragyolist:[String] = ["　　　　　　　　　　　　　　　　　いらいらするから笑われる。てれるからからかわれる。だらだらするからあなどられる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　入り口はあかないから、入れるなら裏から入れろ、裏は暗かろうから明かりをくれろ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","す　　　　　　　　　　　　　　　　　りならうろうろ、きょろきょろするから、すぐわかるからすられるな。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　どしゃぶりで道路はどろどろだ。道理で廊下は泥棒の泥足で泥だらけ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　虎をとるなら、虎をとるより鳥をとり、鳥をおとりに虎をとれ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　おどりおどるなら、おどりの道理をならっておどりの道理どおりにおどりをおどれ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　とろろ芋をとるよる苦労より、とろろ芋からとろっとするとろろ汁をとる苦労。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　猪料理、鶴料理、熊料理、狢料理、虎料理、雁料理、鹿料理、鳥料理、色々料理、より取り料理。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　瓜売が瓜売りに出て瓜売れず売り売り帰る瓜売りの声。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あんりゃりゃりゃ、ありゃあ、蟻屋のおりえやい、われぁおれを売りやがったな。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　冷蔵庫から、冷凍料理を出してこいと言ったら冷蔵庫から冷凍料理を出さないで冷蔵庫からビール出してラッパ飲みした。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ラバかロバか、ロバかラバかわからないのでラバとロバをくらべたらロバかラバかわからなかった。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　落第に落胆して、落雷に打たれてのたれ死にした。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　権利濫用で、吏員が離職。官吏の乱脈な利権濫用にぞろぞろ露見。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　六年生の論文大会、明瞭な論旨と理論と力量で優良論文えらばれる。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let wagyolist:[String] = ["　　　　　　　　　　　　　　　　　わらわば笑え、わらわは、笑われるいわれはないわえ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　岩井はお岩へお祝いをいう。お会いしてお祝いを言うわ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　わらなわでは、わなにはよわいわい。岩をゆわえるなわは、わらなわではよわいわよ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　わしの家のわしの木に鷲が止まったから、わしは鉄砲で鷲をうったら、鷲も驚いたがわしも驚いた。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　小岩界わいで祝い事があり、わいわいさわいで祝酒飲んだ。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　若いものが我先に渡しをこいで、川を渡る。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　分け前をもらえぬわけがわからない。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　わたしは、和紙に鰯の絵をかいて、詫び状つけてわたし、和解した。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　渡守が新しい渡し舟で渡初した。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　若殿のわがままは、悪遊び悪知恵がついて、悪ずれするか、若死にするか今が分かれ目。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　わたしの庭で、沸き出ずる泉。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　若菜、若苗、わさびにわらび。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　若者の和気あいあいの笑い声、わしも笑って若返る。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ"]
    
    let uiroulist:[String] = ["拙者親方と申すは、お立合の中に、御存じのお方もござりましょうが、お江戸を発って二十里上方、相州小田原一色町をお過ぎなされて、青物町を登りへおいでなさるれば、欄干橋虎屋藤衛門只今は剃髪致して、円斉となのりまする。　　▼次へ","元朝より大晦日まで、お手に入れまする此の薬は、昔ちんの国の唐人、外郎という人、わが朝へ来り、帝へ参内の折から、この薬を深く籠め置き、用ゆる時は一粒ずつ、冠のすき間より取り出だす。　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　依ってその名を帝より、とうちんこうと賜わる。即ち文字には「頂き、透く、香い」とかいて「とうちんこう」と申す。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","只今はこの薬、殊の外世上に弘まり、方々に似看板を出だし、イヤ、小田原の、灰俵の、さん俵の、炭俵のと色々に申せども、平仮名をもって「ういろう」と記せしは親方円斉ばかり。　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　もしやお立合の内に、熱海か塔の沢へ湯治にお出でなさるるか、又は伊勢御参宮の折からは、必ず門違いなされまするな。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お登りならば右の方、お下りなされば左側、八方が八つ棟、表が三つ棟玉堂造り、破風には菊に桐のとうの御紋を御赦免あって、系図正しき薬でござる。　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　ヤ最前より家名の自慢ばかり申しても、ご存知ない方には、正身の胡椒の丸呑、白河夜船、さらば一粒食べかけて、その気見合いをお目にかけましょう。　　　　　　　　　　　　　　　　　　　　　▼次へ","先ずこの薬をかように一粒舌の上にのせまして、腹内へ納めますると、イヤどうも云えぬは、胃、心、肺、肝がすこやかになりて、薫風咽より来り、口中微涼を生ずるが如し。　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","魚鳥、茸、麺類の食合わせ、其の他、万病速効ある事神の如し。さて、この薬、第一の奇妙には、舌のまわることが、銭ゴマがはだしで逃げる。ひょっと舌がまわり出すと、矢も盾もたまらぬじゃ。　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　そりゃそりゃ、そらそりゃ、まわってきたわ、まわってくるわ。アワヤ咽、さたらな舌に、カ牙サ歯音、ハマの二つは唇の軽重、開合さわやかに、　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　あかさたなはまやらわ、おこそとのほもよろを、一つへぎへぎに、へぎほしはじかみ、盆まめ、盆米、盆ごぼう、摘蓼、摘豆、つみ山椒、書写山の社僧正、　　　　　　　　　　　　　　　　　　　　▼次へ","粉米のなまがみ、粉米のなまがみ、こん粉米の小生がみ、繻子ひじゅす、繻子、繻珍、親も嘉兵衛、子も嘉兵衛、親かへい子かへい、子かへい親かへい、ふる栗の木の古切口。　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","雨合羽か、番合羽か、貴様のきゃはんも皮脚絆、我等がきゃはんも皮脚絆、しっかわ袴のしっぽころびを、三針はりながにちょっと縫うて、ぬうてちょっとぶんだせ、かわら撫子、野石竹。　　　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　のら如来、のら如来、三のら如来に六のら如来。一寸先のお小仏におけつまずきゃるな、細溝にどじょにょろり。京のなま鱈奈良なま学鰹、ちょっと四、五貫目、　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　お茶立ちょ、茶立ちょ、ちゃっと立ちょ茶立ちょ、青竹茶筅でお茶ちゃっと立ちゃ。来るわ来るわ何が来る、高野の山のおこけら小僧。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","狸百匹、箸百膳、天目百杯、棒八百本。武具、馬具、ぶぐ、ばぐ、三ぶぐばぐ、合わせて武具、馬具、六ぶぐばぐ。菊、栗、きく、くり、三菊栗、合わせて菊、栗、六菊栗。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","麦、ごみ、むぎ、ごみ、三むぎごみ、合わせてむぎ、ごみ、六むぎごみ。あの長押の長薙刀は、誰が長薙刀ぞ。向こうの胡麻がらは、荏のごまがらか、真ごまがらか、あれこそほんの真胡麻殻。　　　　　　　　　　　　　　　　　　　　▼次へ","　　　　　　　　　　　　　　　　　がらぴい、がらぴい風車、おきゃがれこぼし、おきゃがれ小法師、ゆんべもこぼして又こぼした。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","たあぷぽぽ、たあぷぽぽ、ちりから、ちりから、つったっぽ、たっぽたっぽ一丁だこ、落ちたら煮て食お、煮ても焼いても食われぬものは、五徳、鉄球、かな熊童子に、石熊、石持、虎熊、虎きす　　　　　　　　　　　　　　　　　　　▼次へ","あ中にも、東寺の羅生門には、茨木童子がうで栗五合つかんでおむしゃる、かの頼光のひざもと去らず。鮒、きんかん、椎茸、定めて後段な、そば切り、そうめん、うどんか、愚鈍な小新発地。　　　　　　　　　　　　　　　　　　　　▼次へ","小棚の、小下の、小桶に、こ味噌が、こ有るぞ、小杓子、こ持って、こすくって、こよこせ、おっと合点だ、心得たんぼの川崎、神奈川、程ヶ谷、戸塚は、走って行けば、やいとを摺りむく、三里ばかりか、　　　　　　　　　　　　　　▼次へ","藤沢、平塚、大磯がしや、小磯の宿を七つ起きして、早天早々、相州小田原とうちん香、隠れござらぬ貴賤群衆の花のお江戸の花ういろう、あれあの花を見てお心をおやわらぎやという。　　　　　　　　　　　　　　　　　　　　　　　▼次へ","小産子、這子に至るまで、この外郎の御評判、ご存知ないとは申されまいまいつぶり、角出せ、棒出せ、ぼうぼうまゆに、　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼次へ","臼、杵すりばち、ばちばちぐゎらぐゎらぐゎらと、羽目を弛して今日お出でのいずれも様に上げねばならぬ売らねばならぬと、息せい引っぱり、東方世界の薬の元〆、薬師如来も照覧あれとホホ敬って、ういろうはいらっしゃりませぬか　▼次へ"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gyo = UserDefaults.standard.string(forKey: "gyo")
        switch gyo {
        case "agyo":
            hayakutiArray = agyolist
        case "kagyo":
            hayakutiArray = kagyolist
        case "sagyo":
            hayakutiArray = sagyolist
        case "tagyo":
            hayakutiArray = tagyolist
        case "nagyo":
            hayakutiArray = nagyolist
        case "hagyo":
            hayakutiArray = hagyolist
        case "magyo":
            hayakutiArray = magyolist
        case "yagyo":
            hayakutiArray = yagyolist
        case "ragyo":
            hayakutiArray = ragyolist
        case "wagyo":
            hayakutiArray = wagyolist
        case "uirou":
            hayakutiArray = uiroulist
        default:
            break
        }
        
        let count = UserDefaults.standard.string(forKey: "count")
        switch count {
        case "3":
            i = 3
        case "5":
            i = 5
        case "8":
            i = 8
        case "10":
            i = 10
        case "15":
            i = hayakutiArray.count
        default:
            break
        }
        
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        countLabel.text = String(time)
        hayakutiArray.shuffle()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 160
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! NewCollectionViewCell
        
        print("\(i)")
        print("\(hayakutiArray)")
        let selectArray = Array(hayakutiArray[i])
        
        print("表示されるのは\(i)")
        let length = selectArray.count
        if indexPath[1] < length {
            cell.label.text = String((selectArray[indexPath[1]]))
            
            
            if String((selectArray[indexPath[1]])) == "ー"{
                let angle = 90 * CGFloat.pi / 180
                let affine = CGAffineTransform(a: cos(angle), b:sin(angle),
                                               c: sin(angle), d: -cos(angle),
                                               tx: 0, ty: 0)
                cell.label.transform = affine
                
            }else if String(selectArray[indexPath[1]]) == "、" || String(selectArray[indexPath[1]]) == "、" {
                cell.label.textAlignment = .right
                cell.label.text = String(selectArray[indexPath[1]]) + "\n"
            }
        }else {
            cell.label.text = ""
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 107 || indexPath.item == 108 || indexPath.item == 109 {
            i = i - 1
            print("表示\(i)")
            
            collectionView.reloadData()
            
            
            if i == 0 {
                
                let syuryo2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "Syuryo2VC") as! Syuryo2ViewController
                timer.invalidate()
                syuryo2ViewController.number = Int.random(in: 0...1)
                if syuryo2ViewController.number == 0 {
                    syuryo2ViewController.sutaImage = UIImage(named: "emoji1.png")!
                }else{
                    syuryo2ViewController.sutaImage = UIImage(named: "emoji2.png")!
                }
                self.navigationController?.pushViewController(syuryo2ViewController, animated: true)
                
                
                
            }
        }
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
    }
    
}

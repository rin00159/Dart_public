void main(List<String> args) {
  print(fluits.apple);
  const i=0;
  const ii=i+5;
  print(ii);
  const add0=addition(9,3);//
  print(add0.v);//結局、フィールドの呼び出し(つまり関数呼び出し)を定数式上でできないのでこうなるが、おそらく唯一のコンパイル時に、定数式を計算できる関数もどき;実行時はフィールド呼び出ししか行わないため、定数式の初期化を関数で行ったと言っても過言ではない;
  const ivf=IF(true,0,54);
  print(ivf.v);
  const ivf2=IF(false,0);
  print(ivf2.v);
  const sw=HSWITCH3(1,20,10,11,12);
  print(sw.v);
  const swn=HSWITCHN10(1,def:"def",t4:"4n",t9:"9n");
  print(swn.v);
  const sw10=HSWITCH10(2,"def10",".0",".1");
  print(sw10.v);
  const num ai=0;
  const num di=1.0;
  const asv=AS<int>(ai,-1);
  print(asv.v);
  const asv2=AS<int>(di,-1);
  print(asv2.v);
  print(const exponentiation(2,8).v);
  print(ALL_AND(true).v);print(ALL_AND(true,false).v);print(ALL_AND(false,true).v);
  print(ALL_OR(true).v);print(ALL_OR(true,false).v);print(ALL_OR(false,false).v);
}
/*
これらの定数コンストラクタで計算するもの(コンパイル時計算コンストラクタと呼ぶことにする)は、結果をvに格納する
 */
class addition{
  const addition(a,b):v=a+b;
  final num v;
}
class subtraction{
  const subtraction(a,b):v=a-b;
  final num v;
}
class multiplication{
  const multiplication(a,b):v=a*b;
  final num v;
}
class division{
  const division(a,b):v=a/b;
  final num v;
}
class divisionInt{
  const divisionInt(a,b):v=a~/b;
  final int v;
}
class dividend{
  const dividend(a,b):v=a%b;
  final num v;
}
class exponentiation{//べき乗;a^8が上限だが余裕で拡張可能
  const exponentiation(a,int b):v=//演算順序に注意!!括弧を外すと想定通りに動きません。
    1*(b<=0?1:
    a*(b<=1?1:
    a*(b<=2?1:
    a*(b<=3?1:
    a*(b<=4?1:
    a*(b<=5?1:
    a*(b<=6?1:
    a*(b<=7?1:a))))))));
  final num v;
}
///a?b:cの方が良い
class IF<T>{
  const IF(bool bool_v,T a,[T? b]):v=bool_v?a:b;//bは未指定だと当然nullになる
  final T? v;
}
///bool_v?a:b;;bool_v?a:b0==false?b:v0;;bool_v?a:b0==false?b:b1==false?v0:v1;;の様な値の分岐をコンパイル時に計算し、実現する;
class IFs<T>{
  const IFs(bool bool_v,T a,[T? b,bool?b0,T?v0,bool?b1,T?v1,bool?b2,T?v2,bool?b3,T?v3]):v=
    bool_v?a:
    b0==null?b:b0==false?b:
    b1==null?v0:b1==false?v0:
    b2==null?v1:b2==false?v1:
    b3==null?v2:b3==false?v2:
    v3;
  final T? v;
}
///iが指定したindexの要素になる。その要素がnullだったり、iが範囲外だった時にdefの値になる
class HSWITCH3<T>{
  const HSWITCH3(int i,T?def,[T?t0,T?t1,T?t2]):v=//配列アクセスが、定数コンストラクタでは行えないのでこうして実装する
    i==0?t0==null?def:t0:
    i==1?t1==null?def:t1:
    i==2?t2==null?def:t2:
    def;
  final T?v;
}
class HSWITCH10<T>{
  const HSWITCH10(int i,T?def,[T?t0,T?t1,T?t2,T?t3,T?t4,T?t5,T?t6,T?t7,T?t8,T?t9]):v=//配列アクセスが、定数コンストラクタでは行えないで
    i==0?t0==null?def:t0:
    i==1?t1==null?def:t1:
    i==2?t2==null?def:t2:
    i==3?t3==null?def:t3:
    i==4?t4==null?def:t4:
    i==5?t5==null?def:t5:
    i==6?t6==null?def:t6:
    i==7?t7==null?def:t7:
    i==8?t8==null?def:t8:
    i==9?t9==null?def:t9:
    def;
  final T?v;
}
class HSWITCHN3<T>{
  const HSWITCHN3(int i,{T?def,T?t0,T?t1,T?t2}):v=//配列アクセスが、定数コンストラクタでは行えないで
    i==0?t0==null?def:t0:
    i==1?t1==null?def:t1:
    i==2?t2==null?def:t2:
    def;
  final v;
}
class HSWITCHN10<T>{
  const HSWITCHN10(int i,{T?def,T?t0,T?t1,T?t2,T?t3,T?t4,T?t5,T?t6,T?t7,T?t8,T?t9}):v=//配列アクセスが、定数コンストラクタでは行えないで
    i==0?t0==null?def:t0:
    i==1?t1==null?def:t1:
    i==2?t2==null?def:t2:
    i==3?t3==null?def:t3:
    i==4?t4==null?def:t4:
    i==5?t5==null?def:t5:
    i==6?t6==null?def:t6:
    i==7?t7==null?def:t7:
    i==8?t8==null?def:t8:
    i==9?t9==null?def:t9:
    def;
  final v;
}
/*

 */
///tに該当する要素があるindexをvに格納。等価がなければdef(-1がデフォ);重複する要素がtnに指定された場合に後ろの要素が該当することはないので、名前引数版は有効では無い
class HRSWITCH3<T>{
  const HRSWITCH3(T t,[int def=-1,T?t0,T?t1,T?t2]):v=//配列アクセスが、定数コンストラクタでは行えないのでこうして実装する
    t==t0?0:t==t1?1:
    t==t2?2:def;
  final int v;
}
class HRSWITCH10<T>{
  const HRSWITCH10(T t,[int def=-1,T?t0,T?t1,T?t2,T?t3,T?t4,T?t5,T?t6,T?t7,T?t8,T?t9]):v=//配列アクセスが、定数コンストラクタでは行えないのでこうして実装する
    t==t0?0:t==t1?1:
    t==t2?2:t==t3?3:
    t==t4?4:t==t5?5:
    t==t6?6:t==t7?7:
    t==t8?8:t==t9?9:
    def;
  final int v;
}
/*

 */
///コンパイル時に;iをUにキャストしようとする。できなければ、uを返す;コンパイル時なら、コストを無視できる。
class AS<U>{
  const AS(dynamic i,U u):v=i is U?i:u;
  final U v;
}
/*

 */
class ALL_AND {//全てがtrueならtrueを返す;コンパイル時に計算する
    const ALL_AND(bool t0,[bool?t1,bool?t2,bool?t3,bool?t4,bool?t5,bool?t6,bool?t7,bool?t8,bool?t9]):v=
    t0==false?false:
    t1==null?true:t1==false?false:
    t2==null?true:t2==false?false:
    t3==null?true:t3==false?false:
    t4==null?true:t4==false?false:
    t5==null?true:t5==false?false:
    t6==null?true:t6==false?false:
    t7==null?true:t7==false?false:
    t8==null?true:t8==false?false:
    t9==null?true:t9;
  final bool v;
}
class ALL_OR {//全てがfalseならfalseを返す;コンパイル時に計算
    const ALL_OR(bool t0,[bool?t1,bool?t2,bool?t3,bool?t4,bool?t5,bool?t6,bool?t7,bool?t8,bool?t9]):v=
    t0==true?true:
    t1==null?false:t1==true?true:
    t2==null?false:t2==true?true:
    t3==null?false:t3==true?true:
    t4==null?false:t4==true?true:
    t5==null?false:t5==true?true:
    t6==null?false:t6==true?true:
    t7==null?false:t7==true?true:
    t8==null?false:t8==true?true:
    t9==null?false:t9;
  final bool v;
}
class BOOL_COUNT {//trueの数をカウント;コンパイル時に計算
    const BOOL_COUNT(bool t0,[bool?t1,bool?t2,bool?t3,bool?t4,bool?t5,bool?t6,bool?t7,bool?t8,bool?t9,bool?t10,bool?t11]):v=
    (t0?1:0)+
    (t1==null?0:(t1?1:0)+
    (t2==null?0:(t2?1:0)+
    (t3==null?0:(t3?1:0)+
    (t4==null?0:(t4?1:0)+
    (t5==null?0:(t5?1:0)+
    (t6==null?0:(t6?1:0)+
    (t7==null?0:(t7?1:0)+
    (t8==null?0:(t8?1:0)+
    (t9==null?0:(t9?1:0)+
    (t10==null?0:(t10?1:0)+
    (t11==null?0:(t11?1:0))))))))))));
  final int v;
}
class BOOL_TO_BITMAP {//boolの集合をbitmapで解釈し、intに変換;コンパイル時に計算する
    const BOOL_TO_BITMAP(bool t0,[bool?t1,bool?t2,bool?t3,bool?t4,bool?t5,bool?t6,bool?t7,bool?t8,bool?t9,bool?t10,bool?t11]):v=
    (t0?1:0)+
    (t1==null?0:(t1?2:0)+
    (t2==null?0:(t2?4:0)+
    (t3==null?0:(t3?8:0)+
    (t4==null?0:(t4?0x10:0)+
    (t5==null?0:(t5?0x20:0)+
    (t6==null?0:(t6?0x40:0)+
    (t7==null?0:(t7?0x80:0)+
    (t8==null?0:(t8?0x100:0)+
    (t9==null?0:(t9?0x200:0))+
    (t10==null?0:(t10?0x400:0))+
    (t11==null?0:(t11?0x800:0))))))))));
  final int v;
}
/*

 */
///これを継承するものは、「static const」を利用した列挙型でなければならない(ルール);それを示す為のクラス;enumがフィールドを宣言することは可能だが、enum要素に対応するコンパイル時定数を設定できないので、有用;enumで「static const」を利用することもできるが、列挙値を1つは設定させられるのでぶれてしまう。
abstract class ENUM{}
class fluits extends ENUM{
  static const apple=0;//fluits.apple
  static const lemon=1;
}
///ENUMAUTO;これを継承するものは、コンストラクタを利用したenumを実装する。そのenumの値は任意で設定可能;
abstract class ENUMA<T>{
  const ENUMA();
  // static const c0=0,c1=1,c2=2;//例
}
class ENUMA_i<T>extends ENUMA<T>{
  const ENUMA_i(T i):v=
    i==c0?0:
    i==c1?1:
    i==c2?2:
    -1;
  /*
  const ENUMA_i(T i):v=//順序を入れ替えたもの。enumよりは若干大変だが、この様に簡単に入れ替えれる。
    i==c1?0:
    i==c0?1:
    i==c2?2:
    -1;
   */
  final v;
  static const c0=0,c1=1,c2=2;//「c_」が渡されたら、「r_」が返ってくる、コンパイル時にそれを実行する;べつに直接記述してもいい。
}
class ENUMA_s<T>extends ENUMA<T>{
  const ENUMA_s(T i):v=
    i==c0?r0:i==c1?r1:
    i==c2?r2:-1;
  final v;
  static const c0=0,c1=1,c2=2;
  static const r0="0",r1="1",r2="2";
}
/*
関数は定数式では呼び出せず、
コンストラクタぐらいしか呼び出せない
*/
system  "l ",.z.x 0;
\c 50 200

.test.t:([]sym:3#`ibm;time:10:01:01 10:01:04 10:01:08;price:100 101 105);
.test.q:([]sym:9#`ibm;time:10:01:01+til 9;ask:100 103 103 104 104 107 108 107 108;bid:98 99 102 103 103 104 106 106 107);
.test.f:`sym`time;
.test.w:-2 1+\:.test.t`time;

t:([] a:til 10);

tests:
 ((".test.a:0; do[10;.test.a+:1]; .test.a";10);
  / read and assign
  ("aa";"*denied*");
  ("aa:10";"*denied*");
  (".test.a:10";10);
  (".test.a@:10";"*assign*");
  ("{.test.a@:10}[]";"*assign*");
  (".test.a!:10";"*assign*");
  ("{.test.a!:10}[]";"*assign*");
  (".test.a?:10";"*assign*");
  ("{.test.a?:10}[]";"*assign*");
  ("{x:(),10;x;x,:10;a:(),10;a,:20;a;.test.a:10;.test.a+:10;.test.a}[]";20);
  (".Q:10";"*denied*");
  ("{.q`value}[]";"*denied*");
  / restricted fns
  ("hopen 1";"*denied*");
  ("{hopen 1}[]";"*denied*");
  (".[hopen;(),1]";"*denied*");
  ("{.[hopen;(),1]}[]";"*denied*");
  ("hdel `.test.a";"*denied*");
  ("{hdel `.test.a}[]";"*denied*");
  (".[hdel;(),`.test.a]";"*denied*");
  ("{.[hdel;(),`.test.a]}[]";"*denied*");
  ("hclose 1";"*denied*");
  ("{hclose 1}[]";"*denied*");
  (".[hclose;(),1]";"*denied*");
  ("{.[hclose;(),1]}[]";"*denied*");
  ("hcount 1";"*denied*");
  ("{hcount 1}[]";"*denied*");
  (".[hcount;(),1]";"*denied*");
  ("{.[hcount;(),1]}[]";"*denied*");
  ("read0 1";"*denied*");
  ("{read0 1}[]";"*denied*");
  (".[read0;(),1]";"*denied*");
  ("{.[read0;(),1]}[]";"*denied*");
  ("read1 1";"*denied*");
  ("{read1 1}[]";"*denied*");
  (".[read1;(),1]";"*denied*");
  ("{.[read1;(),1]}[]";"*denied*");
  ("(2::) 1";"*denied*");
  ("{(2::) 1}[]";"*denied*");
  (".[(2::);(),1]";"*denied*");
  ("{.[(2::);(),1]}[]";"*denied*");
  ("1 0: 1";"*denied*");
  ("{1 0: 1}[]";"*denied*");
  (".[0:;(),1]";"*denied*");
  ("{.[0:;(),1]}[]";"*denied*");
  ("1 1: 1";"*denied*");
  ("{1 1: 1}[]";"*denied*");
  (".[1:;(),1]";"*denied*");
  ("{.[1:;(),1]}[]";"*denied*");
  ("1 2: 1";"*denied*");
  ("{1 2: 1}[]";"*denied*");
  (".[2:;(),1]";"*denied*");
  ("{.[2:;(),1]}[]";"*denied*");
  ("exit `";"*denied*");
  ("{exit `}[]";"*denied*");
  (".[exit;(),`]";"*denied*");
  ("{.[exit;(),`]}[]";"*denied*");
  ("save 1";"*denied*");
  ("{save 1}[]";"*denied*");
  (".[save;(),1]";"*denied*");
  ("{.[save;(),1]}[]";"*denied*");
  ("rsave 1";"*denied*");
  ("{rsave 1}[]";"*denied*");
  (".[rsave;(),1]";"*denied*");
  ("{.[rsave;(),1]}[]";"*denied*");
  ("load 1";"*denied*");
  ("{load 1}[]";"*denied*");
  (".[load;(),1]";"*denied*");
  ("{.[load;(),1]}[]";"*denied*");
  ("rload 1";"*denied*");
  ("{rload 1}[]";"*denied*");
  (".[rload;(),1]";"*denied*");
  ("{.[rload;(),1]}[]";"*denied*");
  ("`a dsave `a";"*denied*");
  ("{`a dsave `a}[]";"*denied*");
  (".[dsave;(),1]";"*denied*");
  ("{.[dsave;(),1]}[]";"*denied*");
  ("1 setenv 1";"*denied*");
  ("{1 setenv 1}[]";"*denied*");
  (".[setenv;(),1]";"*denied*");
  ("{.[setenv;(),1]}[]";"*denied*");
  / mixed fns
  ("value(+)";"*only enums*");
  ("{value(+)}[]";"*only enums*");
  (".[value;(),(+)]";"*only enums*");
  ("{.[value;(),(+)]}[]";"*only enums*");
  ("value `a";"*denied*");
  ("value(+;1;2)";"*only enums*");
  ("value \".test.a\"";"*only enums*");
  (".test.a:10; value`.test.a";10);
  ("value([a:1 2 3] b:1 2 3)";([]b:1 2 3));
  ("{value([a:1 2 3] b:1 2 3)}[]";([]b:1 2 3));
  ("value `.test.en?`a`b";`a`b);
  ("not 10b";01b);
  ("{not 10b}[]";01b);
  (".[not;enlist 10b]";01b);
  ("{.[not;enlist 10b]}[]";01b);
  ("{x,1 2?1}1 2?1";0 0);
  ("{x;10?`5;10?`h`j;10?.test.en;1}(10?`5;10?`h`j;10?.test.en)";1);
  ("`sym?`a`b";"*denied*");
  ("{`sym?`a`b}[]";"*denied*");
  ("?[`sym;enlist `a`b]";"*denied*");
  ("{?[`sym;enlist `a`b]}[]";"*denied*");
  ("?[;enlist `a`b]`sym";"*denied*");
  ("{?[;enlist `a`b]`sym}[]";"*denied*");
  ("?[`sym]enlist `a`b";"*denied*");
  ("{?[`sym]enlist `a`b}[]";"*denied*");
  ("count ?[10]1 2 3";10);
  ("{x,?[10b;1 2;1 2]}?[10b;1 2;1 2]";1 2 1 2);
  (".test.a:10;{x+?[([]b:1 2 3);0 1;(last;`.test.a)]}?[([]b:1 2 3);0 1;(last;`b)]";12);
  ("?[([]b:1 2 3);0 1;(+;`b;`a)]";"*denied*");
  ("{?[([]b:1 2 3);0 1;(+;`b;`a)]}[]";"*denied*");
  ("?[([]b:1 2 3);0 1;(last;`b)]";2);
  ("{?[([]b:1 2 3);0 1;(last;`b)]}[]";2);
  ("?[([]b:1 2 3);0 1;(last;`i)]";1);
  ("{i:10; ?[([]b:1 2 3);0 1;(last;`i)]}[]";1);
  ("{value x,`j`k!3 4}`h`j!1 2";1 3 4);
  ("{x~0!([b:1 2]a:1 2)}1!([]a:1 2;b:1 2)";0b);
  ("`a!1 2 3";"*denied*");
  (".test.a:`a`b`c;{value x,`.test.a!0 1}`.test.a!0 1";`a`b`a`b);
  ("0N!1";"*denied*");
  ("-4!`aa";"*denied*");
  (".test.a:([] a:1 2); {x|cols[.test.a]~cols`.test.a}cols[.test.a]~cols`.test.a";1b);
  ("cols `a";"*denied*");
  ("{cols `a}[]";"*denied*");
  (".[cols;(),`a]";"*denied*");
  ("{.[cols;(),`a]}[]";"*denied*");
  ("{neg each x}neg each 1 2";1 2);
  ("`f each 1 2";"*denied*");
  ("{`f each 1 2}[]";"*denied*");
  ("0 each 1 2";"*denied*");
  ("{0 each 1 2}[]";"*denied*");
  ("{neg peach x}neg peach 1 2";1 2);
  ("`f peach 1 2";"*denied*");
  ("{`f peach 1 2}[]";"*denied*");
  ("0 peach 1 2";"*denied*");
  ("{0 peach 1 2}[]";"*denied*");
  ("count wj[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(min;`bid))]";3);
  ("count wj1[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(min;`bid))]";3);
  ("count wj[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(hcount;`bid))]";"*denied*");
  ("count wj1[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(hcount;`bid))]";"*denied*");
  ("count wj[.test.w;.test.f;.test.t;(.test.q;(max;`ask);({hcount x};`bid))]";"*denied*");
  ("count wj1[.test.w;.test.f;.test.t;(.test.q;(max;`ask);({hcount x};`bid))]";"*denied*");
  ("count wj[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(`f;`bid))]";"*denied*");
  ("count wj1[.test.w;.test.f;.test.t;(.test.q;(max;`ask);(`f;`bid))]";"*denied*");
  ("{key .test.a:`a`b!1 2;key `.test.a}key([a:1 2]b: 1 2)";`a`b);
  ("key `a";"*denied*");
  ("{key `a}[]";"*denied*");
  (".[key;(),`a]";"*denied*");
  ("{.[key;(),`a]}[]";"*denied*");
  ("parse\"1+2\"";(+;1;2));
  ("parse\"hclose 1\"";"*denied*");
  ("`.test.a set 10";`.test.a);
  ("`a set 10";"*denied*");
  ("{`a set 10}[]";"*denied*");
  (".test.a:([]a:1 2); `.test.a insert enlist 3";enlist 2);
  (".test.a:([]a:1 2); `.test.a upsert enlist 3";`.test.a);
  (".test.a:([]a:1 2); `a insert enlist 3";"*denied*");
  (".test.a:([]a:1 2); {`a insert enlist 3}[]";"*denied*");
  (".test.a:([]a:1 2); `a upsert enlist 3";"*denied*");
  (".test.a:([]a:1 2); {`a upsert enlist 3}[]";"*denied*");
  ("{x+y}scan 1 2 3";1 3 6);
  ("`f scan 1 2 3";"*denied*");
  ("{`f scan 1 2 3}[]";"*denied*");
  ("1 scan 1 2 3";"*denied*");
  ("{1 scan 1 2 3}[]";"*denied*");
  ("{x+y}over 1 2 3";6);
  ("`f over 1 2 3";"*denied*");
  ("{`f over 1 2 3}[]";"*denied*");
  ("1 over 1 2 3";"*denied*");
  ("{1 over 1 2 3}[]";"*denied*");
  ("{x+y}prior 1 2 3";0N 3 5);
  ("`f prior 1 2 3";"*denied*");
  ("{`f prior 1 2 3}[]";"*denied*");
  ("1 prior 1 2 3";"*denied*");
  ("{1 prior 1 2 3}[]";"*denied*");
  ("tables[]";`$());
  ("{x,(cols .test.t),cols`.test.t}cols([]a:1 2)";`a`sym`time`price`sym`time`price);
  ("cols `t";"*denied*");
  ("{cols `t}[]";"*denied*");
  ("keys ([a:1 2]b:1 2)";(),`a);
  ("keys `a";"*denied*");
  ("{keys `a}[]";"*denied*");
  (".test.a:([]a:1 2;b:1 2); {x~get`a xkey `.test.a}get`a xkey `.test.a";1b);
  ("`a xkey `b";"*denied*");
  ("{`a xkey `b}[]";"*denied*");
  (".test.a:([]a:1 2;b:1 2); {x~get`a xasc `.test.a}get`a xasc `.test.a";1b);
  ("`a xasc `b";"*denied*");
  ("{`a xasc `b}[]";"*denied*");
  (".test.a:([]a:1 2;b:1 2); {x~get`a xdesc `.test.a}get`a xdesc `.test.a";1b);
  ("`a xdesc `b";"*denied*");
  ("{`a xdesc `b}[]";"*denied*");
  ("type fkeys ([]a:1 2)";99h);
  ("fkeys `a";"*denied*");
  ("{fkeys `a}[]";"*denied*");
  ("count meta ([]a:til 10)";1);
  ("meta `a";"*denied*");
  ("{meta `a}[]";"*denied*");
  (".test.a:-1; .test.a \"tst\"";"*denied*");
  (".test.a:-1; {.test.a \"tst\"}[]";"*denied*");
  ("{a:-1; a \"tst\"}[]";"*denied*");
  (".test.a:`noacc; .test.a 1";"*denied*");
  (".test.a:`noacc; {.test.a 1}[]";"*denied*");
  ("{a:`noacc; a \"tst\"}[]";"*denied*");
  ("`noacc 1";"*denied*");
  ("{`noacc 1}[]";"*denied*");
  / composition
  ("(')[{x+1};{x+y}] . (1;2)";4);
  ("{(')[{x+1};{x+y}] . (1;2)}[]";4);
  ("(')[{x+1};0] 1";"*denied*");
  ("{(')[{x+1};0] 1}[]";"*denied*");
  ("(')[0;{x+1}] 1";"*denied*");
  ("{(')[0;{x+1}] 1}[]";"*denied*");
  ("(')[`f;{x+1}] 1";"*denied*");
  ("{(')[`f;{x+1}] 1}[]";"*denied*");
  ("(')[{x+1};`f] 1";"*denied*");
  ("{(')[{x+1};`f] 1}[]";"*denied*");
  / projection
  ("{x+y}[1]2";3);
  ("{{x+y}[1]2}[]";3);
  ("{x+y+z}[;;1][2][3]";6);
  ("{{x+y+z}[;;1][2][3]}[]";6);
  ("{x+y+z}[;;1][;2][3]";6);
  ("{{x+y+z}[;;1][;2][3]}[]";6);
  / adverb
  ("{`f'[1 1;2 2]}[]";"*denied*");
  ("`f'[1 1;2 2]";"*denied*");
  ("1 `f/:1 2";"*denied*");
  ("{1 `f/:1 2}[]";"*denied*");
  ("1 `f\\:1 2";"*denied*");
  ("{1 `f\\:1 2}[]";"*denied*");
  / select/delete
  (".test.a:([]a:1 2 3); .test.aa:2; count[select from .test.a]+count[select from `.test.a where a<3]+count[delete from .test.a where a=.test.aa]+count[delete from `.test.a where a<2]";5);
  (".test.a:([]a:1 2 3); .test.aa:2; {[b] c:3; count[select from .test.a]+count[select from `.test.a where a<c]+count[delete from .test.a where a=b]+count[delete from `.test.a where a<.test.aa]}[2]";5);
  ("select from t";"*denied*");
  ("select from `t";"*denied*");
  ("{select from t}[]";"*denied*");
  ("{select from `t}[]";"*denied*");
  ("delete from `t";"*denied*");
  ("{delete from `t}[]";"*denied*");
  ("select noA from `.test.a";"*denied*");
  ("{select noA from `.test.a}[]";"*denied*");
  ("select from `.test.a where noA>2";"*denied*");
  ("{select from `.test.a where noA>2}[]";"*denied*");
  ("select by noA from `.test.a";"*denied*");
  ("{select by noA from `.test.a}[]";"*denied*");
  ("exec t!t from `.test.a";"*denied*");
  ("{exec t!t from `.test.a}[]";"*denied*");
  ("{delete from `.test.a where noA>2}[]";"*denied*");
  ("delete from `.test.a where noA>2";"*denied*");
  ("update from `a";"*denied*");
  ("{update from `a}[]";"*denied*");
  ("update c:noA+1 from .test.a";"*denied*");
  ("{update c:noA+1 from .test.a}[]";"*denied*");
  ("update by noA from `.test.a";"*denied*");
  ("{update by noA from `.test.a}[]";"*denied*");
  ("count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)";3);
  ("{count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)}[]";3);
  ("count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)`a";3);
  ("{count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)`a}[]";3);
  ("count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where d=1)";"*denied*");
  ("{count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where d=1)}[]";"*denied*");
  ("count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where dd in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)";"*denied*");
  ("{count exec c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where dd in (exec a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)}[]";"*denied*");
  ("count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where d=1)`a";"*denied*");
  ("{count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where d in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where d=1)`a}[]";"*denied*");
  ("count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where dd in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)`a";"*denied*");
  ("{count select c from ([]c:`c1`c2`c3`c4`c5`c5;d:1 2 3 4 5 6) where dd in (select a from ([]a:1 2 3 4 5 6;b:1 2 1 2 1 2)where b=1)`a}[]";"*denied*");
  ("(select last i from ([] a:til 10))`x";enlist 9);
  ("{select last i from ([] a:til 10)}[]`x";enlist 9);
  ("(select last i from ([] a:til 10) where a<exec last i from ([] b:til 5))`x";enlist 3);
  ("{select last i from ([] a:til 10) where a<exec last i from ([] b:til 5)}[]`x";enlist 3);
  ("{i:1 2; select last i from ([] a:til 10)}[]`x";enlist 9);
  ("{i:1 2; select last i from ([] a:til 10) where a<exec last i from ([] b:til 5)}[]`x";enlist 3);
  ("{b:2; exec 2*first a from ([] a:til 10) where a=b}[]";4);
  ("{b:(2;::); exec 2*first a from ([] a:til 10) where a=b 0}[]";4);
  ("{b:`a; exec first a from ([] a:`j`k`a`l) where a=b}[]";`a);
  ("{b:`a`b; exec last a from ([] a:`j`k`a`b`l) where a in b}[]";`b);
  ("{b:2; exec last d from ([] d:til 10) where d<(exec 2*first a from ([] a:til 10) where a=b)}[]";3);
  ("{b:(2;::); exec last d from ([] d:til 10) where d<(exec 2*first a from ([] a:til 10) where a=b 0)}[]";3);
  ("{b:`a; exec last d from ([] d:til 10) where d< exec first i from ([] a:`j`k`a`l) where a=b}[]";1);
  ("{b:`a`b; exec last d from ([] d:til 10) where d< exec last i from ([] a:`j`k`a`b`l) where a in b}[]";2);
  ("select a from ([] a:til 10) where a in (exec b from (select from ([] b: til 10)))";([] a:til 10));
  ("{select a from ([] a:til 10) where a in (exec b from (select from ([] b: til 10)))}[]";([] a:til 10));
  ("select from ([] a:til 10) where 1,a=1";"type");
  ("{select from ([] a:til 10) where 1,a=1}[]";"type");
  (".test.d:`a`b!1 2; .test.d[`a]:10; .test.d`a";10);
  ("{d:`a`b!1 2; d[`a]:10; d`a}[]";10);
  ("{a:1 2; b:3 4; a,'b}[]";(1 3;2 4));
  (".test.a:1 2; .test.b:3 4; .test.a,'.test.b";(1 3;2 4));
  (({x`a};`a`b!(1;hopen));"*denied*");
  ("{sum exec {x+y}[;1] each a from ([] a: til 10)}[]";55);
  ("sum exec {x+y}[;1] each a from ([] a: til 10)";55);
  ("{select {x+y}[;1] each a from ([] a: til 10)}[]";([] a: 1+til 10));
  ("select {x+y}[;1] each a from ([] a: til 10)";([] a: 1+til 10));
  ("{eval enlist[.test.mv],`.qchk.check}[]";::);
  ("{ \n [x] x+1}[1]";2);
  ("count eval (?;([] a:til 10);enlist enlist (=;`a;1);0b;enlist[`a]!enlist `a)";1);
  ("count {select {x+1815} a from ([] a:til 10)} peach 0 1";2);
  ("type first first ![([]a: 1 2 3);();0b;enlist[`a]!enlist enlist (enlist `a;enlist `b;enlist `c)]`a";-11h)
 )

.test.mv:.qchk.mv;
test:{eval .qchk.chkExpr[$[10=type x;parse x;x];()]};
.qchk.chkR:{if[-11=type x;if[not x like ".test*";.qchk.err "access denied: ",string x]];x}; / read access
.qchk.chkW:{if[-11=type x;if[not x like ".test*";.qchk.err "access denied: ",string x]];x}; / write access

{r:@[test;x 0;{x}]; if[not $[(10=type x 1)&10=type r;r like x 1;r~x 1]; -1 "FAILED: ",.Q.s1[x]," with ",.Q.s1 r]} each tests;

exit 0;

(* ::Package:: *)

(* ::Subsubsection:: *)
(*Fast Exp expansion*)


(* ::Text:: *)
(*Sage code*)


(* ::Text:: *)
(*order=50*)
(*R = PolynomialRing(QQ, order+1, 'a_')*)
(*a = R.gens()*)
(*S.<x> = R[[]]*)
(*s = sum(a[i]*x^i for i in range(1, order+1)) + O(x^(order+1))*)
(*es = s.exp(prec=order+1)*)
(*import re*)
(*for order2 in range(order+1):*)
(*    esc=es.dict()[order2]*)
(*    info=str(esc).replace('\n','')*)
(*    for i in range(order2,-1,-1):*)
(*      info=re.sub('a_'+str(i),'$aaac['+str(i)+']',info)*)
(*    f=open("/Users/xfwang/ExpExpand/expandlist_"+str(order2),"w")*)
(*    f.write("$expandlist["+str(order2)+"]="+info)*)
(*    f.close()*)


$getexporder[order_]:=$getexporder[order]=Get["ExpExpand/expandlist_"<>ToString[order]]
ExpExpand[exponent_,var_,order_]:=Table[{i}->$getexporder[i]/.Table[$aaac[a]->exponent[[a]],{a,1,Length[exponent]}],{i,0,order}]
ExpExpandCoefficient[exponent_,var_,order_]:=$getexporder[order]/.Table[$aaac[a]->exponent[[a]],{a,1,Length[exponent]}]
ExpExpandtoTable[exponent_,var_,order_]:=Table[$getexporder[i]/.Table[$aaac[a]->exponent[[a]],{a,1,Length[exponent]}],{i,0,order}]

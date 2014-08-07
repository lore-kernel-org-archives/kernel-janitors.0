From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 12:49:04 +0000
Subject: [PATCH 0/5] fix error return code
Message-Id: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: coreteam@netfilter.org
Cc: kernel-janitors@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kexec@lists.infradead.org

The complate semantic patch that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
// identify a function that returns a negative return value at least once.
@ok exists@
identifier f,ret,i;
expression e;
constant c;
@@

f(...) {
... when any
(
return -c@i;
|
ret =3D -c@i;
... when !=3D ret =3D e
return ret;
|
if (ret < 0) { ... return ret; }
)
... when any
}

// identify a case where the return variable is set to a non-negative value
// and then returned in error-handling code
@r exists@
identifier ret,ok.f,fn;
expression e1,e2,e3,e4,e5,e6,x;
statement S,S1;
position p1,p2,p3;
@@

f(...) {
... when any
(
if@p1 (\(ret < 0\|ret !=3D 0\))
 { ... return ret; }
|
ret@p1 =3D 0
)
... when !=3D \(ret =3D e1\|ret++\|ret--\|ret+=E1\|ret-=E1\)
    when !=3D &ret
    when any
(
 if (<+... ret =3D e5 ...+>) S1
|
 if (<+... &ret ...+>) S1
|
if@p2(<+...x =3D fn(...)...+>)
 {
  ... when !=3D ret =3D e6
      when forall
 return@p3 ret;
}
|
break;
|
x =3D fn(...)
... when !=3D \(ret =3D e4\|ret++\|ret--\|ret+=E4\|ret-=E4\)
    when !=3D &ret
(
 if (<+... ret =3D e3 ...+>) S
|
 if (<+... &ret ...+>) S
|
if@p2(<+...\(x !=3D 0\|x < 0\|x =3D NULL\|IS_ERR(x)\)...+>)
 {
  ... when !=3D ret =3D e2
      when forall
 return@p3 ret;
}
)
)
... when any
}

@printer depends on r@
position p;
identifier ok.f,pr;
constant char [] c;
@@

f(...) { <...pr@p(...,c,...)...> }

@bad0 exists@
identifier r.ret,ok.f,g !=3D {ERR_PTR,IS_ERR};
position p !=3D printer.p;
@@

f(...) { ... when any
g@p(...,ret,...)
... when any
 }

// ignore the above if there is some path where the variable is set to
// something else
@bad depends on !bad0 exists@
position r.p1,r.p2;
statement S1,S2;
identifier r.ret;
expression e1;
@@

(
if@p1 (\(ret < 0\|ret !=3D 0\)) S1
|
ret@p1 =3D 0
)
... when any
 \(ret =3D e1\|ret++\|ret--\|ret+=E1\|ret-=E1\|&ret\)
... when any
if@p2(...) S2

@bad1 depends on !bad0 && !bad exists@
position r.p2;
statement S2;
identifier r.ret;
expression e1;
constant c;
@@

ret =3D -c
... when !=3D \(ret =3D e1\|ret++\|ret--\|ret+=E1\|ret-=E1\)
    when !=3D &ret
    when any
if@p2(...) S2

// likewise ignore it if there has been an intervening return
@bad2 depends on !bad0 && !bad && !bad1 exists@
position r.p1,r.p2;
identifier r.ret;
expression e1;
statement S2;
constant c;
@@

ret@p1 =3D 0
... when !=3D if (...) { ... ret =3D e1 ... return ret; }
    when !=3D if (...) { ... return -c; }
    when any
if@p2(...) S2


@script:python depends on !bad0 && !bad && !bad1 && !bad2@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.print_secs("",p3)
// </smpl>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

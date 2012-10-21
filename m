From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 21 Oct 2012 10:52:02 +0000
Subject: [PATCH 0/5] eliminate possible double free
Message-Id: <1350816727-1381-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where a called function frees some data and the
calling context frees the same data.

The complete semantic match is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
parameter list[n] ps;
type T;
identifier a;
expression e;
expression ret != 0;
identifier f,free;
position p1;
@@

f(ps,T a,...) {
  ... when any
      when != a = e
  if(...) { ... free@p1(a); ... return ret; }
  ... when any
}

@s exists@
identifier r.f,r.free;
expression x,a;
position p2,p3;
expression list[r.n] xs;
@@

x = f@p2(xs,a,...);
if (...) { ... free@p3(a); ... return ...; }

@script:python@
p1 << r.p1;
p2 << s.p2;
p3 << s.p3;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.print_secs("",p3)
// </smpl>


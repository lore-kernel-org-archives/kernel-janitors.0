From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jan 2012 11:05:54 +0000
Subject: [PATCH] initialize all fields
Message-Id: <1327921555-7862-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

This patch fixes a case where a structure field is not initialized before
the structureis copied to user level.

The semantic match that finds this problem is as follows
(http://coccinelle.lip6.fr/).  It uses other references to the same
structure in the current file to find the set of fields that should be
initialized.

@a disable decl_init@
identifier x,x1;
type T,T1;
expression e,sz;
@@

T x;
... when any
copy_to_user(e,&x,sz)

@r@
a.T y;
identifier f,f1,f2;
@@

(
y.f1[...]
|
y.f1.f2
|
y.f
)

@b@
identifier a.x,r.f;
type a.T;
expression e,e1,sz;
position p,p0;
@@

T x@p0;
... when != x.f = e1
    when != &x
    when != &(x.f)
    when != get_user(x.f,...)
    when != __get_user(x.f,...)
    when != x = e1
copy_to_user@p(e,&x,sz)

@script:ocaml@
t << a.T;
x << a.x;
f << r.f;
p << b.p;
@@

Printf.printf "%s:%d: %s %s missing %s\n" (List.hd p).file (List.hd p).line
   t x f


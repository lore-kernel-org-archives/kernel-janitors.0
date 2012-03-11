From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Mar 2012 19:36:20 +0000
Subject: [PATCH 0/7] ensure arguments to request_irq and free_irq are compatible
Message-Id: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

As far as I can see, free_irq does nothing if its second argument is not
the same as the last argument of the corresponding call to request_irq.
These were found using the semantic match below (http://coccinelle.lip6.fr/).
This semantic match finds a number of other cases, but they are mostly in
platform driver probe functions, so the functions should be just converted
to use devm functions, eliminating the need to call free_irq at all.

// <smpl>
@r exists@
expression e,e1,e2,e3,e4,e5;
type T;
position p1,p2;
@@

request_irq@p1(e1,e2,e3,e4,e5)
...
(
 free_irq(e1,(T)e5);
|
free_irq@p2(e1,e);
)

@bad1 exists@
position r.p1,r.p2;
expression e1,e2,e3,e4,e5;
@@

request_irq@p1(e1,e2,e3,e4,(void *)e5)
...
free_irq@p2(e1,e5);

@bad2 exists@
position r.p1,r.p2;
statement S;
@@

if (request_irq@p1(...)) S else { <+... free_irq@p2(...); ...+> }

@script:python depends on !bad1 && !bad2@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
// </smpl>


From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Jun 2012 21:41:34 +0000
Subject: [PATCH 0/7] adjust suspicious bit operation
Message-Id: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches relate to conditional tests where & is used with a constant
that is always 0 and where | is used with a constant that is always 0 or
always non-zero.

The following semantic match finds these problems
(http://coccinelle.lip6.fr/):

@and@
identifier i;
expression e;
position p;
@@

 ((e & i@p) && ...)

@iszera@
identifier and.i;
position p;
@@

#define i 0

@othera@
identifier and.i;
expression e!=0;
@@

#define i e

@script:python depends on iszera && !othera@
p << and.p;
@@

cocci.print_main("",p)

@or@
identifier i;
expression e;
position p;
@@

 ((e | i@p) && ...)


@iszero@
identifier or.i;
position p;
@@

#define i 0

@othero@
identifier or.i;
expression e!=0;
@@

#define i e

@script:python depends on (othero && !iszero) || (iszero && !othero)@
p << or.p;
@@

cocci.print_main("",p)


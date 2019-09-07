From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 07 Sep 2019 16:40:44 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_Coccinelle=3a_Reduce_rules_in_SmPL_script_?= =?UTF-8?B?4oCccHRyX3JldC5jb2NjaeK
Message-Id: <23823c18-9f22-e107-81dc-a03dbaf0e0b0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8e0db8a-1f96-dac0-791c-43e2d1e1cf05@web.de>
 <alpine.DEB.2.21.1909071804090.2562@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909071804090.2562@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Sep 2019 18:30:32 +0200

This SmPL script contains duplicate code.
Thus reduce it to the required source code search functionality
by the means of the semantic patch language.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/ptr_ret.cocci | 61 +++++-----------------------
 1 file changed, 10 insertions(+), 51 deletions(-)

diff --git a/scripts/coccinelle/api/ptr_ret.cocci b/scripts/coccinelle/api/ptr_ret.cocci
index e76cd5d90a8a..f4b1ce4a06d0 100644
--- a/scripts/coccinelle/api/ptr_ret.cocci
+++ b/scripts/coccinelle/api/ptr_ret.cocci
@@ -20,44 +20,28 @@ virtual report
 @depends on patch@
 expression ptr;
 @@
-
+(
 - if (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
 + return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
+|
 - if (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
 + return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
+|
 - (IS_ERR(ptr) ? PTR_ERR(ptr) : 0)
 + PTR_ERR_OR_ZERO(ptr)
+)

 @r1 depends on !patch@
 expression ptr;
 position p1;
 @@
-
+(
 * if@p1 (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
-
-@r2 depends on !patch@
-expression ptr;
-position p2;
-@@
-
-* if@p2 (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
-
-@r3 depends on !patch@
-expression ptr;
-position p3;
-@@
-
-* IS_ERR@p3(ptr) ? PTR_ERR(ptr) : 0
+|
+* if@p1 (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
+|
+* IS_ERR@p1(ptr) ? PTR_ERR(ptr) : 0
+)

 @script:python depends on org@
 p << r1.p1;
@@ -65,33 +49,8 @@ p << r1.p1;

 coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")

-
-@script:python depends on org@
-p << r2.p2;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on org@
-p << r3.p3;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
 @script:python depends on report@
 p << r1.p1;
 @@

 coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r2.p2;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r3.p3;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
--
2.23.0

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 15:19:33 +0000
Subject: [PATCH] Coccinelle: zalloc-simple: Delete duplicate specifications of the key word "expression"
Message-Id: <081fc0aa-2394-47c4-11fa-c615a429bc0d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 16:00:22 +0100

Reduce the file size a bit by removing 12 specifications of the
key word "expression" in this script for the semantic patch language.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/alloc/zalloc-simple.cocci | 36 ++++++++----------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
index 92b20913055f..a8a530696a5e 100644
--- a/scripts/coccinelle/api/alloc/zalloc-simple.cocci
+++ b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
@@ -28,8 +28,7 @@ virtual report
 
 @depends on context@
 type T, T2;
-expression x;
-expression E1;
+expression x,E1;
 statement S;
 @@
 
@@ -46,8 +45,7 @@ statement S;
 
 @depends on patch@
 type T, T2;
-expression x;
-expression E1,E2,E3,E4;
+expression x,E1,E2,E3,E4;
 statement S;
 @@
 
@@ -151,8 +149,7 @@ statement S;
 
 @r depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2;
+expression x,E1,E2;
 statement S;
 position p;
 @@
@@ -181,8 +178,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r1 depends on org || report@
 type T, T2;
-expression x;
-expression E1;
+expression x,E1;
 statement S;
 position p;
 @@
@@ -211,8 +207,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r2 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3,E4;
+expression x,E1,E2,E3,E4;
 statement S;
 position p;
 @@
@@ -241,8 +236,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r3 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3;
+expression x,E1,E2,E3;
 statement S;
 position p;
 @@
@@ -271,8 +265,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r4 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3;
+expression x,E1,E2,E3;
 statement S;
 position p;
 @@
@@ -301,8 +294,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r5 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2;
+expression x,E1,E2;
 statement S;
 position p;
 @@
@@ -331,8 +323,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r6 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3;
+expression x,E1,E2,E3;
 statement S;
 position p;
 @@
@@ -361,8 +352,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r7 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2;
+expression x,E1,E2;
 statement S;
 position p;
 @@
@@ -391,8 +381,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r8 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3;
+expression x,E1,E2,E3;
 statement S;
 position p;
 @@
@@ -420,8 +409,7 @@ coccilib.report.print_report(p[0], msg)
 //-----------------------------------------------------------------
 @r9 depends on org || report@
 type T, T2;
-expression x;
-expression E1,E2,E3;
+expression x,E1,E2,E3;
 statement S;
 position p;
 @@
-- 
2.15.1


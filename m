From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 21:08:25 +0000
Subject: [PATCH 4/4 v2] coccinelle: platform_get_irq: drop unneeded metavariable
Message-Id: <1574197705-31132-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr

Having E as a metavariable adds the requirement to verify its type.
This seems like an unnecessary constraint, so drop it.
There is currently no impact on the set of results.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: fix From and To (very sorry for the mistake)

 scripts/coccinelle/api/platform_get_irq.cocci |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/api/platform_get_irq.cocci
index e5d04fb..17e5895 100644
--- a/scripts/coccinelle/api/platform_get_irq.cocci
+++ b/scripts/coccinelle/api/platform_get_irq.cocci
@@ -11,7 +11,6 @@ virtual report
 
 @depends on context@
 expression ret;
-struct platform_device *E;
 @@
 
 ret @@ -19,7 +18,7 @@ ret  platform_get_irq
 |
 platform_get_irq_byname
-)(E, ...);
+)(...);
 
 if ( \( ret < 0 \| ret <= 0 \) )
 {
@@ -30,7 +29,6 @@ if ( \( ret < 0 \| ret <= 0 \) )
 
 @depends on patch@
 expression ret;
-struct platform_device *E;
 statement S;
 @@
 
@@ -39,7 +37,7 @@ ret  platform_get_irq
 |
 platform_get_irq_byname
-)(E, ...);
+)(...);
 
 if ( \( ret < 0 \| ret <= 0 \) )
 -{
@@ -49,7 +47,6 @@ S
 
 @depends on patch@
 expression ret;
-struct platform_device *E;
 @@
 
 ret @@ -57,7 +54,7 @@ ret  platform_get_irq
 |
 platform_get_irq_byname
-)(E, ...);
+)(...);
 
 if ( \( ret < 0 \| ret <= 0 \) )
 {
@@ -76,7 +73,6 @@ if ( \( ret < 0 \| ret <= 0 \) )
 @r depends on org || report@
 position p1;
 expression ret;
-struct platform_device *E;
 @@
 
 ret @@ -84,7 +80,7 @@ ret  platform_get_irq
 |
 platform_get_irq_byname
-)(E, ...);
+)(...);
 
 if ( \( ret < 0 \| ret <= 0 \) )
 {

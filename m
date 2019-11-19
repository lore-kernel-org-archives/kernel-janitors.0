From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 17:28:18 +0000
Subject: [PATCH 2/4] coccinelle: platform_get_irq: handle 2-statement branches
Message-Id: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574184500-29870-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574184500-29870-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr

From: Masahiro Yamada <yamada.masahiro@socionext.com>

Treat separately the case where there is only one other
statement in the branch, to be able to remove the outer
{} as well.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/platform_get_irq.cocci |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/api/platform_get_irq.cocci
index c6ac755..7ac32ee 100644
--- a/scripts/coccinelle/api/platform_get_irq.cocci
+++ b/scripts/coccinelle/api/platform_get_irq.cocci
@@ -31,6 +31,25 @@ if ( \( ret < 0 \| ret <= 0 \) )
 @depends on patch@
 expression ret;
 struct platform_device *E;
+statement S;
+@@
+
+ret +(
+platform_get_irq
+|
+platform_get_irq_byname
+)(E, ...);
+
+if ( \( ret < 0 \| ret <= 0 \) )
+-{
+-dev_err(...);
+S
+-}
+
+@depends on patch@
+expression ret;
+struct platform_device *E;
 @@
 
 ret 

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 21:08:22 +0000
Subject: [PATCH 1/4 v2] coccinelle: platform_get_irq: simplify context case
Message-Id: <1574197705-31132-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr

Simplify to just report on the first dev_err, whereever it occurs.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: no change

 scripts/coccinelle/api/platform_get_irq.cocci |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/api/platform_get_irq.cocci
index 06b6a95..c6ac755 100644
--- a/scripts/coccinelle/api/platform_get_irq.cocci
+++ b/scripts/coccinelle/api/platform_get_irq.cocci
@@ -23,16 +23,9 @@ platform_get_irq_byname
 
 if ( \( ret < 0 \| ret <= 0 \) )
 {
-(
-if (ret != -EPROBE_DEFER)
-{ ...
-*dev_err(...);
-... }
-|
 ...
 *dev_err(...);
-)
-...
+... when any
 }
 
 @depends on patch@

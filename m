From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 Nov 2019 19:30:08 +0000
Subject: [PATCH] Coccinelle: zalloc-simple: Adjust a message construction
Message-Id: <042136cf-4e58-02bd-4d49-5d5055f22c65@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Enrico Weigelt <lkml@metux.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Nov 2019 20:00:30 +0100

* Simplify a message construction in a Python script rule
  for the semantic patch language.

* Delete also a duplicate space character then.

Fixes: dfd32cad146e3624970eee9329e99d2c6ef751b3 ("dma-mapping: remove dma_zalloc_coherent()")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/alloc/zalloc-simple.cocci | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
index 26cda3f48f01..c14eae1f3010 100644
--- a/scripts/coccinelle/api/alloc/zalloc-simple.cocci
+++ b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
@@ -217,8 +217,10 @@ p << r2.p;
 x << r2.x;
 @@

-msg="WARNING: dma_alloc_coherent use in %s already zeroes out memory,  so memset is not needed" % (x)
-coccilib.report.print_report(p[0], msg)
+coccilib.report.print_report(p[0],
+                             "WARNING: dma_alloc_coherent use in "
+                             + x
+                             + " already zeroes out memory. Thus memset is not needed.")

 //-----------------------------------------------------------------
 @r3 depends on org || report@
--
2.23.0

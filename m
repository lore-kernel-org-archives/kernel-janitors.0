From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Mar 2012 19:36:27 +0000
Subject: [PATCH 7/7] arch/unicore32/kernel/dma.c: ensure arguments to request_irq and free_irq are compatible
Message-Id: <1331494587-12196-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert calls to free_irq so that the second argument is the same as the
last argument of the corresponding call to request_irq, rather than the
second to last.  Without this property, free_irq does nothing.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/unicore32/kernel/dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/unicore32/kernel/dma.c b/arch/unicore32/kernel/dma.c
index ae441bc..c813fec 100644
--- a/arch/unicore32/kernel/dma.c
+++ b/arch/unicore32/kernel/dma.c
@@ -173,7 +173,7 @@ int __init puv3_init_dma(void)
 	ret = request_irq(IRQ_DMAERR, dma_err_handler, 0, "DMAERR", NULL);
 	if (ret) {
 		printk(KERN_CRIT "Can't register IRQ for DMAERR\n");
-		free_irq(IRQ_DMA, "DMA");
+		free_irq(IRQ_DMA, NULL);
 		return ret;
 	}
 


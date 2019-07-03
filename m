From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 03 Jul 2019 05:59:43 +0000
Subject: [PATCH] unicore32: dma: fix to pass correct device identity to free_irq()
Message-Id: <20190703055943.141542-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guan Xuetao <gxt@pku.edu.cn>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>, GuanXuetao <gxt@mprc.pku.edu.cn>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

free_irq() expects the same device identity that was passed to
corresponding request_irq(), otherwise the IRQ is not freed.

Fixes: 10c9c10c3151 ("unicore32 core architecture: mm related: consistent device DMA handling")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/unicore32/kernel/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/unicore32/kernel/dma.c b/arch/unicore32/kernel/dma.c
index 7a0e2d4d6077..2b8666f8a37d 100644
--- a/arch/unicore32/kernel/dma.c
+++ b/arch/unicore32/kernel/dma.c
@@ -169,7 +169,7 @@ int __init puv3_init_dma(void)
 	ret = request_irq(IRQ_DMAERR, dma_err_handler, 0, "DMAERR", NULL);
 	if (ret) {
 		printk(KERN_CRIT "Can't register IRQ for DMAERR\n");
-		free_irq(IRQ_DMA, "DMA");
+		free_irq(IRQ_DMA, NULL);
 		return ret;
 	}

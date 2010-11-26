From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 26 Nov 2010 17:05:55 +0000
Subject: [PATCH] arm: dma: check clk_get() result
Message-Id: <1290791157-21096-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

clk_get() may return ERR_PTR(), if so propagate return code as
imx_dma_init() return code.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Cannot compile this driver, so it is not tested at all.

 arch/arm/mach-imx/dma-v1.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/dma-v1.c b/arch/arm/mach-imx/dma-v1.c
index dcb24a9..e9f1769 100644
--- a/arch/arm/mach-imx/dma-v1.c
+++ b/arch/arm/mach-imx/dma-v1.c
@@ -821,6 +821,8 @@ static int __init imx_dma_init(void)
 		return 0;
 
 	dma_clk = clk_get(NULL, "dma");
+	if (IS_ERR(dma_clk))
+		return PTR_ERR(dma_clk);
 	clk_enable(dma_clk);
 
 	/* reset DMA module */
-- 
1.7.0.4


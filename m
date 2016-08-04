From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:32:24 +0000
Subject: [patch] CRIS v32: remove some double unlocks
Message-Id: <20160804053224.GK775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We unlocked a few lines earlier so we can delete these unlocks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/cris/arch-v32/mach-a3/dma.c b/arch/cris/arch-v32/mach-a3/dma.c
index 47c64bf..11f417f 100644
--- a/arch/cris/arch-v32/mach-a3/dma.c
+++ b/arch/cris/arch-v32/mach-a3/dma.c
@@ -41,7 +41,6 @@ int crisv32_request_dma(unsigned int dmanr, const char *device_id,
 
 		if (options & DMA_PANIC_ON_ERROR)
 			panic("request_dma error!");
-		spin_unlock_irqrestore(&dma_lock, flags);
 		return -EBUSY;
 	}
 	clk_ctrl = REG_RD(clkgen, regi_clkgen, rw_clk_ctrl);
diff --git a/arch/cris/arch-v32/mach-fs/dma.c b/arch/cris/arch-v32/mach-fs/dma.c
index fc6416a..7c93679 100644
--- a/arch/cris/arch-v32/mach-fs/dma.c
+++ b/arch/cris/arch-v32/mach-fs/dma.c
@@ -43,7 +43,6 @@ int crisv32_request_dma(unsigned int dmanr, const char *device_id,
 		}
 		if (options & DMA_PANIC_ON_ERROR)
 			panic("request_dma error!");
-		spin_unlock_irqrestore(&dma_lock, flags);
 		return -EBUSY;
 	}
 	clk_ctrl = REG_RD(config, regi_config, rw_clk_ctrl);

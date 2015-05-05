From: Leonardo Carreras <leocarreras89@gmail.com>
Date: Tue, 05 May 2015 23:40:52 +0000
Subject: [PATCH v2] dmaengine: pl08x: Suppress spaces in indentation
Message-Id: <20150505234052.GA22311@leo-Inspiron-N5110>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Removed checkpatch reported spaces in indentation:
ERROR: code indent should use tabs where possible
+^I         PL080_CONFIG_TC_IRQ_MASK);$

Signed-off-by: Leonardo Carreras <leocarreras89@gmail.com>
---
 drivers/dma/amba-pl08x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 49d396e..5de3cf4 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -474,7 +474,7 @@ static void pl08x_terminate_phy_chan(struct pl08x_driver_data *pl08x,
 	u32 val = readl(ch->reg_config);
 
 	val &= ~(PL080_CONFIG_ENABLE | PL080_CONFIG_ERR_IRQ_MASK |
-	         PL080_CONFIG_TC_IRQ_MASK);
+		 PL080_CONFIG_TC_IRQ_MASK);
 
 	writel(val, ch->reg_config);
 
-- 
1.7.9.5


From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 13:15:07 +0000
Subject: [PATCH] dmaengine: at_xdmac: remove a stray bottom half unlock
Message-Id: <20190503131507.GA1236@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Barry Song <21cnbao@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

We switched this code from spin_lock_bh() to vanilla spin_lock() but
there was one stray spin_unlock_bh() that was overlooked.  This
patch converts it to spin_unlock() as well.

Fixes: d8570d018f69 ("dmaengine: at_xdmac: move spin_lock_bh to spin_lock in tasklet")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma/at_xdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 06cbe54e4c30..e4ae2ee46d3f 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1655,7 +1655,7 @@ static void at_xdmac_tasklet(unsigned long data)
 		dev_vdbg(chan2dev(&atchan->chan), "%s: desc 0x%p\n", __func__, desc);
 		if (!desc->active_xfer) {
 			dev_err(chan2dev(&atchan->chan), "Xfer not active: exiting");
-			spin_unlock_bh(&atchan->lock);
+			spin_unlock(&atchan->lock);
 			return;
 		}
 
-- 
2.18.0

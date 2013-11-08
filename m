From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:51:16 +0000
Subject: [patch 2/2] dma: pl330: silence a compile warning
Message-Id: <20131108095116.GI27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 64 bit systems GCC warns that:

drivers/dma/pl330.c: In function ‘pl330_filter’:
drivers/dma/pl330.c:2317:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

It's harmless and I have casted it away.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 4af4b0c..f612068 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2314,7 +2314,7 @@ bool pl330_filter(struct dma_chan *chan, void *param)
 		return false;
 
 	peri_id = chan->private;
-	return *peri_id = (unsigned)param;
+	return *peri_id = (unsigned long)param;
 }
 EXPORT_SYMBOL(pl330_filter);
 

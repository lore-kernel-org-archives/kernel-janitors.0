From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:38:31 +0000
Subject: [patch] dmaengine: edma: predecence bug in GET_NUM_QDMACH()
Message-Id: <20151104133831.GH20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The current code uses bits 0-2 instead of 4-6 as the comment says.

Fixes: 633e42b8c546 ('dmaengine: edma: Get qDMA channel information from HW also')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/edma.c b/drivers/dma/edma.c
index 31722d4..ba5eb17 100644
--- a/drivers/dma/edma.c
+++ b/drivers/dma/edma.c
@@ -107,7 +107,7 @@
 
 /* CCCFG register */
 #define GET_NUM_DMACH(x)	(x & 0x7) /* bits 0-2 */
-#define GET_NUM_QDMACH(x)	(x & 0x70 >> 4) /* bits 4-6 */
+#define GET_NUM_QDMACH(x)	((x & 0x70) >> 4) /* bits 4-6 */
 #define GET_NUM_PAENTRY(x)	((x & 0x7000) >> 12) /* bits 12-14 */
 #define GET_NUM_EVQUE(x)	((x & 0x70000) >> 16) /* bits 16-18 */
 #define GET_NUM_REGN(x)		((x & 0x300000) >> 20) /* bits 20-21 */

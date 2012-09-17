From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 17 Sep 2012 08:14:04 +0000
Subject: [PATCH] drivers/rapidio/devices/tsi721.c: fix error return code
Message-Id: <1347869644-2569-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mporter@kernel.crashing.org
Cc: alexandre.bounine@idt.com, akpm@linux-foundation.org, chul.kim@idt.com, jiang.liu@huawei.com, bhelgaas@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/rapidio/devices/tsi721.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 1974359..78dff6f 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -2316,7 +2316,8 @@ static int __devinit tsi721_probe(struct pci_dev *pdev,
 
 	/* Configure DMA attributes. */
 	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32))) {
+		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		if (err) {
 			dev_info(&pdev->dev, "Unable to set DMA mask\n");
 			goto err_unmap_bars;
 		}
-- 
1.7.11.4


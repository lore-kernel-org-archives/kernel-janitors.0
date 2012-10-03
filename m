From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 03 Oct 2012 16:17:51 +0000
Subject: [PATCH 1/20] drivers/net/ethernet/dec/tulip/dmfe.c: fix error return code
Message-Id: <1349281090-10013-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Grundler <grundler@parisc-linux.org>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/net/ethernet/dec/tulip/dmfe.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index 4d6fe60..d23755e 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -446,13 +446,17 @@ static int __devinit dmfe_init_one (struct pci_dev *pdev,
 	/* Allocate Tx/Rx descriptor memory */
 	db->desc_pool_ptr = pci_alloc_consistent(pdev, sizeof(struct tx_desc) *
 			DESC_ALL_CNT + 0x20, &db->desc_pool_dma_ptr);
-	if (!db->desc_pool_ptr)
+	if (!db->desc_pool_ptr) {
+		err = -ENOMEM;
 		goto err_out_res;
+	}
 
 	db->buf_pool_ptr = pci_alloc_consistent(pdev, TX_BUF_ALLOC *
 			TX_DESC_CNT + 4, &db->buf_pool_dma_ptr);
-	if (!db->buf_pool_ptr)
+	if (!db->buf_pool_ptr) {
+		err = -ENOMEM;
 		goto err_out_free_desc;
+	}
 
 	db->first_tx_desc = (struct tx_desc *) db->desc_pool_ptr;
 	db->first_tx_desc_dma = db->desc_pool_dma_ptr;
@@ -462,8 +466,10 @@ static int __devinit dmfe_init_one (struct pci_dev *pdev,
 	db->chip_id = ent->driver_data;
 	/* IO type range. */
 	db->ioaddr = pci_iomap(pdev, 0, 0);
-	if (!db->ioaddr)
+	if (!db->ioaddr) {
+		err = -ENOMEM;
 		goto err_out_free_buf;
+	}
 
 	db->chip_revision = pdev->revision;
 	db->wol_mode = 0;


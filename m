From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 10:54:59 +0000
Subject: [PATCH net] cxgb4: Signedness bug in init_one()
Message-Id: <20190925105459.GB3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vishal Kulkarni <vishal@chelsio.com>, Ganesh Goudar <ganeshgr@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "chip" variable is an enum, and it's treated as unsigned int by GCC
in this context so the error handling isn't triggered.

Fixes: e8d452923ae6 ("cxgb4: clean up init_one")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 71854a19cebe..38024877751c 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -5701,7 +5701,7 @@ static int init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	whoami = t4_read_reg(adapter, PL_WHOAMI_A);
 	pci_read_config_word(pdev, PCI_DEVICE_ID, &device_id);
 	chip = t4_get_chip_type(adapter, CHELSIO_PCI_ID_VER(device_id));
-	if (chip < 0) {
+	if ((int)chip < 0) {
 		dev_err(&pdev->dev, "Device %d is not supported\n", device_id);
 		err = chip;
 		goto out_free_adapter;
-- 
2.20.1

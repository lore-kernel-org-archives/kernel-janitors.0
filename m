From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 12:19:29 +0000
Subject: [PATCH] epic100: remove redundant variable 'irq'
Message-Id: <20180704121929.9113-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'irq' is being assigned but is never used hence it is
and can be removed.

Cleans up clang warning:
warning: variable 'irq' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/smsc/epic100.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/epic100.c
index 949aaef390b6..15c62c160953 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -321,7 +321,6 @@ static int epic_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	static int card_idx = -1;
 	void __iomem *ioaddr;
 	int chip_idx = (int) ent->driver_data;
-	int irq;
 	struct net_device *dev;
 	struct epic_private *ep;
 	int i, ret, option = 0, duplex = 0;
@@ -338,7 +337,6 @@ static int epic_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	ret = pci_enable_device(pdev);
 	if (ret)
 		goto out;
-	irq = pdev->irq;
 
 	if (pci_resource_len(pdev, 0) < EPIC_TOTAL_SIZE) {
 		dev_err(&pdev->dev, "no PCI region space\n");
-- 
2.17.1


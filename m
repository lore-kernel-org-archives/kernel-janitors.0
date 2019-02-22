From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 22 Feb 2019 05:40:12 +0000
Subject: [PATCH v2] net: set static variable an initial value in atl2_probe()
Message-Id: <20190222054012.194038-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

cards_found is a static variable, but when it enters atl2_probe(),
cards_found is set to zero, the value is not consistent with it in the heap,
so next behavior is not our expect.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2 change the subject from "net: drop pointless static qualifier in atl2_probe()"
 to "net: set static variable an initial value in atl2_probe()";
 keep 'static' for variable cards_found.  
 drivers/net/ethernet/atheros/atlx/atl2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index bb41becb6609..31ff1e0d1baa 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1335,13 +1335,11 @@ static int atl2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct net_device *netdev;
 	struct atl2_adapter *adapter;
-	static int cards_found;
+	static int cards_found = 0;
 	unsigned long mmio_start;
 	int mmio_len;
 	int err;
 
-	cards_found = 0;
-
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
-- 
2.20.1

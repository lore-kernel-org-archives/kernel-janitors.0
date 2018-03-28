From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:55 +0000
Subject: [PATCH net-next] net: cavium: use module_pci_driver to simplify the code
Message-Id: <1522241515-77766-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radoslaw Biernacki <rad@semihalf.com>, Aleksey Makarov <aleksey.makarov@cavium.com>, Philippe Ombredanne <pombredanne@nexb.com>, Jan Glauber <jglauber@cavium.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Use the module_pci_driver() macro to make the code simpler
by eliminating module_init and module_exit calls.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/cavium/common/cavium_ptp.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/cavium/common/cavium_ptp.c b/drivers/net/ethernet/cavium/common/cavium_ptp.c
index d59497a..6aeb104 100644
--- a/drivers/net/ethernet/cavium/common/cavium_ptp.c
+++ b/drivers/net/ethernet/cavium/common/cavium_ptp.c
@@ -336,18 +336,7 @@ static void cavium_ptp_remove(struct pci_dev *pdev)
 	.remove = cavium_ptp_remove,
 };
 
-static int __init cavium_ptp_init_module(void)
-{
-	return pci_register_driver(&cavium_ptp_driver);
-}
-
-static void __exit cavium_ptp_cleanup_module(void)
-{
-	pci_unregister_driver(&cavium_ptp_driver);
-}
-
-module_init(cavium_ptp_init_module);
-module_exit(cavium_ptp_cleanup_module);
+module_pci_driver(cavium_ptp_driver);
 
 MODULE_DESCRIPTION(DRV_NAME);
 MODULE_AUTHOR("Cavium Networks <support@cavium.com>");


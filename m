From: Nikola Pajkovsky <npajkovs@redhat.com>
Date: Sun, 19 Feb 2012 14:45:54 +0000
Subject: [PATCH] b44: fix section mismatch warnings in b44.c
Message-Id: <c8f624fdb13dcf32d82b1abb70a423abc4a2359a.1329662367.git.n.pajkovsky@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gary Zambrano <zambrano@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Nikola Pajkovsky <n.pajkovsky@gmail.com>

From: Nikola Pajkovsky <n.pajkovsky@gmail.com>

Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
---
 drivers/net/ethernet/broadcom/b44.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 66f53c7..46b8b7d8 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -2338,7 +2338,7 @@ static inline int __init b44_pci_init(void)
 	return err;
 }
 
-static inline void __exit b44_pci_exit(void)
+static inline void b44_pci_exit(void)
 {
 #ifdef CONFIG_B44_PCI
 	ssb_pcihost_unregister(&b44_pci_driver);
-- 
1.7.9.1.244.gb0d66b


From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Sun, 19 Feb 2012 20:47:43 +0000
Subject: [PATCH] b44: remove __exit from b44_pci_exit()
Message-Id: <74eccdc061524ad9ab6aae1ca0dd7a020921b1fe.1329684207.git.n.pajkovsky@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gary Zambrano <zambrano@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Nikola Pajkovsky <n.pajkovsky@gmail.com>

WARNING: drivers/net/ethernet/broadcom/built-in.o(.init.text+0x5d): Section mismatch in reference from the function b44_init() to the function .exit.text:b44_pci_exit()

module exits with b44_cleanup()

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


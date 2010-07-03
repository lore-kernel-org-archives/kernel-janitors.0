From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:03:48 +0000
Subject: [PATCH 04/19] arch/powerpc/platforms/pseries: use for_each_pci_dev()
Message-Id: <1278173029-11541-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_cache.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_cache.c b/arch/powerpc/platforms/pseries/eeh_cache.c
index 30b987b..8ed0d2d 100644
--- a/arch/powerpc/platforms/pseries/eeh_cache.c
+++ b/arch/powerpc/platforms/pseries/eeh_cache.c
@@ -288,8 +288,7 @@ void __init pci_addr_cache_build(void)
 
 	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
-
+	for_each_pci_dev(dev) {
 		pci_addr_cache_insert_device(dev);
 
 		dn = pci_device_to_OF_node(dev);
-- 
1.7.0.4


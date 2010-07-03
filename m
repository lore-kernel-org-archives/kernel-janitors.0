From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:11 +0000
Subject: [PATCH 10/19] drivers/ide: use for_each_pci_dev()
Message-Id: <1278173052-11745-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/ide/ide-scan-pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ide/ide-scan-pci.c b/drivers/ide/ide-scan-pci.c
index 0e79eff..c3da53e 100644
--- a/drivers/ide/ide-scan-pci.c
+++ b/drivers/ide/ide-scan-pci.c
@@ -88,7 +88,7 @@ static int __init ide_scan_pcibus(void)
 	struct list_head *l, *n;
 
 	pre_init = 0;
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)))
+	for_each_pci_dev(dev)
 		ide_scan_pcidev(dev);
 
 	/*
-- 
1.7.0.4


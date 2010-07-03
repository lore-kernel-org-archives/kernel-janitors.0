From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:28 +0000
Subject: [PATCH 14/19] drivers/pci: use for_each_pci_dev()
Message-Id: <1278173068-11881-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Tejun Heo <tj@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pci/proc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 449e890..2fd73fb 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -485,9 +485,9 @@ static int __init pci_proc_init(void)
 	proc_create("devices", 0, proc_bus_pci_dir,
 		    &proc_bus_pci_dev_operations);
 	proc_initialized = 1;
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev)
 		pci_proc_attach_device(dev);
-	}
+
 	return 0;
 }
 
-- 
1.7.0.4


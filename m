From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:24 +0000
Subject: [PATCH 13/19] drivers/pci/hotplug: use for_each_pci_dev()
Message-Id: <1278173065-11847-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Stephen Hemminger <shemminger@vyatta.com>, Jens Axboe <jens.axboe@oracle.com>, David Teigland <teigland@redhat.com>, Pekka Enberg <penberg@cs.helsinki.fi>, "Hans J. Koch" <hjk@linutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pci/hotplug/fakephp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/hotplug/fakephp.c b/drivers/pci/hotplug/fakephp.c
index 5317e4d..17d10e2 100644
--- a/drivers/pci/hotplug/fakephp.c
+++ b/drivers/pci/hotplug/fakephp.c
@@ -135,7 +135,7 @@ static int __init init_legacy(void)
 	struct pci_dev *pdev = NULL;
 
 	/* Add existing devices */
-	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)))
+	for_each_pci_dev(pdev)
 		legacy_add_slot(pdev);
 
 	/* Be alerted of any new ones */
-- 
1.7.0.4


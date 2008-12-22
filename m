From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:19:00 +0000
Subject: [PATCH 27/27] drivers/net/wireless/prism54: fix sparse warnings: make
Message-Id: <20081222191900.11807.83181.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/wireless/prism54/islpci_hotplug.c:97:1: warning: symbol 'prism54_probe' was not declared. Should it be static?
  drivers/net/wireless/prism54/islpci_hotplug.c:220:1: warning: symbol 'prism54_remove' was not declared. Should it be static?
  drivers/net/wireless/prism54/islpci_hotplug.c:263:1: warning: symbol 'prism54_suspend' was not declared. Should it be static?
  drivers/net/wireless/prism54/islpci_hotplug.c:286:1: warning: symbol 'prism54_resume' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/prism54/islpci_hotplug.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/prism54/islpci_hotplug.c b/drivers/net/wireless/prism54/islpci_hotplug.c
index af2e4f2..9a72b1e 100644
--- a/drivers/net/wireless/prism54/islpci_hotplug.c
+++ b/drivers/net/wireless/prism54/islpci_hotplug.c
@@ -93,7 +93,7 @@ static struct pci_driver prism54_driver = {
     Module initialization functions
 ******************************************************************************/
 
-int
+static int
 prism54_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct net_device *ndev;
@@ -216,7 +216,7 @@ prism54_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static volatile int __in_cleanup_module = 0;
 
 /* this one removes one(!!) instance only */
-void
+static void
 prism54_remove(struct pci_dev *pdev)
 {
 	struct net_device *ndev = pci_get_drvdata(pdev);
@@ -259,7 +259,7 @@ prism54_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-int
+static int
 prism54_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct net_device *ndev = pci_get_drvdata(pdev);
@@ -282,7 +282,7 @@ prism54_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-int
+static int
 prism54_resume(struct pci_dev *pdev)
 {
 	struct net_device *ndev = pci_get_drvdata(pdev);


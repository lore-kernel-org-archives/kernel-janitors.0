From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 22 Sep 2016 05:23:39 +0000
Subject: [PATCH 08/11] staging: dgnc: introduce the dgnc_free_irq()
Message-Id: <20160922052339.GA27274@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_free_irq() will free the requested IRQ from
the dgnc_request_irq().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 70e68b5..81ce5c4 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -38,6 +38,7 @@ MODULE_SUPPORTED_DEVICE("dgnc");
  */
 static int		dgnc_start(void);
 static int dgnc_request_irq(struct dgnc_board *brd);
+static void dgnc_free_irq(struct dgnc_board *brd);
 static struct dgnc_board *dgnc_found_board(struct pci_dev *pdev, int id);
 static void		dgnc_cleanup_board(struct dgnc_board *brd);
 static void		dgnc_poll_handler(ulong dummy);
@@ -305,7 +306,7 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	rc = dgnc_tty_init(brd);
 	if (rc < 0) {
 		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
-		goto unregister_tty;
+		goto free_irq;
 	}
 
 	brd->state = BOARD_READY;
@@ -317,6 +318,8 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
+free_irq:
+	dgnc_free_irq(brd);
 unregister_tty:
 	dgnc_tty_unregister(brd);
 
@@ -577,6 +580,12 @@ static int dgnc_request_irq(struct dgnc_board *brd)
 	return rc;
 }
 
+static void dgnc_free_irq(struct dgnc_board *brd)
+{
+	if (brd->irq)
+		free_irq(brd->irq, brd);
+}
+
 /*
  * Remap PCI memory.
  */
-- 
1.9.1


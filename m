From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 23 Sep 2016 01:31:37 +0000
Subject: [PATCH 07/11 V2] staging: dgnc: rename dgnc_finalize_board_init() to dgnc_request_irq()
Message-Id: <20160923013137.GA32113@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_finalize_board_init() function has only job for
requesting the IRQ. It should be renamed to dgnc_request_irq()

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: the subject line was cut off, I put it completely.

 drivers/staging/dgnc/dgnc_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index ffe55a2..70e68b5 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -37,7 +37,7 @@ MODULE_SUPPORTED_DEVICE("dgnc");
  *
  */
 static int		dgnc_start(void);
-static int		dgnc_finalize_board_init(struct dgnc_board *brd);
+static int dgnc_request_irq(struct dgnc_board *brd);
 static struct dgnc_board *dgnc_found_board(struct pci_dev *pdev, int id);
 static void		dgnc_cleanup_board(struct dgnc_board *brd);
 static void		dgnc_poll_handler(ulong dummy);
@@ -296,7 +296,7 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto failed;
 	}
 
-	rc = dgnc_finalize_board_init(brd);
+	rc = dgnc_request_irq(brd);
 	if (rc < 0) {
 		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
 		goto unregister_tty;
@@ -558,7 +558,7 @@ failed:
 	return ERR_PTR(rc);
 }
 
-static int dgnc_finalize_board_init(struct dgnc_board *brd)
+static int dgnc_request_irq(struct dgnc_board *brd)
 {
 	int rc = 0;
 
-- 
1.9.1


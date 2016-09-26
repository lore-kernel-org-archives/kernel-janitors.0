From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:43:51 +0000
Subject: [PATCH 06/11 RESEND] staging: dgnc: introduce the dgnc_tty_unregister()
Message-Id: <20160926004351.GA3868@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_tty_unregister() will be called when
the dgnc_tty_register() is failed.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

 drivers/staging/dgnc/dgnc_driver.c | 7 +++++--
 drivers/staging/dgnc/dgnc_tty.c    | 8 ++++++++
 drivers/staging/dgnc/dgnc_tty.h    | 1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index a95d13c..ffe55a2 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -299,13 +299,13 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	rc = dgnc_finalize_board_init(brd);
 	if (rc < 0) {
 		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
-		goto failed;
+		goto unregister_tty;
 	}
 
 	rc = dgnc_tty_init(brd);
 	if (rc < 0) {
 		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
-		goto failed;
+		goto unregister_tty;
 	}
 
 	brd->state = BOARD_READY;
@@ -317,6 +317,9 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
+unregister_tty:
+	dgnc_tty_unregister(brd);
+
 failed:
 	kfree(brd);
 
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index fd46ef0..893f473 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -273,6 +273,14 @@ free_serial_driver:
 	return rc;
 }
 
+void dgnc_tty_unregister(struct dgnc_board *brd)
+{
+	tty_unregister_driver(brd->print_driver);
+	tty_unregister_driver(brd->serial_driver);
+	put_tty_driver(brd->print_driver);
+	put_tty_driver(brd->serial_driver);
+}
+
 /*
  * dgnc_tty_init()
  *
diff --git a/drivers/staging/dgnc/dgnc_tty.h b/drivers/staging/dgnc/dgnc_tty.h
index 21d3369..f065c8f 100644
--- a/drivers/staging/dgnc/dgnc_tty.h
+++ b/drivers/staging/dgnc/dgnc_tty.h
@@ -19,6 +19,7 @@
 #include "dgnc_driver.h"
 
 int	dgnc_tty_register(struct dgnc_board *brd);
+void dgnc_tty_unregister(struct dgnc_board *brd);
 
 int	dgnc_tty_preinit(void);
 int     dgnc_tty_init(struct dgnc_board *);
-- 
1.9.1


From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 04 May 2016 05:41:22 +0000
Subject: [PATCH] staging: dgnc: Fix a NULL pointer dereference
Message-Id: <20160504054122.GA11128@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com

The error handling for print_drive after calling tty_alloc_driver()
was needed. But there was error handling but too late for this.
Error handling code moved after tty_alloc_driver() call.

Fixes: 60b3109e5e2d ("staging: dgnc: use tty_alloc_driver instead of kcalloc")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 2cecdb0..392d532 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -224,6 +224,11 @@ int dgnc_tty_register(struct dgnc_board *brd)
 					     TTY_DRIVER_DYNAMIC_DEV |
 					     TTY_DRIVER_HARDWARE_BREAK);
 
+	if (IS_ERR(brd->print_driver)) {
+		rc = PTR_ERR(brd->print_driver);
+		goto unregister_serial_driver;
+	}
+
 	snprintf(brd->print_name, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
 
 	brd->print_driver->name = brd->print_name;
@@ -235,11 +240,6 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	brd->print_driver->init_termios = DgncDefaultTermios;
 	brd->print_driver->driver_name = DRVSTR;
 
-	if (IS_ERR(brd->print_driver)) {
-		rc = PTR_ERR(brd->print_driver);
-		goto unregister_serial_driver;
-	}
-
 	/*
 	 * Entry points for driver.  Called by the kernel from
 	 * tty_io.c and n_tty.c.
-- 
2.8.2


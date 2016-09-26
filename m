From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:40:58 +0000
Subject: [PATCH 03/11 V2 RESEND] staging: dgnc: missing NULL check for ioremap in dgnc_do_remap()
Message-Id: <20160926004058.GA3774@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The ioremap() function can be failed, so it need to have error
handling in dgnc_do_remap(). And also the return type of
dgnc_do_remap() should be changed from "void" to "int"

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

V2: The subject line was cut off, I put it completely and update
change log.

 drivers/staging/dgnc/dgnc_driver.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index c87b3de..58cebf4 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -43,7 +43,7 @@ static void		dgnc_cleanup_board(struct dgnc_board *brd);
 static void		dgnc_poll_handler(ulong dummy);
 static int		dgnc_init_one(struct pci_dev *pdev,
 				      const struct pci_device_id *ent);
-static void		dgnc_do_remap(struct dgnc_board *brd);
+static int		dgnc_do_remap(struct dgnc_board *brd);
 
 /*
  * File operations permitted on Control/Management major.
@@ -431,7 +431,10 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 		brd->bd_uart_offset = 0x8;
 		brd->bd_dividend = 921600;
 
-		dgnc_do_remap(brd);
+		rc = dgnc_do_remap(brd);
+
+		if (rc < 0)
+			goto failed;
 
 		/* Get and store the board VPD, if it exists */
 		brd->bd_ops->vpd(brd);
@@ -483,15 +486,17 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 		brd->bd_uart_offset = 0x200;
 		brd->bd_dividend = 921600;
 
-		dgnc_do_remap(brd);
+		rc = dgnc_do_remap(brd);
 
-		if (brd->re_map_membase) {
-			/* Read and store the dvid after remapping */
-			brd->dvid = readb(brd->re_map_membase + 0x8D);
+		if (rc < 0)
+			goto failed;
+
+		/* Read and store the dvid after remapping */
+		brd->dvid = readb(brd->re_map_membase + 0x8D);
+
+		/* Get and store the board VPD, if it exists */
+		brd->bd_ops->vpd(brd);
 
-			/* Get and store the board VPD, if it exists */
-			brd->bd_ops->vpd(brd);
-		}
 		break;
 
 	default:
@@ -566,9 +571,15 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
 /*
  * Remap PCI memory.
  */
-static void dgnc_do_remap(struct dgnc_board *brd)
+static int dgnc_do_remap(struct dgnc_board *brd)
 {
+	int rc = 0;
+
 	brd->re_map_membase = ioremap(brd->membase, 0x1000);
+	if (!brd->re_map_membase)
+		rc = -ENOMEM;
+
+	return rc;
 }
 
 /*
-- 
1.9.1


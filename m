From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 10:05:03 +0000
Subject: [patch] mtip32xx: calling kfree() on an error pointer
Message-Id: <20160106100503.GH23185@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Asai Thambi SP <asamymuthupa@micron.com>, Selvan Mani <smani@micron.com>, Jeff Moyer <jmoyer@redhat.com>, Michal Hocko <mhocko@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If memdup_user() fails then we end up passing an ERR_PTR to kfree()
which is a bug.

Fixes: 85b4d87c9962 ('mtip32xx: don't open-code memdup_user()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 618c24f..15bec40 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2032,6 +2032,7 @@ static int exec_drive_taskfile(struct driver_data *dd,
 		outbuf = memdup_user(buf + outtotal, taskout);
 		if (IS_ERR(outbuf)) {
 			err = PTR_ERR(outbuf);
+			outbuf = NULL;
 			goto abort;
 		}
 		outbuf_dma = pci_map_single(dd->pdev,
@@ -2049,6 +2050,7 @@ static int exec_drive_taskfile(struct driver_data *dd,
 		inbuf = memdup_user(buf + intotal, taskin);
 		if (IS_ERR(inbuf)) {
 			err = PTR_ERR(inbuf);
+			inbuf = NULL;
 			goto abort;
 		}
 		inbuf_dma = pci_map_single(dd->pdev,

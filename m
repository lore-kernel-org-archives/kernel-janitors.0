From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 12:57:58 +0000
Subject: [PATCH 1/5] block-skd: Delete an error message for a failed memory allocation in three functions
Message-Id: <ec744353-5262-1c16-0b1a-f647625a3089@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
In-Reply-To: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 13:24:59 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/skd_main.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index d0368682bd43..c90c05555d94 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -1392,12 +1392,9 @@ static int skd_sg_io_get_and_check_args(struct skd_device *skdev,
 		size_t iov_data_len;
 
 		iov = kmalloc(nbytes, GFP_KERNEL);
-		if (iov = NULL) {
-			pr_debug("%s:%s:%d alloc iovec failed %d\n",
-				 skdev->name, __func__, __LINE__,
-				 sgp->iovec_count);
+		if (!iov)
 			return -ENOMEM;
-		}
+
 		sksgio->iov = iov;
 		sksgio->iovcnt = sgp->iovec_count;
 
@@ -3859,8 +3856,6 @@ static int skd_acquire_msix(struct skd_device *skdev)
 			sizeof(struct skd_msix_entry), GFP_KERNEL);
 	if (!skdev->msix_entries) {
 		rc = -ENOMEM;
-		pr_err("(%s): msix table allocation error\n",
-		       skd_name(skdev));
 		goto out;
 	}
 
@@ -4309,12 +4304,8 @@ static struct skd_device *skd_construct(struct pci_dev *pdev)
 	int rc;
 
 	skdev = kzalloc(sizeof(*skdev), GFP_KERNEL);
-
-	if (!skdev) {
-		pr_err(PFX "(%s): memory alloc failure\n",
-		       pci_name(pdev));
+	if (!skdev)
 		return NULL;
-	}
 
 	skdev->state = SKD_DRVR_STATE_LOAD;
 	skdev->pdev = pdev;
-- 
2.13.4


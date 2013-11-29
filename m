From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Nov 2013 08:16:47 +0000
Subject: [patch] skd: wrong limiter in skd_acquire_msix()
Message-Id: <20131129081646.GB3490@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Akhil Bhansali <bhansaliakhil@gmail.com>, rchinthekindi <rchinthekindi@stec-inc.com>, Mike Snitzer <snitzer@redhat.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On some paths, there can be fewer than SKD_MAX_MSIX_COUNT (13) elements
in the skdev->msix_entries[] array so we would be going past the end of
the array.

Fixes: e67f86b31ae5 ('Add support for sTec's pci-e flash card Kronos')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Compile tested only.

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 9199c93be926..d0f3e4e81cc5 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -3989,7 +3989,7 @@ static int skd_acquire_msix(struct skd_device *skdev)
 	}
 
 	/* Enable MSI-X vectors for the base queue */
-	for (i = 0; i < SKD_MAX_MSIX_COUNT; i++) {
+	for (i = 0; i < skdev->msix_count; i++) {
 		qentry = &skdev->msix_entries[i];
 		snprintf(qentry->isr_name, sizeof(qentry->isr_name),
 			 "%s%d-msix %s", DRV_NAME, skdev->devno,

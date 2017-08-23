From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Aug 2017 10:44:20 +0000
Subject: [PATCH] skd: Uninitialized variable in skd_isr_completion_posted()
Message-Id: <20170823104048.w4vdvlp72ug5ackq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bart.vanassche@wdc.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Someone got too agressive about removing initializations and
accidentally removed the "rc = 0;" which is required.

Fixes: c830da8cbc7b ("skd: Remove superfluous initializations from skd_isr_completion_posted()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 9b99081a623c..35938ee0651a 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -1499,7 +1499,7 @@ static int skd_isr_completion_posted(struct skd_device *skdev,
 	u8 cmp_status;
 	u8 cmp_cycle;
 	u32 cmp_bytes;
-	int rc;
+	int rc = 0;
 	int processed = 0;
 
 	lockdep_assert_held(&skdev->lock);

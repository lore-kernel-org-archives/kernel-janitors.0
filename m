From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 May 2014 16:43:54 +0000
Subject: [patch] mei: me: remove unneeded condition
Message-Id: <20140528164354.GE1824@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We know that "err" is zero from the line before.  No need to check
again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index 6a2d272..86694093 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -274,8 +274,7 @@ static int mei_me_hw_ready_wait(struct mei_device *dev)
 			mei_secs_to_jiffies(MEI_HW_READY_TIMEOUT));
 	mutex_lock(&dev->device_lock);
 	if (!err && !dev->recvd_hw_ready) {
-		if (!err)
-			err = -ETIME;
+		err = -ETIME;
 		dev_err(&dev->pdev->dev,
 			"wait hw ready failed. status = %d\n", err);
 		return err;

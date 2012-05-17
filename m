From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2012 06:49:11 +0000
Subject: [patch] md/raid10: unlock on error path in raid10_start_reshape()
Message-Id: <20120517064911.GB14660@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Brown <neilb@suse.de>
Cc: linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock and enable IRQs before returning here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index e8ed1d8..ba7290f 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3918,6 +3918,7 @@ static int raid10_start_reshape(struct mddev *mddev)
 	if (mddev->reshape_backwards) {
 		sector_t size = raid10_size(mddev, 0, 0);
 		if (size < mddev->array_sectors) {
+			spin_unlock_irq(&conf->device_lock);
 			printk(KERN_ERR "md/raid10:%s: array size must be reduce before number of disks\n",
 			       mdname(mddev));
 			return -EINVAL;

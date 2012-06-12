From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 07:43:11 +0000
Subject: [patch] drbd: potential integer overflow in receive_SyncParam()
Message-Id: <20120612074310.GC15060@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I believe this comes from the network so there is a risk of integer
overflow on 32 bit.  Using kcalloc() is a little cleaner as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index ea4836e..1e27876 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2902,7 +2902,7 @@ static int receive_SyncParam(struct drbd_conf *mdev, enum drbd_packets cmd, unsi
 
 			fifo_size = (mdev->sync_conf.c_plan_ahead * 10 * SLEEP_TIME) / HZ;
 			if (fifo_size != mdev->rs_plan_s.size && fifo_size > 0) {
-				rs_plan_s   = kzalloc(sizeof(int) * fifo_size, GFP_KERNEL);
+				rs_plan_s = kcalloc(fifo_size, sizeof(int), GFP_KERNEL);
 				if (!rs_plan_s) {
 					dev_err(DEV, "kmalloc of fifo_buffer failed");
 					goto disconnect;

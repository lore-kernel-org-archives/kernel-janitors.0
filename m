From: Dan Carpenter <error27@gmail.com>
Date: Sat, 23 Jan 2010 12:45:22 +0000
Subject: [patch] drbd: null dereference bug
Message-Id: <20100123124522.GA3061@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

epoch is always NULL here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This patch has only been compile tested.  Sorry.  :/

--- orig/drivers/block/drbd/drbd_receiver.c	2010-01-23 10:53:13.000000000 +0300
+++ devel/drivers/block/drbd/drbd_receiver.c	2010-01-23 10:54:19.000000000 +0300
@@ -1224,7 +1224,7 @@ static int receive_Barrier(struct drbd_c
 	epoch = kmalloc(sizeof(struct drbd_epoch), GFP_NOIO);
 	if (!epoch) {
 		dev_warn(DEV, "Allocation of an epoch failed, slowing down\n");
-		issue_flush = !test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &epoch->flags);
+		issue_flush = !test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &mdev->current_epoch->flags);
 		drbd_wait_ee_list_empty(mdev, &mdev->active_ee);
 		if (issue_flush) {
 			rv = drbd_flush_after_epoch(mdev, mdev->current_epoch);

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 27 Mar 2010 14:59:50 +0000
Subject: [patch] drbd: potential null dereference
Message-Id: <20100327145950.GG5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, Philipp Reisner <philipp.reisner@linbit.com>, drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If "e" is NULL then "bm_ext" would be NULL too.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found by static analysis and compile tested only.  Sorry.  :/

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index 17956ff..b68b778 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -1328,7 +1328,7 @@ int drbd_rs_del_all(struct drbd_conf *mdev)
 		for (i = 0; i < mdev->resync->nr_elements; i++) {
 			e = lc_element_by_index(mdev->resync, i);
 			bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-			if (bm_ext->lce.lc_number = LC_FREE)
+			if (!bm_ext || bm_ext->lce.lc_number = LC_FREE)
 				continue;
 			if (bm_ext->lce.lc_number = mdev->resync_wenr) {
 				dev_info(DEV, "dropping %u in drbd_rs_del_all, apparently"

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Sep 2016 19:09:32 +0000
Subject: [PATCH 23/47] block-rbd: Rename jump labels in get_lock_owner_info()
Message-Id: <ec611e88-99fe-26c2-5fe8-ac6bf8fb6ef4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <57806eb1-10ed-582e-72d0-2975e1ee967a@users.sourceforge.net>
In-Reply-To: <57806eb1-10ed-582e-72d0-2975e1ee967a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ceph-devel@vger.kernel.org, Alex Elder <elder@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Sage Weil <sage@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Sep 2016 19:37:52 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/rbd.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index ba8fb74..e175d21 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -3381,20 +3381,20 @@ static int get_lock_owner_info(struct rbd_device *rbd_dev,
 
 	if (*num_lockers = 0) {
 		dout("%s rbd_dev %p no lockers detected\n", __func__, rbd_dev);
-		goto out;
+		goto free_tag;
 	}
 
 	if (strcmp(lock_tag, RBD_LOCK_TAG)) {
 		rbd_warn(rbd_dev, "locked by external mechanism, tag %s",
 			 lock_tag);
 		ret = -EBUSY;
-		goto out;
+		goto free_tag;
 	}
 
 	if (lock_type = CEPH_CLS_LOCK_SHARED) {
 		rbd_warn(rbd_dev, "shared lock type detected");
 		ret = -EBUSY;
-		goto out;
+		goto free_tag;
 	}
 
 	if (strncmp((*lockers)[0].id.cookie, RBD_LOCK_COOKIE_PREFIX,
@@ -3402,10 +3402,8 @@ static int get_lock_owner_info(struct rbd_device *rbd_dev,
 		rbd_warn(rbd_dev, "locked by external mechanism, cookie %s",
 			 (*lockers)[0].id.cookie);
 		ret = -EBUSY;
-		goto out;
 	}
-
-out:
+ free_tag:
 	kfree(lock_tag);
 	return ret;
 }
-- 
2.10.0


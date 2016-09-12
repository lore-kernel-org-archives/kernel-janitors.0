From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Sep 2016 19:28:18 +0000
Subject: [PATCH 39/47] block-rbd: Rename a jump label in rbd_ioctl_set_ro()
Message-Id: <754b2b00-bf3b-7ed1-2605-c7b3f2269bf7@users.sourceforge.net>
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
Date: Mon, 12 Sep 2016 19:58:22 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/rbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 9902a7f..e01df3c 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -654,15 +654,14 @@ static int rbd_ioctl_set_ro(struct rbd_device *rbd_dev, unsigned long arg)
 	/* prevent others open this device */
 	if (rbd_dev->open_count > 1) {
 		ret = -EBUSY;
-		goto out;
+		goto unlock;
 	}
 
 	if (rbd_dev->mapping.read_only != ro) {
 		rbd_dev->mapping.read_only = ro;
 		ro_changed = true;
 	}
-
-out:
+ unlock:
 	spin_unlock_irq(&rbd_dev->lock);
 	/* set_disk_ro() may sleep, so call it after releasing rbd_dev->lock */
 	if (ret = 0 && ro_changed)
-- 
2.10.0


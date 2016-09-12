From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Sep 2016 19:06:10 +0000
Subject: [PATCH 20/47] block-rbd: Rename a jump label in rbd_register_watch()
Message-Id: <76429d28-548c-63dd-fee7-ca5585b88856@users.sourceforge.net>
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
Date: Mon, 12 Sep 2016 19:33:00 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/rbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 97dbc1a..b0b5a3b 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -3900,12 +3900,11 @@ static int rbd_register_watch(struct rbd_device *rbd_dev)
 	rbd_assert(rbd_dev->watch_state = RBD_WATCH_STATE_UNREGISTERED);
 	ret = __rbd_register_watch(rbd_dev);
 	if (ret)
-		goto out;
+		goto unlock;
 
 	rbd_dev->watch_state = RBD_WATCH_STATE_REGISTERED;
 	rbd_dev->watch_cookie = rbd_dev->watch_handle->linger_id;
-
-out:
+ unlock:
 	mutex_unlock(&rbd_dev->watch_mutex);
 	return ret;
 }
-- 
2.10.0


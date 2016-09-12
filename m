From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Sep 2016 19:16:34 +0000
Subject: [PATCH 30/47] block-rbd: Refactor a jump target in rbd_img_obj_exists_callback()
Message-Id: <0c3708aa-f7b2-0b0f-234d-dd63f44e7072@users.sourceforge.net>
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
Date: Mon, 12 Sep 2016 19:46:43 +0200

Adjust a jump target so that a duplicate check can then be avoided
at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/rbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index f3f2919..7d5f7b9 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -2879,7 +2879,7 @@ static void rbd_img_obj_exists_callback(struct rbd_obj_request *obj_request)
 		obj_request_existence_set(orig_request, false);
 	} else if (result) {
 		orig_request->result = result;
-		goto out;
+		goto complete_request;
 	}
 
 	/*
@@ -2887,8 +2887,8 @@ static void rbd_img_obj_exists_callback(struct rbd_obj_request *obj_request)
 	 * whether the target object exists.
 	 */
 	orig_request->result = rbd_img_obj_request_submit(orig_request);
-out:
 	if (orig_request->result)
+ complete_request:
 		rbd_obj_request_complete(orig_request);
 }
 
-- 
2.10.0


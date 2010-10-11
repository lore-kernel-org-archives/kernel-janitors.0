From: Dan Carpenter <error27@gmail.com>
Date: Mon, 11 Oct 2010 19:14:23 +0000
Subject: [patch 1/2 -next] rbd: null vs ERR_PTR
Message-Id: <20101011191423.GI5851@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yehuda Sadeh <yehuda@hq.newdream.net>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

ceph_alloc_page_vector() returns ERR_PTR(-ENOMEM) on errors.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 1ac87f1..52f9420 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -826,8 +826,8 @@ static int rbd_req_sync_op(struct rbd_device *dev,
 
 	num_pages = calc_pages_for(ofs , len);
 	pages = ceph_alloc_page_vector(num_pages, GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
 
 	if (!orig_ops) {
 		payload_len = (flags & CEPH_OSD_FLAG_WRITE ? len : 0);

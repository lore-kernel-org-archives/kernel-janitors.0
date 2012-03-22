From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Mar 2012 06:33:09 +0000
Subject: [patch] rbd: use gfp_flags parameter in rbd_header_from_disk()
Message-Id: <20120322063309.GC7369@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yehuda Sadeh <yehuda@hq.newdream.net>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should use the gfp_flags that the caller specified instead of
GFP_KERNEL here.

There is only one caller and it uses GFP_KERNEL, so this change is just
a cleanup and doesn't change how the code works.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index a6278e7..fc9341f 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -474,11 +474,11 @@ static int rbd_header_from_disk(struct rbd_image_header *header,
 		return -ENOMEM;
 	if (snap_count) {
 		header->snap_names = kmalloc(header->snap_names_len,
-					     GFP_KERNEL);
+					     gfp_flags);
 		if (!header->snap_names)
 			goto err_snapc;
 		header->snap_sizes = kmalloc(snap_count * sizeof(u64),
-					     GFP_KERNEL);
+					     gfp_flags);
 		if (!header->snap_sizes)
 			goto err_names;
 	} else {

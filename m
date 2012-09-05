From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 12:32:53 +0000
Subject: [patch] virtio-blk: fix NULL checking in virtblk_alloc_req()
Message-Id: <20120905123252.GE6128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Asias He <asias@redhat.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>

Smatch complains about the inconsistent NULL checking here.  Fix it to
return NULL on failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is only needed in linux-next.

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2edfb5c..457db0c 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -90,10 +90,11 @@ static inline struct virtblk_req *virtblk_alloc_req(struct virtio_blk *vblk,
 	struct virtblk_req *vbr;
 
 	vbr = mempool_alloc(vblk->pool, gfp_mask);
-	if (vbr && use_bio)
-		sg_init_table(vbr->sg, vblk->sg_elems);
+	if (!vbr)
+		return NULL;
 
-	vbr->vblk = vblk;
+	if (use_bio)
+		sg_init_table(vbr->sg, vblk->sg_elems);
 
 	return vbr;
 }

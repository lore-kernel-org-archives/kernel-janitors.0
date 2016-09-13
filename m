From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 12:12:01 +0000
Subject: [PATCH 1/4] virtio_blk: Use kmalloc_array() in init_vq()
Message-Id: <7a8dd874-3700-1445-2143-2a604cd043ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
In-Reply-To: <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 11:32:22 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/virtio_blk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 93b1aaa..6553eb7 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -390,13 +390,13 @@ static int init_vq(struct virtio_blk *vblk)
 	if (err)
 		num_vqs = 1;
 
-	vblk->vqs = kmalloc(sizeof(*vblk->vqs) * num_vqs, GFP_KERNEL);
+	vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
 	if (!vblk->vqs)
 		return -ENOMEM;
 
-	names = kmalloc(sizeof(*names) * num_vqs, GFP_KERNEL);
-	callbacks = kmalloc(sizeof(*callbacks) * num_vqs, GFP_KERNEL);
-	vqs = kmalloc(sizeof(*vqs) * num_vqs, GFP_KERNEL);
+	names = kmalloc_array(num_vqs, sizeof(*names), GFP_KERNEL);
+	callbacks = kmalloc_array(num_vqs, sizeof(*callbacks), GFP_KERNEL);
+	vqs = kmalloc_array(num_vqs, sizeof(*vqs), GFP_KERNEL);
 	if (!names || !callbacks || !vqs) {
 		err = -ENOMEM;
 		goto out;
-- 
2.10.0


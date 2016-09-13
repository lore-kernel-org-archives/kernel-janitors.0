From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 12:13:03 +0000
Subject: [PATCH 2/4] virtio_blk: Less function calls in init_vq() after error detection
Message-Id: <f56845a8-03c6-d3f7-6091-99dba9835780@users.sourceforge.net>
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
Date: Tue, 13 Sep 2016 13:20:44 +0200

The kfree() function was called in up to three cases
by the init_vq() function during error handling even if
the passed variable contained a null pointer.

* Split a condition check for memory allocation failures.

* Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/virtio_blk.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 6553eb7..d28dbcf 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -395,11 +395,21 @@ static int init_vq(struct virtio_blk *vblk)
 		return -ENOMEM;
 
 	names = kmalloc_array(num_vqs, sizeof(*names), GFP_KERNEL);
+	if (!names) {
+		err = -ENOMEM;
+		goto free_vblk_vqs;
+	}
+
 	callbacks = kmalloc_array(num_vqs, sizeof(*callbacks), GFP_KERNEL);
+	if (!callbacks) {
+		err = -ENOMEM;
+		goto free_names;
+	}
+
 	vqs = kmalloc_array(num_vqs, sizeof(*vqs), GFP_KERNEL);
-	if (!names || !callbacks || !vqs) {
+	if (!vqs) {
 		err = -ENOMEM;
-		goto out;
+		goto free_callbacks;
 	}
 
 	for (i = 0; i < num_vqs; i++) {
@@ -411,19 +421,21 @@ static int init_vq(struct virtio_blk *vblk)
 	/* Discover virtqueues and write information to configuration.  */
 	err = vdev->config->find_vqs(vdev, num_vqs, vqs, callbacks, names);
 	if (err)
-		goto out;
+		goto free_vqs;
 
 	for (i = 0; i < num_vqs; i++) {
 		spin_lock_init(&vblk->vqs[i].lock);
 		vblk->vqs[i].vq = vqs[i];
 	}
 	vblk->num_vqs = num_vqs;
-
-out:
+ free_vqs:
 	kfree(vqs);
+ free_callbacks:
 	kfree(callbacks);
+ free_names:
 	kfree(names);
 	if (err)
+ free_vblk_vqs:
 		kfree(vblk->vqs);
 	return err;
 }
-- 
2.10.0


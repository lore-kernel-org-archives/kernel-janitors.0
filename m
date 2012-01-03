From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jan 2012 14:45:13 +0000
Subject: [patch] virtio_blk: lock() => unlock() typo in
Message-Id: <20120103144513.GB21712@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

This will deadlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index f3d77b3..ba73661 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -352,7 +352,7 @@ static void virtblk_config_changed_work(struct work_struct *work)
 
 	set_capacity(vblk->disk, capacity);
 done:
-	mutex_lock(&vblk->config_lock);
+	mutex_unlock(&vblk->config_lock);
 }
 
 static void virtblk_config_changed(struct virtio_device *vdev)

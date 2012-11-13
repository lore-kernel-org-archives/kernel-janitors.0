From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Nov 2012 07:43:03 +0000
Subject: [patch] virtio_balloon: unlock on error in fill_balloon()
Message-Id: <20121113074303.GA13198@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>, Rafael Aquini <aquini@redhat.com>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

We recently added locking in fill_balloon() but there was one error path
which was missed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index f70151b..1c50e98 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -153,9 +153,10 @@ static void fill_balloon(struct virtio_balloon *vb, size_t num)
 
 	/* Didn't get any?  Oh well. */
 	if (vb->num_pfns = 0)
-		return;
+		goto unlock;
 
 	tell_host(vb, vb->inflate_vq);
+unlock:
 	mutex_unlock(&vb->balloon_lock);
 }
 

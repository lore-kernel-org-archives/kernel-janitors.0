From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:09:03 +0000
Subject: [PATCH 10/11] virtio_console: Rename jump labels in alloc_buf()
Message-Id: <7529185b-100b-6724-f4a9-eb3b4d290ed7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
In-Reply-To: <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Amit Shah <amit.shah@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 15:20:30 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 69c6718..0c4d4e7 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -431,7 +431,7 @@ static struct port_buffer *alloc_buf(struct virtqueue *vq, size_t buf_size,
 	buf = kmalloc(sizeof(*buf) + sizeof(struct scatterlist) * pages,
 		      GFP_KERNEL);
 	if (!buf)
-		goto fail;
+		goto exit;
 
 	buf->sgpages = pages;
 	if (pages > 0) {
@@ -451,7 +451,7 @@ static struct port_buffer *alloc_buf(struct virtqueue *vq, size_t buf_size,
 		 * in dma-coherent.c
 		 */
 		if (!vq->vdev->dev.parent || !vq->vdev->dev.parent->parent)
-			goto free_buf;
+			goto free_buffer;
 		buf->dev = vq->vdev->dev.parent->parent;
 
 		/* Increase device refcnt to avoid freeing it */
@@ -464,15 +464,14 @@ static struct port_buffer *alloc_buf(struct virtqueue *vq, size_t buf_size,
 	}
 
 	if (!buf->buf)
-		goto free_buf;
+		goto free_buffer;
 	buf->len = 0;
 	buf->offset = 0;
 	buf->size = buf_size;
 	return buf;
-
-free_buf:
+ free_buffer:
 	kfree(buf);
-fail:
+ exit:
 	return NULL;
 }
 
-- 
2.10.0


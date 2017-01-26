From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 21:47:59 +0000
Subject: [PATCH 3/3] virtio_ring: Use kmalloc_array() in alloc_indirect()
Message-Id: <a460744a-0fec-4a47-c98a-42b88ddada64@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
In-Reply-To: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 22:30:45 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virtio/virtio_ring.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 409aeaa49246..34b6b694298c 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -247,8 +247,7 @@ static struct vring_desc *alloc_indirect(struct virtqueue *_vq,
 	 * virtqueue.
 	 */
 	gfp &= ~__GFP_HIGHMEM;
-
-	desc = kmalloc(total_sg * sizeof(struct vring_desc), gfp);
+	desc = kmalloc_array(total_sg, sizeof(*desc), gfp);
 	if (!desc)
 		return NULL;
 
-- 
2.11.0


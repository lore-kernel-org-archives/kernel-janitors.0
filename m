From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 21:46:00 +0000
Subject: [PATCH 1/3] virtio_pci: Use kcalloc() in vp_request_msix_vectors()
Message-Id: <57a18132-3b9d-0e5b-5372-efe525f83100@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
In-Reply-To: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 22:10:18 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus reuse the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virtio/virtio_pci_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 186cbab327b8..559a2b706093 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -117,7 +117,7 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 	if (!vp_dev->msix_names)
 		goto error;
 	vp_dev->msix_affinity_masks
-		= kzalloc(nvectors * sizeof *vp_dev->msix_affinity_masks,
+		= kcalloc(nvectors, sizeof(*vp_dev->msix_affinity_masks),
 			  GFP_KERNEL);
 	if (!vp_dev->msix_affinity_masks)
 		goto error;
-- 
2.11.0


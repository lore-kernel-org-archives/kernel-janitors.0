From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 21:46:57 +0000
Subject: [PATCH 2/3] virtio_pci: Use kmalloc_array() in vp_request_msix_vectors()
Message-Id: <02a6f5e2-d20b-3e71-5eaa-344331bec7f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
In-Reply-To: <61829748-a13d-42e4-8f6c-103ee5ca2c88@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 22:20:30 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus reuse the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/virtio/virtio_pci_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 559a2b706093..623a8cea1441 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -111,9 +111,9 @@ static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
 	int err = -ENOMEM;
 
 	vp_dev->msix_vectors = nvectors;
-
-	vp_dev->msix_names = kmalloc(nvectors * sizeof *vp_dev->msix_names,
-				     GFP_KERNEL);
+	vp_dev->msix_names = kmalloc_array(nvectors,
+					   sizeof(*vp_dev->msix_names),
+					   GFP_KERNEL);
 	if (!vp_dev->msix_names)
 		goto error;
 	vp_dev->msix_affinity_masks
-- 
2.11.0


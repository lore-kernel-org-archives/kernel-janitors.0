From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Mar 2017 14:08:21 +0000
Subject: [PATCH] virtio: remove redundant check on error return err
Message-Id: <20170307140821.29689-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

err has previously been checked for a -ve error return so this
redundant check can be removed.

Detected by CoverityScan, CID#1415271 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/virtio/virtio_pci_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index df548a6..ceb4395 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -173,8 +173,6 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned nvqs,
 		if (err < 0)
 			return err;
 	}
-	if (err < 0)
-		return err;
 
 	vp_dev->msix_vectors = nvectors;
 	vp_dev->msix_names = kmalloc_array(nvectors,
-- 
2.10.2


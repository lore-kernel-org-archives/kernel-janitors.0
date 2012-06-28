From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2012 08:07:25 +0000
Subject: [patch 1/3 v2] vfio: signedness bug in vfio_config_do_rw()
Message-Id: <20120628080725.GA22595@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4FEC0480.7010508@bfs.de>
In-Reply-To: <4FEC0480.7010508@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>

The "count" variable needs to be signed here because we use it to store
negative error codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Just declare count as signed.

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a4f7321..2e00aa8 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -1419,7 +1419,7 @@ void vfio_config_free(struct vfio_pci_device *vdev)
 }
 
 static ssize_t vfio_config_do_rw(struct vfio_pci_device *vdev, char __user *buf,
-				 size_t count, loff_t *ppos, bool iswrite)
+				 ssize_t count, loff_t *ppos, bool iswrite)
 {
 	struct pci_dev *pdev = vdev->pdev;
 	struct perm_bits *perm;

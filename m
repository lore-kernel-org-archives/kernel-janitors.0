From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Feb 2016 07:52:12 +0000
Subject: [patch] vfio/pci: return -EFAULT if copy_to_user fails
Message-Id: <20160225075212.GD7333@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Antonios Motakis <a.motakis@virtualopensystems.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes that were not
copied but we want to return -EFAULT on error here.

Fixes: 188ad9d6cbbc ('vfio/pci: Include sparse mmap capability for MSI-X table regions')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 1ce1d36..98059df 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -664,12 +664,11 @@ static long vfio_pci_ioctl(void *device_data,
 				info.cap_offset = 0;
 			} else {
 				vfio_info_cap_shift(&caps, sizeof(info));
-				ret = copy_to_user((void __user *)arg +
-						   sizeof(info), caps.buf,
-						   caps.size);
-				if (ret) {
+				if (copy_to_user((void __user *)arg +
+						  sizeof(info), caps.buf,
+						  caps.size)) {
 					kfree(caps.buf);
-					return ret;
+					return -EFAULT;
 				}
 				info.cap_offset = sizeof(info);
 			}

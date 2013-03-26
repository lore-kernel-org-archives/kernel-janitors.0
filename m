From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2013 13:13:58 +0000
Subject: [patch] vfio-pci: integer overflow in vfio_pci_ioctl()
Message-Id: <20130326131358.GA11516@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jiang Liu <jiang.liu@huawei.com>, Vijay Mohan Pandarathil <vijaymohan.pandarathil@hp.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

The worry here is that a large value of hdr.start would cause a
read before the start of the array and a crash in
vfio_msi_set_vector_signal().

The check in vfio_msi_set_block() is not enough:

	if (start + count > vdev->num_ctx)
		return -EINVAL;

A large value of "start" would lead to an integer overflow.

The check in vfio_msi_set_vector_signal() doesn't work either:

	if (vector >= vdev->num_ctx)
		return -EINVAL;

Here "vector" is "count" casted to a signed int so it would be negative
and thus smaller than "vdev->num_ctx" which is also a signed int.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  Untested.

This patch is not beautiful.  There is probably a better limit to use if
I knew the code.

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index acfcb1a..de54f69 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -371,6 +371,9 @@ static long vfio_pci_ioctl(void *device_data,
 			    hdr.count > vfio_pci_get_irq_count(vdev, hdr.index))
 				return -EINVAL;
 
+			if (hdr.start > INT_MAX - hdr.count)
+				return -EINVAL;
+
 			data = memdup_user((void __user *)(arg + minsz),
 					   hdr.count * size);
 			if (IS_ERR(data))

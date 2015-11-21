From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Nov 2015 10:32:21 +0000
Subject: [patch] vfio: fix a warning message
Message-Id: <20151121103221.GC7002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

The first argument to the WARN() macro has to be a condition.  I'm sort
of disappointed that this code doesn't generate a compiler warning.  I
guess -Wformat-extra-args doesn't work in the kernel.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index de632da..9da0703 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -682,7 +682,7 @@ static int vfio_group_nb_add_dev(struct vfio_group *group, struct device *dev)
 		return 0;
 
 	/* TODO Prevent device auto probing */
-	WARN("Device %s added to live group %d!\n", dev_name(dev),
+	WARN(1, "Device %s added to live group %d!\n", dev_name(dev),
 	     iommu_group_id(group->iommu_group));
 
 	return 0;

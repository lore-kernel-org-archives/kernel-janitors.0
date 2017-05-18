From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 May 2017 07:34:31 +0000
Subject: [PATCH] vfio: Use ERR_CAST() instead of open coding it
Message-Id: <20170518073431.sc6x2at4n4j7hngu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

It's a small cleanup to use ERR_CAST() here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 561084ab387f..6a49485eb49d 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -382,7 +382,7 @@ static struct vfio_group *vfio_create_group(struct iommu_group *iommu_group)
 	if (IS_ERR(dev)) {
 		vfio_free_group_minor(minor);
 		vfio_group_unlock_and_free(group);
-		return (struct vfio_group *)dev; /* ERR_PTR */
+		return ERR_CAST(dev);
 	}
 
 	group->minor = minor;

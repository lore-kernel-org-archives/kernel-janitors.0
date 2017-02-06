From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Feb 2017 09:18:58 +0000
Subject: [patch] iommu: silence an uninintialized variable warning
Message-Id: <20170206091858.GA17668@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <77520e58-f6e9-f4d5-d909-90cea7ed6bae@redhat.com>
In-Reply-To: <77520e58-f6e9-f4d5-d909-90cea7ed6bae-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Eric Auger <eric.auger-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

My static checker complains that we return an uninitialized scalar if
the list is empty.  If that's the case then we should return zero.

Fixes: 6c65fb318e8b ("iommu: iommu_get_group_resv_regions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b752c3d91cfc..0e1750481ebc 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -210,9 +210,9 @@ iommu_insert_device_resv_regions(struct list_head *dev_resv_regions,
 	list_for_each_entry(entry, dev_resv_regions, list) {
 		ret = iommu_insert_resv_region(entry, group_resv_regions);
 		if (ret)
-			break;
+			return ret;
 	}
-	return ret;
+	return 0;
 }
 
 int iommu_get_group_resv_regions(struct iommu_group *group,

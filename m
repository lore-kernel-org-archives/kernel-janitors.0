From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Apr 2016 07:14:46 +0000
Subject: [patch] iommu/amd: Signedness bug in acpihid_device_group()
Message-Id: <20160411071446.GB10739@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Wan Zongshun <Vincent.Wan-5C7GfCeVMHo@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"devid" needs to be signed for the error handling to work.

Fixes:b097d11a0fa3f ('iommu/amd: Manage iommu_group for ACPI HID devices')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index c430c10..12f7779 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -283,7 +283,7 @@ static struct iommu_dev_data *get_dev_data(struct device *dev)
 static struct iommu_group *acpihid_device_group(struct device *dev)
 {
 	struct acpihid_map_entry *p, *entry = NULL;
-	u16 devid;
+	int devid;
 
 	devid = get_acpihid_device_id(dev, &entry);
 	if (devid < 0)

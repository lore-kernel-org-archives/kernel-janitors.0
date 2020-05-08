From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 08 May 2020 13:40:36 +0000
Subject: [PATCH -next] iommu/amd: Remove set but not used variable 'iommu'
Message-Id: <20200508134036.116569-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541657560-73681-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541657560-73681-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/iommu/amd_iommu.c: In function 'amd_iommu_uninit_device':
drivers/iommu/amd_iommu.c:422:20: warning:
 variable 'iommu' set but not used [-Wunused-but-set-variable]

commit dce8d6964ebd ("iommu/amd: Convert to probe/release_device() call-backs")
involved this, remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/iommu/amd_iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index fef3689ee535..2b8eb58d2bea 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -419,15 +419,12 @@ static void iommu_ignore_device(struct device *dev)
 static void amd_iommu_uninit_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
-	struct amd_iommu *iommu;
 	int devid;
 
 	devid = get_device_id(dev);
 	if (devid < 0)
 		return;
 
-	iommu = amd_iommu_rlookup_table[devid];
-
 	dev_data = search_dev_data(devid);
 	if (!dev_data)
 		return;

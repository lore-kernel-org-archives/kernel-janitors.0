From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Feb 2015 10:52:01 +0000
Subject: [patch] iommu/amd: small cleanup in mn_release()
Message-Id: <20150220105201.GA7895@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"pasid_state->device_state" and "dev_state" are the same, but it's nicer
to use dev_state consistently.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/amd_iommu_v2.c b/drivers/iommu/amd_iommu_v2.c
index 6d5a5c4..a1cbba9 100644
--- a/drivers/iommu/amd_iommu_v2.c
+++ b/drivers/iommu/amd_iommu_v2.c
@@ -417,7 +417,7 @@ static void mn_release(struct mmu_notifier *mn, struct mm_struct *mm)
 	dev_state      = pasid_state->device_state;
 	run_inv_ctx_cb = !pasid_state->invalid;
 
-	if (run_inv_ctx_cb && pasid_state->device_state->inv_ctx_cb)
+	if (run_inv_ctx_cb && dev_state->inv_ctx_cb)
 		dev_state->inv_ctx_cb(dev_state->pdev, pasid_state->pasid);
 
 	unbind_pasid(pasid_state);

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 16:43:29 +0000
Subject: [patch] amdkfd: delete some dead code
Message-Id: <20141125164329.GC19894@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@amd.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This is dead code.  We don't need to unbind here, we can just return
directly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a17e2dd..b4f49ac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -348,11 +348,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 	if (err < 0)
 		return ERR_PTR(err);
 
-	if (err < 0) {
-		amd_iommu_unbind_pasid(dev->pdev, p->pasid);
-		return ERR_PTR(err);
-	}
-
 	pdd->bound = true;
 
 	return pdd;

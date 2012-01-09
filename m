From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jan 2012 12:45:41 +0000
Subject: [patch 2/2] drm/radeon: double lock typo in radeon_vm_bo_rmv()
Message-Id: <20120109124541.GB29606@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

The second lock should be an unlock or it causes a deadlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index 2944c78..4a9f797 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -595,7 +595,7 @@ int radeon_vm_bo_rmv(struct radeon_device *rdev,
 	radeon_vm_bo_update_pte(rdev, vm, bo, NULL);
 	radeon_mutex_unlock(&rdev->cs_mutex);
 	list_del(&bo_va->vm_list);
-	mutex_lock(&vm->mutex);
+	mutex_unlock(&vm->mutex);
 
 	kfree(bo_va);
 	return 0;

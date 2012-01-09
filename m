From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jan 2012 12:44:50 +0000
Subject: [patch 1/2] drm/radeon: use after free in radeon_vm_bo_add()
Message-Id: <20120109124450.GA29606@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

"bo_va" is dereferenced in the error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index 3ef58ca..2944c78 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -486,10 +486,10 @@ int radeon_vm_bo_add(struct radeon_device *rdev,
 		}
 		if (bo_va->soffset >= tmp->soffset && bo_va->soffset < tmp->eoffset) {
 			/* bo and tmp overlap, invalid offset */
-			kfree(bo_va);
 			dev_err(rdev->dev, "bo %p va 0x%08X conflict with (bo %p 0x%08X 0x%08X)\n",
 				bo, (unsigned)bo_va->soffset, tmp->bo,
 				(unsigned)tmp->soffset, (unsigned)tmp->eoffset);
+			kfree(bo_va);
 			mutex_unlock(&vm->mutex);
 			return -EINVAL;
 		}

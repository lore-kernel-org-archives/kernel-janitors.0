From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Aug 2014 15:27:37 +0000
Subject: [patch] drm/radeon: add a check for allocation failure
Message-Id: <20140807152736.GA10299@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We can easily return -ENOMEM here if kzalloc() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index ccae4d9..d15d987 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -483,6 +483,8 @@ int radeon_vm_bo_set_addr(struct radeon_device *rdev,
 			/* add a clone of the bo_va to clear the old address */
 			struct radeon_bo_va *tmp;
 			tmp = kzalloc(sizeof(struct radeon_bo_va), GFP_KERNEL);
+			if (!tmp)
+				return -ENOMEM;
 			tmp->it.start = bo_va->it.start;
 			tmp->it.last = bo_va->it.last;
 			tmp->vm = vm;

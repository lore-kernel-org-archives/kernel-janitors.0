From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Sep 2018 10:41:33 +0000
Subject: [PATCH] drm/amdgpu: fix a NULL check in debugfs init
Message-Id: <20180926104133.GB14535@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Andrey Grodzovsky <andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The debugfs_create_file() returns error pointers if DEBUGFS isn't
enabled.  But here, we know that it is enabled so it returns NULL on
error which could lead to a NULL dereference a few lines later.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
If someone wanted to delete the error handling as well that would also
be fine, but I decided not to bother with that.

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f5fb93795a69..0d806dfd5eeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -832,12 +832,12 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 		ent = debugfs_create_file(debugfs_regs_names[i],
 					  S_IFREG | S_IRUGO, root,
 					  adev, debugfs_regs[i]);
-		if (IS_ERR(ent)) {
+		if (!ent) {
 			for (j = 0; j < i; j++) {
 				debugfs_remove(adev->debugfs_regs[i]);
 				adev->debugfs_regs[i] = NULL;
 			}
-			return PTR_ERR(ent);
+			return -ENOMEM;
 		}
 
 		if (!i)

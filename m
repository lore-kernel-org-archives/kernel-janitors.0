From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jun 2018 14:45:23 +0000
Subject: [PATCH] drm/amd/amdgpu: Fix debugfs error handling
Message-Id: <20180614144509.gxue54xlvu576obz@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Andrey Grodzovsky <andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The error handling is wrong and "ent" could be NULL we when dereference
it to get "ent->d_inode".

The thing is that normally debugfs_create_file() is not supposed to
require (or have) any error handling.  That function does return error
pointers if debugfs is turned off but we know it's enable here.  When
it's enabled, then it returns NULL on error.

So what I did was I stripped out all the error handling except around
the i_size_write().  I could have just used a NULL check instead of an
IS_ERR_OR_NULL() but I figured this was more clear because that way you
don't have to look at the surrounding code to see whether debugfs is
enabled or not.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f5fb93795a69..dd9a4fb9ce39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -826,21 +826,13 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 {
 	struct drm_minor *minor = adev->ddev->primary;
 	struct dentry *ent, *root = minor->debugfs_root;
-	unsigned i, j;
+	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(debugfs_regs); i++) {
 		ent = debugfs_create_file(debugfs_regs_names[i],
 					  S_IFREG | S_IRUGO, root,
 					  adev, debugfs_regs[i]);
-		if (IS_ERR(ent)) {
-			for (j = 0; j < i; j++) {
-				debugfs_remove(adev->debugfs_regs[i]);
-				adev->debugfs_regs[i] = NULL;
-			}
-			return PTR_ERR(ent);
-		}
-
-		if (!i)
+		if (!i && !IS_ERR_OR_NULL(ent))
 			i_size_write(ent->d_inode, adev->rmmio_size);
 		adev->debugfs_regs[i] = ent;
 	}

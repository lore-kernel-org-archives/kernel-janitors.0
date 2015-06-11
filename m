From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 08:51:50 +0000
Subject: [patch] drm/amdgpu: checking for IS_ERR() instead of NULL
Message-Id: <20150611085150.GB27090@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "monk.liu" <monk.liu@amd.com>

Debugfs_ functions return an error pointer if debugfs is disabled in the
config and NULL on failure.  They are designed so that normally you
don't need to check for errors but here we dereference "ent" so we do
need.

This function has an #if defined(CONFIG_DEBUG_FS) so we know the
debugfs_create_file() can only return NULL and not an error pointer.

Fixes: d38ceaf99ed0 ('drm/amdgpu: add core driver (v4)')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d3706a4..06cb508 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1176,15 +1176,15 @@ static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 
 	ent = debugfs_create_file("amdgpu_vram", S_IFREG | S_IRUGO, root,
 				  adev, &amdgpu_ttm_vram_fops);
-	if (IS_ERR(ent))
-		return PTR_ERR(ent);
+	if (!ent)
+		return -ENOMEM;
 	i_size_write(ent->d_inode, adev->mc.mc_vram_size);
 	adev->mman.vram = ent;
 
 	ent = debugfs_create_file("amdgpu_gtt", S_IFREG | S_IRUGO, root,
 				  adev, &amdgpu_ttm_gtt_fops);
-	if (IS_ERR(ent))
-		return PTR_ERR(ent);
+	if (!ent)
+		return -ENOMEM;
 	i_size_write(ent->d_inode, adev->mc.gtt_size);
 	adev->mman.gtt = ent;
 

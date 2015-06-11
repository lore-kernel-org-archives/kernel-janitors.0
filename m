From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 08:49:33 +0000
Subject: [patch] drm/amdgpu: potential NULL dereference on error
Message-Id: <20150611084933.GA27393@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, yanyang1 <young.yang@amd.com>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

debugfs_create_file() can return an error pointer if debugfs is disabled
or it can return NULL on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 36be03c..adba2a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1980,6 +1980,8 @@ static int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 				  adev, &amdgpu_debugfs_regs_fops);
 	if (IS_ERR(ent))
 		return PTR_ERR(ent);
+	if (!ent)
+		return -ENOMEM;
 	i_size_write(ent->d_inode, adev->rmmio_size);
 	adev->debugfs_regs = ent;
 

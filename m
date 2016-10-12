From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:17:30 +0000
Subject: [patch] drm/amdgpu: potential NULL dereference in debugfs code
Message-Id: <20161012061730.GP12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Junwei Zhang <Jerry.Zhang@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

debugfs_create_file() returns NULL on error, it only returns error
pointers if debugfs isn't enabled in the config and we checked for that
earlier so it can't happen.

Fixes: 4f4824b55650 ('drm/amd/amdgpu: Convert ring debugfs entries to binary')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 85aeb0a..8d16eaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -371,8 +371,8 @@ static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 	ent = debugfs_create_file(name,
 				  S_IFREG | S_IRUGO, root,
 				  ring, &amdgpu_debugfs_ring_fops);
-	if (IS_ERR(ent))
-		return PTR_ERR(ent);
+	if (!ent)
+		return -ENOMEM;
 
 	i_size_write(ent->d_inode, ring->ring_size + 12);
 	ring->ent = ent;

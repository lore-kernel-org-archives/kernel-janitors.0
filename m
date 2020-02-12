From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Feb 2020 12:07:59 +0000
Subject: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
Message-Id: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Jonathan Kim <Jonathan.Kim@amd.com>, Philip Yang <Philip.Yang@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return a negative error code to the user.

Fixes: 030d5b97a54b ("drm/amdgpu: use amdgpu_device_vram_access in amdgpu_ttm_vram_read")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 15f5451d312d..660867cf2597 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2280,7 +2280,6 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
 {
 	struct amdgpu_device *adev = file_inode(f)->i_private;
 	ssize_t result = 0;
-	int r;
 
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
@@ -2294,9 +2293,8 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
 		uint32_t value[AMDGPU_TTM_VRAM_MAX_DW_READ];
 
 		amdgpu_device_vram_access(adev, *pos, value, bytes, false);
-		r = copy_to_user(buf, value, bytes);
-		if (r)
-			return r;
+		if (copy_to_user(buf, value, bytes))
+			return -EFAULT;
 
 		result += bytes;
 		buf += bytes;
-- 
2.11.0

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 16:52:05 +0000
Subject: [PATCH 3/5] drm/amdgpu: Rename a jump label in amdgpu_debugfs_regs_read()
Message-Id: <5e203d55-11da-96f2-1170-3e4a4f346e2c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
In-Reply-To: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 17:35:24 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96a2457..2b8ba97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2208,13 +2208,13 @@ static ssize_t amdgpu_debugfs_regs_read(struct file *f, char __user *buf,
 		uint32_t value;
 
 		if (*pos > adev->rmmio_size)
-			goto end;
+			goto check_bank;
 
 		value = RREG32(*pos >> 2);
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
 			result = r;
-			goto end;
+			goto check_bank;
 		}
 
 		result += 4;
@@ -2222,8 +2222,7 @@ static ssize_t amdgpu_debugfs_regs_read(struct file *f, char __user *buf,
 		*pos += 4;
 		size -= 4;
 	}
-
-end:
+ check_bank:
 	if (use_bank) {
 		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
 		mutex_unlock(&adev->grbm_idx_mutex);
-- 
2.10.0


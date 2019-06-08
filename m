From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Jun 2019 09:23:57 +0000
Subject: [PATCH] drm/amdgpu: Fix bounds checking in amdgpu_ras_is_supported()
Message-Id: <20190608092357.GB28890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, xinhui pan <xinhui.pan-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, James Zhu <James.Zhu-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The "block" variable can be set by the user through debugfs, so it can
be quite large which leads to shift wrapping here.  This means we report
a "block" as supported when it's not, and that leads to array overflows
later on.

This bug is not really a security issue in real life, because debugfs is
generally root only.

Fixes: 36ea1bd2d084 ("drm/amdgpu: add debugfs ctrl node")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index c6b34fbd695f..94c652f5265a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -173,6 +173,8 @@ static inline int amdgpu_ras_is_supported(struct amdgpu_device *adev,
 {
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
+	if (block >= AMDGPU_RAS_BLOCK_COUNT)
+		return 0;
 	return ras && (ras->supported & (1 << block));
 }
 
-- 
2.20.1

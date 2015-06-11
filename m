From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 15:13:04 +0000
Subject: [patch] drm/amdgpu: off by one check in dce_v8_0_hpd_irq()
Message-Id: <20150611151304.GD12192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Chunming Zhou <david1.zhou@amd.com>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, yanyang1 <young.yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

It should be >= instead of > or we go beyond the end of the
interrupt_status_offsets[] array.  Also I changed it to use
ARRAY_SIZE().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 9e8b9f1..0f70dc9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3397,7 +3397,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
 	uint32_t disp_int, mask, int_control, tmp;
 	unsigned hpd;
 
-	if (entry->src_data > 6) {
+	if (entry->src_data >= ARRAY_SIZE(interrupt_status_offsets)) {
 		DRM_DEBUG("Unhandled interrupt: %d %d\n", entry->src_id, entry->src_data);
 		return 0;
 	}

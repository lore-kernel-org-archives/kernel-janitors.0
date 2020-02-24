From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 10:31:20 +0000
Subject: [PATCH] drm/amdgpu/display: clean up some indenting
Message-Id: <20200224103120.zrvgqaokmoehs5y7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Mario Kleiner <mario.kleiner.de@gmail.com>, Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

These lines were accidentally indented 4 spaces more than they should
be.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4cb3eb7c6745..408405d9f30c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2138,10 +2138,10 @@ static void handle_hpd_rx_irq(void *param)
 		}
 	}
 #ifdef CONFIG_DRM_AMD_DC_HDCP
-	    if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
-		    if (adev->dm.hdcp_workqueue)
-			    hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
-	    }
+	if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
+		if (adev->dm.hdcp_workqueue)
+			hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
+	}
 #endif
 	if ((dc_link->cur_link_settings.lane_count != LANE_COUNT_UNKNOWN) ||
 	    (dc_link->type = dc_connection_mst_branch))
-- 
2.11.0

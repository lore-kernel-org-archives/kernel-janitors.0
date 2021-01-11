From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 11 Jan 2021 08:46:40 +0000
Subject: [PATCH -next] drm/amd/display: tweak the kerneldoc for active_vblank_irq_count
Message-Id: <20210111084640.28500-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Nick Kazlauskas <Nicholas.Kazlauskas@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org

Commit 71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux
(MALL stutter)") adds active_vblank_irq_count to amdgpu_display_manager
in ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h.

The kerneldoc is incorrectly formatted, and make htmldocs warns:

  ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:
    340: warning: Incorrect use of kernel-doc format:          * @active_vblank_irq_count
    379: warning: Function parameter or member 'active_vblank_irq_count' not described in 'amdgpu_display_manager'

Tweak the kerneldoc for active_vblank_irq_count.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on amdgpu's -next and next-20210111

Bhawanpreet, Nick, please review and ack.

Alex, Christian, please pick on top of the commit above.

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index f084e2fc9569..5ee1b766884e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -337,7 +337,7 @@ struct amdgpu_display_manager {
 	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
 
 	/**
-	 * @active_vblank_irq_count
+	 * @active_vblank_irq_count:
 	 *
 	 * number of currently active vblank irqs
 	 */
-- 
2.17.1

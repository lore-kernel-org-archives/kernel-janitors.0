From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 05 Oct 2019 11:32:05 +0000
Subject: [PATCH] drm/amd/display: Fix typo in some comments
Message-Id: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

p and g are switched in 'amdpgu_dm'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 92932d521d7f..b9c2e1a930ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1043,7 +1043,7 @@ static void s3_handle_mst(struct drm_device *dev, bool suspend)
 
 /**
  * dm_hw_init() - Initialize DC device
- * @handle: The base driver device containing the amdpgu_dm device.
+ * @handle: The base driver device containing the amdgpu_dm device.
  *
  * Initialize the &struct amdgpu_display_manager device. This involves calling
  * the initializers of each DM component, then populating the struct with them.
@@ -1073,7 +1073,7 @@ static int dm_hw_init(void *handle)
 
 /**
  * dm_hw_fini() - Teardown DC device
- * @handle: The base driver device containing the amdpgu_dm device.
+ * @handle: The base driver device containing the amdgpu_dm device.
  *
  * Teardown components within &struct amdgpu_display_manager that require
  * cleanup. This involves cleaning up the DRM device, DC, and any modules that
-- 
2.20.1

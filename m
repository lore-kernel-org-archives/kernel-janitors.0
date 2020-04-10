From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 22:57:57 +0000
Subject: [PATCH] drm/amdgpu: ensure device_list is initialised before calling list_add_tail
Message-Id: <20200410225757.97473-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, John Clements <john.clements@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to list_add_tail will access an the uninitalised
device_list.prev. Fix this by ensuring device_list is initialized before
adding items to it.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: b3dbd6d3ec49 ("drm/amdgpu: resolve mGPU RAS query instability")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index b0aa4e1ed4df..caa4969bd46f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1447,6 +1447,7 @@ static void amdgpu_ras_do_recovery(struct work_struct *work)
 	if  (hive && adev->gmc.xgmi.num_physical_nodes > 1) {
 		device_list_handle = &hive->device_list;
 	} else {
+		INIT_LIST_HEAD(&device_list);
 		list_add_tail(&adev->gmc.xgmi.head, &device_list);
 		device_list_handle = &device_list;
 	}
-- 
2.25.1

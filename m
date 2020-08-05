From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 12:15:27 +0000
Subject: [PATCH][next] drm/amdgpu: fix spelling mistake "paramter" -> "parameter"
Message-Id: <20200805121527.19157-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180322154144.31363-1-colin.king@canonical.com>
In-Reply-To: <20180322154144.31363-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b72aeeb0a226..16e23f053361 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1201,7 +1201,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
 
 	if (amdgpu_num_kcq > 8 || amdgpu_num_kcq < 0) {
 		amdgpu_num_kcq = 8;
-		dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid paramter provided by user\n");
+		dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid parameter provided by user\n");
 	}
 
 	return 0;
-- 
2.27.0

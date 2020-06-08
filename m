From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 14:18:23 +0000
Subject: [PATCH] drm/amd/powerplay: Fix buffer overflow in arcturus_get_unique_id()
Message-Id: <20200608141823.GD1912173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evan Quan <evan.quan@amd.com>, Kent Russell <kent.russell@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The comments say that the "sn" buffer is used to hold a 16-digit HEX
string so the buffer needs to be at least 17 characters to hold the
NUL terminator.

Fixes: 81a16241114b ("drm/amdgpu: Add unique_id and serial_number for Arcturus v3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index df7b408319f76..a575cb9d1574c 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2266,7 +2266,7 @@ static void arcturus_get_unique_id(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t top32, bottom32, smu_version, size;
-	char sn[16];
+	char sn[20];
 	uint64_t id;
 
 	if (smu_get_smc_version(smu, NULL, &smu_version)) {
-- 
2.26.2

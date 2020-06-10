From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 08:56:53 +0000
Subject: [PATCH v2] drm/amdgpu: Fix a buffer overflow handling the serial number
Message-Id: <20200610085653.GA5439@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <DM6PR12MB26194168100E5F96FF94D066E4820@DM6PR12MB2619.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Xiao <Jack.Xiao@amd.com>, Jonathan Kim <jonathan.kim@amd.com>, Joseph Greathouse <Joseph.Greathouse@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, Tao Zhou <tao.zhou1@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

The comments say that the serial number is a 16-digit HEX string so the
buffer needs to be at least 17 characters to hold the NUL terminator.

The other issue is that "size" returned from sprintf() is the number of
characters before the NUL terminator so the memcpy() wasn't copying the
terminator.  The serial number needs to be NUL terminated so that it
doesn't lead to a read overflow in amdgpu_device_get_serial_number().
Also it's just cleaner and faster to sprintf() directly to adev->serial[]
instead of using a temporary buffer.

Fixes: 81a16241114b ("drm/amdgpu: Add unique_id and serial_number for Arcturus v3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Change adev->serial.  The original patch would have just moved the
overflow until amdgpu_device_get_serial_number() is called.

 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 2 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 135530286f34f..905cf0bac100c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -986,7 +986,7 @@ struct amdgpu_device {
 	/* Chip product information */
 	char				product_number[16];
 	char				product_name[32];
-	char				serial[16];
+	char				serial[20];
 
 	struct amdgpu_autodump		autodump;
 
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index df7b408319f76..d58146a5fa21d 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2265,8 +2265,7 @@ static void arcturus_i2c_eeprom_control_fini(struct i2c_adapter *control)
 static void arcturus_get_unique_id(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	uint32_t top32, bottom32, smu_version, size;
-	char sn[16];
+	uint32_t top32, bottom32, smu_version;
 	uint64_t id;
 
 	if (smu_get_smc_version(smu, NULL, &smu_version)) {
@@ -2289,8 +2288,7 @@ static void arcturus_get_unique_id(struct smu_context *smu)
 	/* For Arcturus-and-later, unique_id = serial_number, so convert it to a
 	 * 16-digit HEX string for convenience and backwards-compatibility
 	 */
-	size = sprintf(sn, "%llx", id);
-	memcpy(adev->serial, &sn, size);
+	sprintf(adev->serial, "%llx", id);
 }
 
 static bool arcturus_is_baco_supported(struct smu_context *smu)
-- 
2.26.2

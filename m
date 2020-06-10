From: "Quan, Evan" <Evan.Quan@amd.com>
Date: Wed, 10 Jun 2020 10:57:29 +0000
Subject: RE: [PATCH v2] drm/amdgpu: Fix a buffer overflow handling the serial number
Message-Id: <DM6PR12MB2619D7FBF176EEA50DB3E2AAE4830@DM6PR12MB2619.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <DM6PR12MB26194168100E5F96FF94D066E4820@DM6PR12MB2619.namprd12.prod.outlook.com>
 <20200610085653.GA5439@mwanda>
In-Reply-To: <20200610085653.GA5439@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>, "Greathouse, 
 Joseph" <Joseph.Greathouse@amd.com>, David Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ma,
 Le" <Le.Ma@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: Wednesday, June 10, 2020 4:57 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>; Kim, Jonathan <Jonathan.Kim@amd.com>; Greathouse, Joseph <Joseph.Greathouse@amd.com>; amd-gfx@lists.freedesktop.org; kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: Fix a buffer overflow handling the serial number

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
 charproduct_number[16];
 charproduct_name[32];
-charserial[16];
+charserial[20];

 struct amdgpu_autodumpautodump;

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index df7b408319f76..d58146a5fa21d 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2265,8 +2265,7 @@ static void arcturus_i2c_eeprom_control_fini(struct i2c_adapter *control)
 static void arcturus_get_unique_id(struct smu_context *smu)
 {
 struct amdgpu_device *adev = smu->adev;
-uint32_t top32, bottom32, smu_version, size;
-char sn[16];
+uint32_t top32, bottom32, smu_version;
 uint64_t id;

 if (smu_get_smc_version(smu, NULL, &smu_version)) {
@@ -2289,8 +2288,7 @@ static void arcturus_get_unique_id(struct smu_context *smu)
 /* For Arcturus-and-later, unique_id == serial_number, so convert it to a
  * 16-digit HEX string for convenience and backwards-compatibility
  */
-size = sprintf(sn, "%llx", id);
-memcpy(adev->serial, &sn, size);
+sprintf(adev->serial, "%llx", id);
 }

 static bool arcturus_is_baco_supported(struct smu_context *smu)
--
2.26.2

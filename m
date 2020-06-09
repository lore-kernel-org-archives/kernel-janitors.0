From: "Quan, Evan" <Evan.Quan@amd.com>
Date: Tue, 09 Jun 2020 03:56:42 +0000
Subject: RE: [PATCH] drm/amd/powerplay: Fix buffer overflow in arcturus_get_unique_id()
Message-Id: <DM6PR12MB26194168100E5F96FF94D066E4820@DM6PR12MB2619.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200608141823.GD1912173@mwanda>
In-Reply-To: <20200608141823.GD1912173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Russell, Kent" <Kent.Russell@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>

[AMD Official Use Only - Internal Distribution Only]

adev->serial which is used to hold the final serial number may need to be enlarged also.
Since it comes with 16 bytes also.

BR,
Evan
-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: Monday, June 8, 2020 10:18 PM
To: Quan, Evan <Evan.Quan@amd.com>; Russell, Kent <Kent.Russell@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org; kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: Fix buffer overflow in arcturus_get_unique_id()

The comments say that the "sn" buffer is used to hold a 16-digit HEX string so the buffer needs to be at least 17 characters to hold the NUL terminator.

Fixes: 81a16241114b ("drm/amdgpu: Add unique_id and serial_number for Arcturus v3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index df7b408319f76..a575cb9d1574c 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2266,7 +2266,7 @@ static void arcturus_get_unique_id(struct smu_context *smu)  {
 struct amdgpu_device *adev = smu->adev;
 uint32_t top32, bottom32, smu_version, size;
-char sn[16];
+char sn[20];
 uint64_t id;

 if (smu_get_smc_version(smu, NULL, &smu_version)) {
--
2.26.2

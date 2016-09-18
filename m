From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 16:51:12 +0000
Subject: [PATCH 2/5] drm/amdgpu: Improve determination of sizes in two functions
Message-Id: <7ed4253b-6945-ddc4-aa06-56f2efa35cf1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
In-Reply-To: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 17:24:47 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2709ebd..96a2457 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -855,7 +855,7 @@ static void amdgpu_atombios_fini(struct amdgpu_device *adev)
 static int amdgpu_atombios_init(struct amdgpu_device *adev)
 {
 	struct card_info *atom_card_info -	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
+	    kzalloc(sizeof(*atom_card_info), GFP_KERNEL);
 
 	if (!atom_card_info)
 		return -ENOMEM;
@@ -1224,7 +1224,8 @@ static int amdgpu_early_init(struct amdgpu_device *adev)
 	}
 
 	adev->ip_block_status = kcalloc(adev->num_ip_blocks,
-					sizeof(struct amdgpu_ip_block_status), GFP_KERNEL);
+					sizeof(*adev->ip_block_status),
+					GFP_KERNEL);
 	if (adev->ip_block_status = NULL)
 		return -ENOMEM;
 
-- 
2.10.0


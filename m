From: Colin King <colin.king@canonical.com>
Date: Sun, 07 Feb 2021 23:07:51 +0000
Subject: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a int
Message-Id: <20210207230751.8576-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of int 32 bit integer constant 1 is evaluated using 32
bit arithmetic and then assigned to an unsigned 64 bit integer. In the
case where *frag is 32 or more this can lead to an oveflow.  Avoid this
by shifting 1ULL.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge page handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9d19078246c8..53a925600510 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
 		*frag = max_frag;
 		*frag_end = end & ~((1ULL << max_frag) - 1);
 	} else {
-		*frag_end = start + (1 << *frag);
+		*frag_end = start + (1ULL << *frag);
 	}
 }
 
-- 
2.29.2

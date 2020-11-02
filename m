From: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>
Date: Mon, 02 Nov 2020 19:04:29 +0000
Subject: RE: [PATCH][next] drm/amdgpu: fix spelling mistake: "Successed" -> "Succeeded"
Message-Id: <BL0PR12MB24336D1D2C03A015AAF5E5CA9C100@BL0PR12MB2433.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201102141654.699468-1-colin.king@canonical.com>
In-Reply-To: <20201102141654.699468-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

[AMD Public Use]

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Colin King
Sent: Monday, November 2, 2020 7:47 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Dave Airlie <airlied@redhat.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: fix spelling mistake: "Successed" -> "Succeeded"

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a deb_dbg message. Fix it.

Spell mistake in "deb_dbg" of commit message. With that fix (to dev_dbg):
Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>

Regards,
Madhav

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 28a5c0d21b71..c99c2180785f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -296,7 +296,7 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 		if (drm_mm_reserve_node(mm, &rsv->mm_node))
 			continue;
 
-		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Successed\n",
+		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
 			rsv->mm_node.start, rsv->mm_node.size);
 
 		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cmadhav.chauhan%40amd.com%7C563b9e348bf946c1894c08d87f3a6739%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637399236116555988%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2BiITYub2Q5HKNJXDwLRkrv%2FSpVmWt59oNVW2CmCgf3M%3D&amp;reserved=0

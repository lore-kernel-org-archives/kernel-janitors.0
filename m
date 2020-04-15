From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 08:34:20 +0000
Subject: [PATCH][next] drm/rockchip: fix spelling mistake "modifer" -> "modifier"
Message-Id: <20200415083420.366279-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_DEBUG_KMS debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index b87d22eb6ae1..33463b79a37b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -769,7 +769,7 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
 		return true;
 
 	if (!rockchip_afbc(modifier)) {
-		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
+		DRM_DEBUG_KMS("Unsupported format modifier 0x%llx\n", modifier);
 
 		return false;
 	}
-- 
2.25.1

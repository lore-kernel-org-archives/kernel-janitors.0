From: Colin King <colin.king@canonical.com>
Date: Sat, 13 May 2017 22:41:50 +0000
Subject: [PATCH] drm/sti:fix spelling mistake: "compoment" -> "component"
Message-Id: <20170513224150.19955-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_ERROR message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/sti/sti_compositor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 11d4e885893a..6e4bf68262db 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -129,7 +129,7 @@ static int sti_compositor_bind(struct device *dev,
 			}
 			break;
 		default:
-			DRM_ERROR("Unknown subdev compoment type\n");
+			DRM_ERROR("Unknown subdev component type\n");
 			return 1;
 		}
 
-- 
2.11.0


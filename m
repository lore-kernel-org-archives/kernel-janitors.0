From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 10:10:48 +0000
Subject: [PATCH] gpu: drm: sti: fix spelling mistake: "initialze" -> "initialize"
Message-Id: <20180502101048.8442-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_ERROR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/sti/sti_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 21e50d7b1f86..5824e6aca8f4 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -357,7 +357,7 @@ int sti_crtc_init(struct drm_device *drm_dev, struct sti_mixer *mixer,
 	res = drm_crtc_init_with_planes(drm_dev, crtc, primary, cursor,
 					&sti_crtc_funcs, NULL);
 	if (res) {
-		DRM_ERROR("Can't initialze CRTC\n");
+		DRM_ERROR("Can't initialize CRTC\n");
 		return -EINVAL;
 	}
 
-- 
2.17.0


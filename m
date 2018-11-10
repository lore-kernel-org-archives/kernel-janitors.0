From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 10 Nov 2018 02:57:40 +0000
Subject: [PATCH -next] drm/sti: remove set but not used variable 'priv'
Message-Id: <1541818660-37168-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/sti/sti_crtc.c: In function 'sti_crtc_vblank_cb':
drivers/gpu/drm/sti/sti_crtc.c:255:22: warning:
 variable 'priv' set but not used [-Wunused-but-set-variable]

It never used since introduction in
  9e1f05b28009 ("drm/sti: rename files and functions")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/sti/sti_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 61c2379..ed76e52e 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -252,10 +252,8 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 	struct sti_compositor *compo;
 	struct drm_crtc *crtc = data;
 	struct sti_mixer *mixer;
-	struct sti_private *priv;
 	unsigned int pipe;
 
-	priv = crtc->dev->dev_private;
 	pipe = drm_crtc_index(crtc);
 	compo = container_of(nb, struct sti_compositor, vtg_vblank_nb[pipe]);
 	mixer = compo->mixer[pipe];

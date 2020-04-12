From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 14:35:09 +0000
Subject: [PATCH] drm/msm: Fix typo
Message-Id: <20200412143509.11353-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, freedreno@lists.freedesktop.org

Duplicated 'we'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 998bef1190a3..b5fed67c4651 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -959,7 +959,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
 	if (!ctl)
 		return -EINVAL;
 
-	/* don't support LM cursors when we we have source split enabled */
+	/* don't support LM cursors when we have source split enabled */
 	if (mdp5_cstate->pipeline.r_mixer)
 		return -EINVAL;
 
@@ -1030,7 +1030,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 		return -EINVAL;
 	}
 
-	/* don't support LM cursors when we we have source split enabled */
+	/* don't support LM cursors when we have source split enabled */
 	if (mdp5_cstate->pipeline.r_mixer)
 		return -EINVAL;
 
-- 
2.20.1

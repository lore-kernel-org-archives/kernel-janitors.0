From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Mar 2017 17:56:01 +0000
Subject: [PATCH] drm/gma500: fix memory leak on edid
Message-Id: <20170320175601.23149-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

edid is allocated on the call to psb_intel_sdvo_get_edid but not
kfree'd at all, causing a memory leak.  Fix this by kfree'ing
the edid.  (This may be null, but kfree can handle null frees).

Detected by CoverityScan, CID#1090730 ("Resource Leak")

Fixes: 5736995b473b ("gma500: Replace SDVO code with slightly modified version from i915")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index e787d376ba67..f38e6ad1ab9b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1650,6 +1650,7 @@ static bool psb_intel_sdvo_detect_hdmi_audio(struct drm_connector *connector)
 	edid = psb_intel_sdvo_get_edid(connector);
 	if (edid != NULL && edid->input & DRM_EDID_INPUT_DIGITAL)
 		has_audio = drm_detect_monitor_audio(edid);
+	kfree(edid);
 
 	return has_audio;
 }
-- 
2.11.0


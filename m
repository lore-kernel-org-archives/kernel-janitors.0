From: Jani Nikula <jani.nikula@intel.com>
Date: Fri, 24 Aug 2012 06:42:44 +0000
Subject: [PATCH] gma500: remove references to drm_display_info raw_edid field
Message-Id: <1345790564-21095-1-git-send-email-jani.nikula@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120824001212.GC25618@localhost>
In-Reply-To: <20120824001212.GC25618@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fengguang.wu@intel.com, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, airlied@redhat.com, kernel-janitors@vger.kernel.org, alan@linux.intel.com

Another reference to raw_edid field of struct drm_display_info was added in
gma500 while the whole field was being removed, causing build
failure. Remove the hopefully last references to raw_edid.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 9bacce3..c9abc06 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1554,7 +1554,6 @@ cdv_intel_dp_detect(struct drm_connector *connector, bool force)
 		edid = drm_get_edid(connector, &intel_dp->adapter);
 		if (edid) {
 			intel_dp->has_audio = drm_detect_monitor_audio(edid);
-			connector->display_info.raw_edid = NULL;
 			kfree(edid);
 		}
 	}
@@ -1634,8 +1633,6 @@ cdv_intel_dp_detect_audio(struct drm_connector *connector)
 	edid = drm_get_edid(connector, &intel_dp->adapter);
 	if (edid) {
 		has_audio = drm_detect_monitor_audio(edid);
-
-		connector->display_info.raw_edid = NULL;
 		kfree(edid);
 	}
 	if (edp)
-- 
1.7.9.5


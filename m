From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:23:55 +0000
Subject: [PATCH] Staging: gma500: remove unneeded check in
Message-Id: <20110708072355.GU18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The list cursor is never NULL in a list_for_each_entry() loop.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/gma500/mdfld_intel_display.c b/drivers/staging/gma500/mdfld_intel_display.c
index 1447a5b..fa84990 100644
--- a/drivers/staging/gma500/mdfld_intel_display.c
+++ b/drivers/staging/gma500/mdfld_intel_display.c
@@ -1093,8 +1093,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 	memcpy(&psb_intel_crtc->saved_adjusted_mode, adjusted_mode, sizeof(struct drm_display_mode));
 
 	list_for_each_entry(connector, &mode_config->connector_list, head) {
-		if(!connector)
-			continue;
 			
 		encoder = connector->encoder;
 		

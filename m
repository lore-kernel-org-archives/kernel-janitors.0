From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 12:41:01 +0000
Subject: [PATCH] drm/gma500: remove an unneeded NULL check
Message-Id: <20170628124100.3pw2gyitsfopaib5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

"connector" is the list iterator and it can't be NULL.  It causes a
static checker warning because we dereference the iterator to get the
next item in the list.  Let's remove this check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
index 63c6e08600ae..531e4450c000 100644
--- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
+++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
@@ -737,11 +737,7 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 					sizeof(struct drm_display_mode));
 
 	list_for_each_entry(connector, &mode_config->connector_list, head) {
-		if (!connector)
-			continue;
-
 		encoder = connector->encoder;
-
 		if (!encoder)
 			continue;
 

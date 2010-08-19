From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 09:46:29 +0000
Subject: [patch] drm: move dereference below check
Message-Id: <20100819094629.GL645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, dri-devel@lists.freedesktop.org

"fb_helper_conn" is dereferenced before the check for NULL.  It's never
actually NULL here, so this is mostly to keep the static checkers happy.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index de82e20..8dd7e6f 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -94,10 +94,11 @@ static bool drm_fb_helper_connector_parse_command_line(struct drm_fb_helper_conn
 	int i;
 	enum drm_connector_force force = DRM_FORCE_UNSPECIFIED;
 	struct drm_fb_helper_cmdline_mode *cmdline_mode;
-	struct drm_connector *connector = fb_helper_conn->connector;
+	struct drm_connector *connector;
 
 	if (!fb_helper_conn)
 		return false;
+	connector = fb_helper_conn->connector;
 
 	cmdline_mode = &fb_helper_conn->cmdline_mode;
 	if (!mode_option)

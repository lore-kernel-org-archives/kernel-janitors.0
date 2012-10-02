From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:26:46 +0000
Subject: [patch] drm/ast: drop duplicate initialization
Message-Id: <20121002082646.GD12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Jani Nikula <jani.nikula@intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

We set ".disable" to "ast_crtc_disable" twice.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f3b2a7c..e87f1ff 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -582,7 +582,6 @@ static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.mode_set_base = ast_crtc_mode_set_base,
 	.disable = ast_crtc_disable,
 	.load_lut = ast_crtc_load_lut,
-	.disable = ast_crtc_disable,
 	.prepare = ast_crtc_prepare,
 	.commit = ast_crtc_commit,
 

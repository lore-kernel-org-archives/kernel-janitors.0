From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Dec 2017 13:07:49 +0000
Subject: [PATCH] drm/fb-helper: Fix a potential NULL dereference
Message-Id: <20171206130749.64efknoi6r7w3jqa@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently modified drm_fb_helper_single_add_all_connectors() to allow
NULL "fb_helper" pointers.  But  the problem is that it gets
dereferenced before we checked for NULL.

Fixes: c777990fb45b ("drm/fb-helper: Handle function NULL argument")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 6654f2f87775..f73457e5bbbc 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -178,7 +178,6 @@ EXPORT_SYMBOL(drm_fb_helper_add_one_connector);
  */
 int drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
 {
-	struct drm_device *dev = fb_helper->dev;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	int i, ret = 0;
@@ -187,7 +186,7 @@ int drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
 		return 0;
 
 	mutex_lock(&fb_helper->lock);
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		ret = __drm_fb_helper_add_one_connector(fb_helper, connector);
 		if (ret)

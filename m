From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Sep 2017 10:30:38 +0000
Subject: [PATCH] drm: of: always initialize panel in drm_of_find_panel_or_bridge()
Message-Id: <20170925103038.lvr5msjvekwczctn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The callers expect "panel" to be initialized, but that isn't true if we
return -ENODEV.  It causes bugs like:

    drivers/gpu/drm/tve200/tve200_drv.c:83 tve200_modeset_init()
    error: uninitialized symbol 'panel'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 8dafbdfcd2ea..4c191c050e7d 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -233,6 +233,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 
 	if (!panel && !bridge)
 		return -EINVAL;
+	if (panel)
+		*panel = NULL;
 
 	remote = of_graph_get_remote_node(np, port, endpoint);
 	if (!remote)

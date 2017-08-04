From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 04 Aug 2017 06:09:53 +0000
Subject: [PATCH] drm/omap: omap_display_timings: constify videomode structures
Message-Id: <1501826993-1765-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

The videomode structures are only copied into the vm field of a
panel_drv_data structure, so they can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c |    2 +-
 drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c b/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
index c90474a..74d1396 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
@@ -19,7 +19,7 @@
 
 #include "../dss/omapdss.h"
 
-static struct videomode lb035q02_vm = {
+static const struct videomode lb035q02_vm = {
 	.hactive = 320,
 	.vactive = 240,
 
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
index cbf4c67..0a38a0e 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
@@ -40,7 +40,7 @@ struct panel_drv_data {
 	struct spi_device *spi_dev;
 };
 
-static struct videomode td028ttec1_panel_vm = {
+static const struct videomode td028ttec1_panel_vm = {
 	.hactive	= 480,
 	.vactive	= 640,
 	.pixelclock	= 22153000,


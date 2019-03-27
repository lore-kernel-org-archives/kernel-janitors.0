From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Mar 2019 03:19:04 +0000
Subject: [PATCH -next] drm/omap: Add NULL entry to the end of_device_id array
Message-Id: <20190327031904.63046-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Make sure of_device_id tables are NULL terminated
Found by coccinelle spatch "misc/of_table.cocci"

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index 2b41c75ce988..e02aa8e70968 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -198,6 +198,7 @@ static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
 	{ .compatible = "toppoly,td028ttec1" },
 	{ .compatible = "tpo,td028ttec1" },
 	{ .compatible = "tpo,td043mtea1" },
+	{},
 };
 
 static int __init omapdss_boot_init(void)

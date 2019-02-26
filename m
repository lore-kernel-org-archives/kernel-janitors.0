From: Colin King <colin.king@canonical.com>
Date: Tue, 26 Feb 2019 16:59:32 +0000
Subject: [PATCH] drm/bridge: ti-sn65dsi86: make const array static
Message-Id: <20190226165932.17528-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array ti_sn_bridge_supply_names on the
stack but instead make it static.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f72ee137e5f1..4c2ca4e39be5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -211,7 +211,7 @@ static struct ti_sn_bridge *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
 static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
 {
 	unsigned int i;
-	const char * const ti_sn_bridge_supply_names[] = {
+	static const char * const ti_sn_bridge_supply_names[] = {
 		"vcca", "vcc", "vccio", "vpll",
 	};
 
-- 
2.20.1

From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Nov 2017 11:10:47 +0000
Subject: [PATCH] phy: tegra: remove redundant self assignment of 'map'
Message-Id: <20171123111047.19383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of map to itself is redundant and can be removed.
Detected with Coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 4307bf0013e1..bfec91e36be7 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -418,7 +418,7 @@ tegra_xusb_port_find_lane(struct tegra_xusb_port *port,
 {
 	struct tegra_xusb_lane *lane, *match = ERR_PTR(-ENODEV);
 
-	for (map = map; map->type; map++) {
+	for (; map->type; map++) {
 		if (port->index != map->port)
 			continue;
 
-- 
2.14.1


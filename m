From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Jun 2017 18:08:04 +0000
Subject: [PATCH][netdev-next] mdio: mux: fix an incorrect less than zero error check using a u32
Message-Id: <20170605180804.13765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The u32 variable v is being checked to see if an error return is
less than zero and this check has no effect because it is unsigned.
Fix this by making v and int (this also matches the type of
cb->bus_number which is assigned to the value in v).

Detected by CoverityScan, CID#1440454 ("Unsigned compared against zero")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/mdio-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/mdio-mux.c b/drivers/net/phy/mdio-mux.c
index 47ded3904050..00755b6a42cf 100644
--- a/drivers/net/phy/mdio-mux.c
+++ b/drivers/net/phy/mdio-mux.c
@@ -133,7 +133,7 @@ int mdio_mux_init(struct device *dev,
 
 	ret_val = -ENODEV;
 	for_each_available_child_of_node(dev->of_node, child_bus_node) {
-		u32 v;
+		int v;
 
 		v = of_mdio_parse_addr(dev, child_bus_node);
 		if (v < 0) {
-- 
2.11.0


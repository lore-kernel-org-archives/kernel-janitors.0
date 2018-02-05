From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Feb 2018 12:47:59 +0000
Subject: [PATCH] net: phy-micrel: remove redundant initialization of pointer of_node
Message-Id: <20180205124759.19046-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer of_node is initialized with a value that is never read, of_node
is later updated with a new value instead, hence the initialization is
redundant and can be removed.  Also remove unused pointer dev and
remove an empty line.

Cleans up clang warnings:
drivers/net/phy/micrel.c:393:28: warning: Value stored to 'of_node'
during its initialization is never read
drivers/net/phy/micrel.c:532:28: warning: Value stored to 'of_node'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/micrel.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 0f45310300f6..a86ecccde924 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -389,8 +389,7 @@ static int ksz9021_load_values_from_of(struct phy_device *phydev,
 
 static int ksz9021_config_init(struct phy_device *phydev)
 {
-	const struct device *dev = &phydev->mdio.dev;
-	const struct device_node *of_node = dev->of_node;
+	const struct device_node *of_node;
 	const struct device *dev_walker;
 
 	/* The Micrel driver has a deprecated option to place phy OF
@@ -401,7 +400,6 @@ static int ksz9021_config_init(struct phy_device *phydev)
 	do {
 		of_node = dev_walker->of_node;
 		dev_walker = dev_walker->parent;
-
 	} while (!of_node && dev_walker);
 
 	if (of_node) {
@@ -528,8 +526,7 @@ static int ksz9031_enable_edpd(struct phy_device *phydev)
 
 static int ksz9031_config_init(struct phy_device *phydev)
 {
-	const struct device *dev = &phydev->mdio.dev;
-	const struct device_node *of_node = dev->of_node;
+	const struct device_node *of_node;
 	static const char *clk_skews[2] = {"rxc-skew-ps", "txc-skew-ps"};
 	static const char *rx_data_skews[4] = {
 		"rxd0-skew-ps", "rxd1-skew-ps",
-- 
2.15.1


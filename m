From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Jun 2017 14:13:34 +0000
Subject: [PATCH][V2] net: phy: marvell: make some functions static
Message-Id: <20170602141334.26506-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

functions m88e1510_get_temp_critical, m88e1510_set_temp_critical and
m88e1510_get_temp_alarm can be made static as they not need to be
in global scope.

Cleans up sparse warnings:
 "symbol 'm88e1510_get_temp_alarm' was not declared. Should it be static?"
 "symbol 'm88e1510_get_temp_critical' was not declared. Should it be
  static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/marvell.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 7c2cde45c262..7382b8fc77e2 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1704,7 +1704,7 @@ static int m88e1510_get_temp(struct phy_device *phydev, long *temp)
 	return ret;
 }
 
-int m88e1510_get_temp_critical(struct phy_device *phydev, long *temp)
+static int m88e1510_get_temp_critical(struct phy_device *phydev, long *temp)
 {
 	int oldpage;
 	int ret;
@@ -1735,7 +1735,7 @@ int m88e1510_get_temp_critical(struct phy_device *phydev, long *temp)
 	return ret;
 }
 
-int m88e1510_set_temp_critical(struct phy_device *phydev, long temp)
+static int m88e1510_set_temp_critical(struct phy_device *phydev, long temp)
 {
 	int oldpage;
 	int ret;
@@ -1765,7 +1765,7 @@ int m88e1510_set_temp_critical(struct phy_device *phydev, long temp)
 	return ret;
 }
 
-int m88e1510_get_temp_alarm(struct phy_device *phydev, long *alarm)
+static int m88e1510_get_temp_alarm(struct phy_device *phydev, long *alarm)
 {
 	int oldpage;
 	int ret;
-- 
2.11.0


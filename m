From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Apr 2020 14:10:16 +0000
Subject: [PATCH][next] net: phy: bcm54140: fix less than zero comparison on an unsigned
Message-Id: <20200423141016.19666-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the unsigned variable tmp is being checked for an negative
error return from the call to bcm_phy_read_rdb and this can never
be true since tmp is unsigned.  Fix this by making tmp a plain int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/bcm54140.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/bcm54140.c b/drivers/net/phy/bcm54140.c
index aa854477e06a..7341f0126cc4 100644
--- a/drivers/net/phy/bcm54140.c
+++ b/drivers/net/phy/bcm54140.c
@@ -191,7 +191,8 @@ static int bcm54140_hwmon_read_alarm(struct device *dev, unsigned int bit,
 static int bcm54140_hwmon_read_temp(struct device *dev, u32 attr, long *val)
 {
 	struct phy_device *phydev = dev_get_drvdata(dev);
-	u16 reg, tmp;
+	u16 reg;
+	int tmp;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -224,7 +225,8 @@ static int bcm54140_hwmon_read_in(struct device *dev, u32 attr,
 				  int channel, long *val)
 {
 	struct phy_device *phydev = dev_get_drvdata(dev);
-	u16 bit, reg, tmp;
+	u16 bit, reg;
+	int tmp;
 
 	switch (attr) {
 	case hwmon_in_input:
-- 
2.25.1

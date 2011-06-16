From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 17:04:30 +0000
Subject: [PATCH] net: icplus: remove unnecessary code
Message-Id: <1308243870-30203-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, davem@davemloft.net, peppe.cavallaro@st.com, u.kleine-koenig@pengutronix.de, Greg Dietsche <Gregory.Dietsche@cuw.edu>

Compile tested.
remove unnecessary code that matches this coccinelle pattern
	if (...)
		return ret;
	return ret;

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/net/phy/icplus.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index 9a09e24..d4cbc29 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -109,11 +109,7 @@ static int ip1001_config_init(struct phy_device *phydev)
 	value = phy_read(phydev, 16);
 	value |= 0x3;
 
-	err = phy_write(phydev, 16, value);
-	if (err < 0)
-		return err;
-
-	return err;
+	return phy_write(phydev, 16, value);
 }
 
 static int ip175c_read_status(struct phy_device *phydev)
-- 
1.7.2.5


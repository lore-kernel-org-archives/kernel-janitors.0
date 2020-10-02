From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 16:54:22 +0000
Subject: [PATCH][next] net: phy: dp83869: fix unsigned comparisons against less than zero values
Message-Id: <20201002165422.94328-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Dan Murphy <dmurphy@ti.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the comparisons of u16 integers value and sopass_val with
less than zero for error checking is always false because the values
are unsigned. Fix this by making these variables int.  This does not
affect the shift and mask operations performed on these variables

Addresses-Coverity: ("Unsigned compared against zero")
Fixes: 49fc23018ec6 ("net: phy: dp83869: support Wake on LAN")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/dp83869.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index 0aee5f645b71..cf6dec7b7d8e 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -305,7 +305,7 @@ static int dp83869_set_wol(struct phy_device *phydev,
 static void dp83869_get_wol(struct phy_device *phydev,
 			    struct ethtool_wolinfo *wol)
 {
-	u16 value, sopass_val;
+	int value, sopass_val;
 
 	wol->supported = (WAKE_UCAST | WAKE_BCAST | WAKE_MAGIC |
 			WAKE_MAGICSECURE);
-- 
2.27.0

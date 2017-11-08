From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Nov 2017 13:23:23 +0000
Subject: [PATCH] net: realtek: r8169: remove redundant assignment to giga_ctrl
Message-Id: <20171108132323.26292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable giga_ctrl is being assigned to zero however this is
never read and hence the assignment is redundant, so remove it.
Cleans up clang warning:

drivers/net/ethernet/realtek/r8169.c:1978:3: warning: Value stored
to 'giga_ctrl' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/realtek/r8169.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
index fd218fd9ef3c..dcb8c39382e7 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -1982,8 +1982,6 @@ static int rtl8169_set_speed_xmii(struct net_device *dev,
 		rtl_writephy(tp, MII_ADVERTISE, auto_nego);
 		rtl_writephy(tp, MII_CTRL1000, giga_ctrl);
 	} else {
-		giga_ctrl = 0;
-
 		if (speed = SPEED_10)
 			bmcr = 0;
 		else if (speed = SPEED_100)
-- 
2.14.1


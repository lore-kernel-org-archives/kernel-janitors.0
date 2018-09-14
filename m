From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 16:39:53 +0000
Subject: [PATCH] net: hp100: fix always-true check for link up state
Message-Id: <20180914163953.20734-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The operation ~(p100_inb(VG_LAN_CFG_1) & HP100_LINK_UP) returns a value
that is always non-zero and hence the wait for the link to drop always
terminates prematurely.  Fix this by using a logical not operator instead
of a bitwise complement.  This issue has been in the driver since
pre-2.6.12-rc2.

Detected by CoverityScan, CID#114157 ("Logical vs. bitwise operator")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hp/hp100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hp/hp100.c b/drivers/net/ethernet/hp/hp100.c
index c8c7ad2eff77..9b5a68b65432 100644
--- a/drivers/net/ethernet/hp/hp100.c
+++ b/drivers/net/ethernet/hp/hp100.c
@@ -2634,7 +2634,7 @@ static int hp100_login_to_vg_hub(struct net_device *dev, u_short force_relogin)
 		/* Wait for link to drop */
 		time = jiffies + (HZ / 10);
 		do {
-			if (~(hp100_inb(VG_LAN_CFG_1) & HP100_LINK_UP_ST))
+			if (!(hp100_inb(VG_LAN_CFG_1) & HP100_LINK_UP_ST))
 				break;
 			if (!in_interrupt())
 				schedule_timeout_interruptible(1);
-- 
2.17.1

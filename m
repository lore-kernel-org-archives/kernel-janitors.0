From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Jul 2018 18:07:40 +0000
Subject: [PATCH] ray_cs: remove redundant pointer 'p'
Message-Id: <20180720180740.21018-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'p' is being assigned but is never used hence it is
redundant and can be removed. Also re-work if statement to remove
redundant assignment of p.

Cleans up clang warning:
warning: variable 'p' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ray_cs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index a7e0a17aa7e8..08c607c031bc 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -470,7 +470,6 @@ static inline struct rcs __iomem *rcs_base(ray_dev_t *dev)
 static int ray_init(struct net_device *dev)
 {
 	int i;
-	UCHAR *p;
 	struct ccs __iomem *pccs;
 	ray_dev_t *local = netdev_priv(dev);
 	struct pcmcia_device *link = local->finder;
@@ -513,12 +512,9 @@ static int ray_init(struct net_device *dev)
 	init_startup_params(local);
 
 	/* copy mac address to startup parameters */
-	if (parse_addr(phy_addr, local->sparm.b4.a_mac_addr)) {
-		p = local->sparm.b4.a_mac_addr;
-	} else {
+	if (!parse_addr(phy_addr, local->sparm.b4.a_mac_addr)) {
 		memcpy(&local->sparm.b4.a_mac_addr,
 		       &local->startup_res.station_addr, ADDRLEN);
-		p = local->sparm.b4.a_mac_addr;
 	}
 
 	clear_interrupt(local);	/* Clear any interrupt from the card */
-- 
2.17.1


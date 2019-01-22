From: Colin King <colin.king@canonical.com>
Date: Tue, 22 Jan 2019 14:37:55 +0000
Subject: [PATCH] net: amd8111e: clean up two minor indentation issues
Message-Id: <20190122143755.32527-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Two statements are incorrecly indented, fix these by removing a space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amd/amd8111e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index a90080f12e67..b9632928496e 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -435,7 +435,7 @@ static int amd8111e_restart(struct net_device *dev)
 	int i,reg_val;
 
 	/* stop the chip */
-	 writel(RUN, mmio + CMD0);
+	writel(RUN, mmio + CMD0);
 
 	if(amd8111e_init_ring(dev))
 		return -ENOMEM;
@@ -1720,7 +1720,7 @@ static void amd8111e_config_ipg(struct timer_list *t)
 		writew((u32)tmp_ipg, mmio + IPG);
 		writew((u32)(tmp_ipg - IFS1_DELTA), mmio + IFS1);
 	}
-	 mod_timer(&lp->ipg_data.ipg_timer, jiffies + IPG_CONVERGE_JIFFIES);
+	mod_timer(&lp->ipg_data.ipg_timer, jiffies + IPG_CONVERGE_JIFFIES);
 	return;
 
 }
-- 
2.19.1

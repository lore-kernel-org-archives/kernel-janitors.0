From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 12:36:51 +0000
Subject: [PATCH] net: ethernet: sun: remove redundant assignment to variable err
Message-Id: <20190704123651.31672-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
In-Reply-To: <20180705093732.21650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being assigned with a value that is never
read and it is being updated in the next statement with a new value.
The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sun/niu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 6f99437a6962..0bc5863bffeb 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -1217,8 +1217,6 @@ static int link_status_1g_rgmii(struct niu *np, int *link_up_p)
 
 	spin_lock_irqsave(&np->lock, flags);
 
-	err = -EINVAL;
-
 	err = mii_read(np, np->phy_addr, MII_BMSR);
 	if (err < 0)
 		goto out;
-- 
2.20.1

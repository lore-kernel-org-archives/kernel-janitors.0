From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:15:30 +0000
Subject: [PATCH] net: alx: remove redundant variable old_duplex
Message-Id: <20180704071530.14431-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S . Miller" <davem@davemloft.net>, Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable old_duplex is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'old_duplex' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/atheros/alx/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/atheros/alx/main.c b/drivers/net/ethernet/atheros/alx/main.c
index 5e5022fa1d04..6d3221134927 100644
--- a/drivers/net/ethernet/atheros/alx/main.c
+++ b/drivers/net/ethernet/atheros/alx/main.c
@@ -1279,7 +1279,6 @@ static void alx_check_link(struct alx_priv *alx)
 	struct alx_hw *hw = &alx->hw;
 	unsigned long flags;
 	int old_speed;
-	u8 old_duplex;
 	int err;
 
 	/* clear PHY internal interrupt status, otherwise the main
@@ -1288,7 +1287,6 @@ static void alx_check_link(struct alx_priv *alx)
 	alx_clear_phy_intr(hw);
 
 	old_speed = hw->link_speed;
-	old_duplex = hw->duplex;
 	err = alx_read_phy_link(hw);
 	if (err < 0)
 		goto reset;
-- 
2.17.1


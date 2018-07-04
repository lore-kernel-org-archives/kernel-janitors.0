From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 11:20:44 +0000
Subject: [PATCH] ethernet: micrel: remove redundant pointer 'info'
Message-Id: <20180704112044.7930-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'info' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'info' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/micrel/ksz884x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index b72d1bd11296..ebbdfb908745 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -3373,7 +3373,6 @@ static void port_get_link_speed(struct ksz_port *port)
  */
 static void port_set_link_speed(struct ksz_port *port)
 {
-	struct ksz_port_info *info;
 	struct ksz_hw *hw = port->hw;
 	u16 data;
 	u16 cfg;
@@ -3382,8 +3381,6 @@ static void port_set_link_speed(struct ksz_port *port)
 	int p;
 
 	for (i = 0, p = port->first_port; i < port->port_cnt; i++, p++) {
-		info = &hw->port_info[p];
-
 		port_r16(hw, p, KS884X_PORT_CTRL_4_OFFSET, &data);
 		port_r8(hw, p, KS884X_PORT_STATUS_OFFSET, &status);
 
-- 
2.17.1


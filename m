From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:19:38 +0000
Subject: [PATCH 04/10] atl1c: remove unneeded conversions to bool
Message-Id: <20191016181944.25106-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
index 2b239ecea05f..d6385899762c 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -1189,7 +1189,7 @@ static void atl1c_start_mac(struct atl1c_adapter *adapter)
 	struct atl1c_hw *hw = &adapter->hw;
 	u32 mac, txq, rxq;
 
-	hw->mac_duplex = adapter->link_duplex = FULL_DUPLEX ? true : false;
+	hw->mac_duplex = adapter->link_duplex = FULL_DUPLEX;
 	hw->mac_speed = adapter->link_speed = SPEED_1000 ?
 		atl1c_mac_speed_1000 : atl1c_mac_speed_10_100;
 
-- 
2.17.1

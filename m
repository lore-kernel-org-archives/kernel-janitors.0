From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Feb 2019 11:41:29 +0000
Subject: [PATCH] atl1c: fix indentation issue on an if statement
Message-Id: <20190202114129.18275-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An if statement is indented one level too deep, fix this by removing
the extra tabs. Also add some spaces to the dev_warn arguments to clean
up checkpatch warnings.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
index 3a3b35b5df67..03cdab8d4ab7 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -1833,10 +1833,10 @@ static void atl1c_clean_rx_irq(struct atl1c_adapter *adapter,
 		atl1c_clean_rrd(rrd_ring, rrs, rfd_num);
 		if (rrs->word3 & (RRS_RX_ERR_SUM | RRS_802_3_LEN_ERR)) {
 			atl1c_clean_rfd(rfd_ring, rrs, rfd_num);
-				if (netif_msg_rx_err(adapter))
-					dev_warn(&pdev->dev,
-						"wrong packet! rrs word3 is %x\n",
-						rrs->word3);
+			if (netif_msg_rx_err(adapter))
+				dev_warn(&pdev->dev,
+					 "wrong packet! rrs word3 is %x\n",
+					 rrs->word3);
 			continue;
 		}
 
-- 
2.20.1

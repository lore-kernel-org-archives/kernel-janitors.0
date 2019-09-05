From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 14:01:35 +0000
Subject: [PATCH] lan743x: remove redundant assignment to variable rx_process_result
Message-Id: <20190905140135.26951-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rx_process_result is being initialized with a value that
is never read and is being re-assigned immediately afterwards. The
assignment is redundant, so replace it with the return from function
lan743x_rx_process_packet.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 15a8be6bad27..a43140f7b5eb 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2172,9 +2172,8 @@ static int lan743x_rx_napi_poll(struct napi_struct *napi, int weight)
 	}
 	count = 0;
 	while (count < weight) {
-		int rx_process_result = -1;
+		int rx_process_result = lan743x_rx_process_packet(rx);
 
-		rx_process_result = lan743x_rx_process_packet(rx);
 		if (rx_process_result = RX_PROCESS_RESULT_PACKET_RECEIVED) {
 			count++;
 		} else if (rx_process_result =
-- 
2.20.1

From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 15:12:21 +0000
Subject: [PATCH][next] lan743x: remove redundant initialization of variable current_head_index
Message-Id: <20200722151221.957972-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable current_head_index is being initialized with a value that
is never read and it is being updated later with a new value.  Replace
the initialization of -1 with the latter assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index f6479384dc4f..de93cc6ebc1a 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2046,14 +2046,13 @@ static int lan743x_rx_process_packet(struct lan743x_rx *rx)
 {
 	struct skb_shared_hwtstamps *hwtstamps = NULL;
 	int result = RX_PROCESS_RESULT_NOTHING_TO_DO;
+	int current_head_index = *rx->head_cpu_ptr;
 	struct lan743x_rx_buffer_info *buffer_info;
 	struct lan743x_rx_descriptor *descriptor;
-	int current_head_index = -1;
 	int extension_index = -1;
 	int first_index = -1;
 	int last_index = -1;
 
-	current_head_index = *rx->head_cpu_ptr;
 	if (current_head_index < 0 || current_head_index >= rx->ring_size)
 		goto done;
 
-- 
2.27.0

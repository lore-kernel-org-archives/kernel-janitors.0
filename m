From: Colin King <colin.king@canonical.com>
Date: Thu, 03 Dec 2020 17:43:16 +0000
Subject: [PATCH][next] wilc1000: remove redundant assignment to pointer vif
Message-Id: <20201203174316.1071446-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to pointer vif is redundant as the assigned value
is never read, hence it can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/microchip/wilc1000/wlan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net/wireless/microchip/wilc1000/wlan.c
index 993ea7c03429..c12f27be9f79 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.c
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
@@ -685,7 +685,6 @@ int wilc_wlan_handle_txq(struct wilc *wilc, u32 *txq_count)
 			if (!tqe_q[ac])
 				continue;
 
-			vif = tqe_q[ac]->vif;
 			ac_exist = 1;
 			for (k = 0; (k < num_pkts_to_add[ac]) &&
 			     (!max_size_over) && tqe_q[ac]; k++) {
-- 
2.29.2

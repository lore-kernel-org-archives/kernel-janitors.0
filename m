From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 22:00:25 +0000
Subject: [PATCH] ipw2x00: fix spelling mistake "initializationg" -> "initialization"
Message-Id: <20190822220025.5690-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an IPW_DEBUG_INFO message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index fa55d2ccbfab..ed0f06532d5e 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -2721,7 +2721,7 @@ static void ipw_eeprom_init_sram(struct ipw_priv *priv)
 		/* Do not load eeprom data on fatal error or suspend */
 		ipw_write32(priv, IPW_EEPROM_LOAD_DISABLE, 0);
 	} else {
-		IPW_DEBUG_INFO("Enabling FW initializationg of SRAM\n");
+		IPW_DEBUG_INFO("Enabling FW initialization of SRAM\n");
 
 		/* Load eeprom data on fatal error or suspend */
 		ipw_write32(priv, IPW_EEPROM_LOAD_DISABLE, 1);
-- 
2.20.1

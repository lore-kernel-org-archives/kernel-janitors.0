From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:58:08 +0000
Subject: [PATCH][V2] wilc1000: fix spelling mistake in Kconfig "devision" -> "division"
Message-Id: <20201216115808.12987-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove another fix from the patch

---
 drivers/net/wireless/microchip/wilc1000/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/Kconfig b/drivers/net/wireless/microchip/wilc1000/Kconfig
index 80c92e8bf8a5..7f15e42602dd 100644
--- a/drivers/net/wireless/microchip/wilc1000/Kconfig
+++ b/drivers/net/wireless/microchip/wilc1000/Kconfig
@@ -44,4 +44,4 @@ config WILC1000_HW_OOB_INTR
 	  chipset. This OOB interrupt is intended to provide a faster interrupt
 	  mechanism for SDIO host controllers that don't support SDIO interrupt.
 	  Select this option If the SDIO host controller in your platform
-	  doesn't support SDIO time devision interrupt.
+	  doesn't support SDIO time division interrupt.
-- 
2.29.2

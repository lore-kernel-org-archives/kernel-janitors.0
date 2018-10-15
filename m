From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 15 Oct 2018 02:16:35 +0000
Subject: [PATCH] libertas: remove set but not used variable 'int_type'
Message-Id: <1539569795-176889-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: YueHaibing <yuehaibing@huawei.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/marvell/libertas/if_spi.c: In function 'if_spi_h2c':
drivers/net/wireless/marvell/libertas/if_spi.c:799:6: warning:
 variable 'int_type' set but not used [-Wunused-but-set-variable]

It never used since introduction in
commit d2b21f191753 ("libertas: if_spi, driver for libertas GSPI devices")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/marvell/libertas/if_spi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index 504d6e0..7c3224b 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -796,15 +796,13 @@ static void if_spi_h2c(struct if_spi_card *card,
 {
 	struct lbs_private *priv = card->priv;
 	int err = 0;
-	u16 int_type, port_reg;
+	u16 port_reg;
 
 	switch (type) {
 	case MVMS_DAT:
-		int_type = IF_SPI_CIC_TX_DOWNLOAD_OVER;
 		port_reg = IF_SPI_DATA_RDWRPORT_REG;
 		break;
 	case MVMS_CMD:
-		int_type = IF_SPI_CIC_CMD_DOWNLOAD_OVER;
 		port_reg = IF_SPI_CMD_RDWRPORT_REG;
 		break;
 	default:

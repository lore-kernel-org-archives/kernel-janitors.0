From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 14:23:44 +0000
Subject: [patch] libertas: remove some dead code in
Message-Id: <20110806142344.GA10373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "open list:MARVELL LIBERTAS..." <libertas-dev@lists.infradead.org>, "open list:NETWORKING [WIREL..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

We always hit the goto and skip the printk().  The original code does
the right thing even though it looks messy.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/libertas/if_spi.c b/drivers/net/wireless/libertas/if_spi.c
index e0286cf..622ae6d 100644
--- a/drivers/net/wireless/libertas/if_spi.c
+++ b/drivers/net/wireless/libertas/if_spi.c
@@ -531,10 +531,6 @@ static int if_spi_prog_helper_firmware(struct if_spi_card *card,
 		goto out;
 	err = spu_write_u16(card, IF_SPI_CARD_INT_CAUSE_REG,
 				IF_SPI_CIC_CMD_DOWNLOAD_OVER);
-		goto out;
-
-	lbs_deb_spi("waiting for helper to boot...\n");
-
 out:
 	if (err)
 		pr_err("failed to load helper firmware (err=%d)\n", err);

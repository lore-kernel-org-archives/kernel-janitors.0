From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Jun 2019 10:09:26 +0000
Subject: [PATCH] libertas: Fix a double free in if_spi_c2h_data()
Message-Id: <20190626100926.GD3242@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Philip Rakity <prakity@yahoo.com>
Cc: Allison Randal <allison@lohutok.net>, Lubomir Rintel <lkundrak@v3.sk>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The lbs_process_rxed_packet() frees the skb.  It didn't originally, but
we fixed it in commit f54930f36311 ("libertas: don't leak skb on receive
error").

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/marvell/libertas/if_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index 27067e79e83f..e38f02d1f2e4 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -772,7 +772,7 @@ static int if_spi_c2h_data(struct if_spi_card *card)
 	/* pass the SKB to libertas */
 	err = lbs_process_rxed_packet(card->priv, skb);
 	if (err)
-		goto free_skb;
+		goto out;  /* lbs_process_rxed_packet() frees skb */
 
 	/* success */
 	goto out;
-- 
2.20.1

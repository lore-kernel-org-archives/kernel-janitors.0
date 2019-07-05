From: Dan Williams <dcbw@redhat.com>
Date: Fri, 05 Jul 2019 16:42:48 +0000
Subject: [PATCH v2] libertas: Fix a double free in if_spi_c2h_data()
Message-Id: <ee4472e4728becc9713962ba264742cb1f337098.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190626100926.GD3242@mwanda>
         <be491ab35ba46111a1c90cc12b6d5ff6ea3f57e8.camel@redhat.com>
         <20190626132340.GE28859@kadam>
         <e679c9f99d6952f82924c71f036e4a196d0e72d4.camel@redhat.com>
In-Reply-To: <e679c9f99d6952f82924c71f036e4a196d0e72d4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Philip Rakity <prakity@yahoo.com>, libertas-dev@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Allison Randal <allison@lohutok.net>, Dan Carpenter <dan.carpenter@oracle.com>

The lbs_process_rxed_packet() frees the skb.  It didn't originally, but
we fixed it in commit f54930f36311 ("libertas: don't leak skb on receive
error").

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dan Williams <dcbw@redhat.com>
---
 drivers/net/wireless/marvell/libertas/if_spi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index 27067e79e83fe..072da89c4986f 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -766,19 +766,15 @@ static int if_spi_c2h_data(struct if_spi_card *card)
 
 	/* Read the data from the WLAN module into our skb... */
 	err = spu_read(card, IF_SPI_DATA_RDWRPORT_REG, data, ALIGN(len, 4));
-	if (err)
-		goto free_skb;
+	if (err) {
+		dev_kfree_skb(skb);
+		goto out
+	}
 
 	/* pass the SKB to libertas */
 	err = lbs_process_rxed_packet(card->priv, skb);
-	if (err)
-		goto free_skb;
+	/* lbs_process_rxed_packet() consumes the skb */
 
-	/* success */
-	goto out;
-
-free_skb:
-	dev_kfree_skb(skb);
 out:
 	if (err)
 		netdev_err(priv->dev, "%s: err=%d\n", __func__, err);
-- 
2.20.1

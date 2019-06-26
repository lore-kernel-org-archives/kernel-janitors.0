From: Dan Williams <dcbw@redhat.com>
Date: Wed, 26 Jun 2019 13:16:22 +0000
Subject: Re: [PATCH] libertas: Fix a double free in if_spi_c2h_data()
Message-Id: <be491ab35ba46111a1c90cc12b6d5ff6ea3f57e8.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190626100926.GD3242@mwanda>
In-Reply-To: <20190626100926.GD3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>, Philip Rakity <prakity@yahoo.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Allison Randal <allison@lohutok.net>, libertas-dev@lists.infradead.org

On Wed, 2019-06-26 at 13:09 +0300, Dan Carpenter wrote:
> The lbs_process_rxed_packet() frees the skb.  It didn't originally,
> but
> we fixed it in commit f54930f36311 ("libertas: don't leak skb on
> receive
> error").
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/marvell/libertas/if_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c
> b/drivers/net/wireless/marvell/libertas/if_spi.c
> index 27067e79e83f..e38f02d1f2e4 100644
> --- a/drivers/net/wireless/marvell/libertas/if_spi.c
> +++ b/drivers/net/wireless/marvell/libertas/if_spi.c
> @@ -772,7 +772,7 @@ static int if_spi_c2h_data(struct if_spi_card
> *card)
>  	/* pass the SKB to libertas */
>  	err = lbs_process_rxed_packet(card->priv, skb);
>  	if (err)
> -		goto free_skb;
> +		goto out;  /* lbs_process_rxed_packet() frees skb */
>  
>  	/* success */
>  	goto out;

It can be further simplified (not compile tested yet):

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

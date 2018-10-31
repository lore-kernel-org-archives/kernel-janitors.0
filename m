From: Joe Perches <joe@perches.com>
Date: Wed, 31 Oct 2018 18:52:09 +0000
Subject: Re: [PATCH] staging: vt6656: clean up few indentation issues
Message-Id: <a54f58ee05b190ac66c9a1347027b8d006988b61.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181030111333.3181-1-colin.king@canonical.com>
In-Reply-To: <20181030111333.3181-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-10-30 at 11:13 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to clean up indentation issues
[]
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> index ccafcc2c87ac..b613a1d113bb 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -245,10 +245,10 @@ static int vnt_init_registers(struct vnt_private *priv)
>  		} else {
>  			priv->tx_antenna_mode = ANT_B;
>  
> -		if (priv->tx_rx_ant_inv)
> -			priv->rx_antenna_mode = ANT_A;
> -		else
> -			priv->rx_antenna_mode = ANT_B;
> +			if (priv->tx_rx_ant_inv)
> +				priv->rx_antenna_mode = ANT_A;
> +			else
> +				priv->rx_antenna_mode = ANT_B;
>  		}
>  	}

This one is perhap better resolved by moving
the inversion test after the block like:

---
 drivers/staging/vt6656/main_usb.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index ccafcc2c87ac..3830437e321a 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -227,29 +227,16 @@ static int vnt_init_registers(struct vnt_private *priv)
 	if (antenna = (EEP_ANTENNA_AUX | EEP_ANTENNA_MAIN)) {
 		priv->tx_antenna_mode = ANT_B;
 		priv->rx_antenna_sel = 1;
-
-		if (priv->tx_rx_ant_inv)
-			priv->rx_antenna_mode = ANT_A;
-		else
-			priv->rx_antenna_mode = ANT_B;
 	} else  {
 		priv->rx_antenna_sel = 0;
-
-		if (antenna & EEP_ANTENNA_AUX) {
+		if (antenna & EEP_ANTENNA_AUX)
 			priv->tx_antenna_mode = ANT_A;
-
-			if (priv->tx_rx_ant_inv)
-				priv->rx_antenna_mode = ANT_B;
-			else
-				priv->rx_antenna_mode = ANT_A;
-		} else {
-			priv->tx_antenna_mode = ANT_B;
-
-		if (priv->tx_rx_ant_inv)
-			priv->rx_antenna_mode = ANT_A;
 		else
-			priv->rx_antenna_mode = ANT_B;
-		}
+			priv->tx_antenna_mode = ANT_B;
+	}
+	if (priv->tx_rx_ant_inv) {
+		priv->rx_antenna_mode +			(priv->rx_antenna_mode = ANT_A) ? ANT_B : ANT_A;
 	}
 
 	/* Set initial antenna mode */

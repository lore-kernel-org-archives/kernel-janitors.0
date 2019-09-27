From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 27 Sep 2019 10:21:46 +0000
Subject: Re: [PATCH] staging: vt6656: clean up an indentation issue
Message-Id: <20190927102144.GA23080@jiffies>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927092400.20213-1-colin.king@canonical.com>
In-Reply-To: <20190927092400.20213-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Forest Bond <forest@alittletooquiet.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 27, 2019 at 10:24:00AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a block of code that is indented incorrectly, add in the
> missing tabs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/vt6656/main_usb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> index 856ba97aec4f..3478a10f8025 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -249,10 +249,10 @@ static int vnt_init_registers(struct vnt_private *priv)
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
>  
> -- 
> 2.20.1
> 

Reviewed-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>

Thanks!
Quentin

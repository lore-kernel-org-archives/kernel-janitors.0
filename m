From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Apr 2018 11:18:33 +0000
Subject: Re: [PATCH v4 2/2] staging: vt6655: add handling memory leak on vnt_start()
Message-Id: <20180403111833.r6o3xf4go5gfwyj6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522389115-1124-1-git-send-email-ji_hun.kim@samsung.com>
 <CGME20180330055211epcas2p1a75c707cdf600cfd5027e253ef440861@epcas2p1.samsung.com>
 <1522389115-1124-2-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522389115-1124-2-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, baijiaju1990@gmail.com, forest@alittletooquiet.net, santhameena13@gmail.com

On Fri, Mar 30, 2018 at 02:51:55PM +0900, Ji-Hun Kim wrote:
> There was no code for handling memory leaks of device_init_rings() and
> request_irq(). It needs to free allocated memory in the device_init_rings()
> , when request_irq() is failed. Add freeing sequences of irq and device
> init rings.
> 
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
> ---
> It's additional memory leak handling patch from
> [PATCH v4 1/2] staging: vt6655: check for memory allocation failures
> 
>  drivers/staging/vt6655/device_main.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index c9752df..3604f2d 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -1194,14 +1194,17 @@ static int vnt_start(struct ieee80211_hw *hw)
>  	int ret;
>  
>  	priv->rx_buf_sz = PKT_BUF_SZ;
> -	if (!device_init_rings(priv))
> -		return -ENOMEM;
> +	ret = (int)device_init_rings(priv);

There is only one call site.  Just change device_init_rings() to return
negative error codes or zero.

> +	if (!ret) {
> +		ret = -ENOMEM;
> +		goto err_init_rings;

Just return directly since there is nothing to clean up.

		return -ENOMEM;

> +	}
>  
>  	ret = request_irq(priv->pcid->irq, vnt_interrupt,
>  			  IRQF_SHARED, "vt6655", priv);
>  	if (ret) {
>  		dev_dbg(&priv->pcid->dev, "failed to start irq\n");
> -		return ret;
> +		goto err_irq;

This is a "come from" label name.  It's better if the goto says what the
goto does like "goto err_free_rings;" here.

regards,
dan carpenter


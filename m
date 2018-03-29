From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Thu, 29 Mar 2018 08:00:42 +0000
Subject: Re: [PATCH v2] staging: vt6655: check for memory allocation failures
Message-Id: <798fbe60-52aa-4fb0-0cd3-e2c067bd6c04@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180329072248epcas2p3d12617d41e964252998dd1d34f740a97@epcas2p3.samsung.com>
 <1522308157-26463-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522308157-26463-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>, gregkh@linuxfoundation.org, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, santhameena13@gmail.com



On 2018/3/29 15:22, Ji-Hun Kim wrote:
> There are no null pointer checking on rd_info and td_info values which
> are allocated by kzalloc. It has potential null pointer dereferencing
> issues. Add return when allocation is failed.
>
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
> ---
>
> Change: since v1:
>
> - Delete WARN_ON which can makes crashes on some machines.
> - Instead of return directly, goto freeing function for freeing previously
>    allocated memory in the for loop after kzalloc() failed.
> - In the freeing function, if td_info and rd_info are not allocated, no
>    needs to free.
>
>   drivers/staging/vt6655/device_main.c | 64 +++++++++++++++++++++++++-----------
>   1 file changed, 44 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index fbc4bc6..ecbba43 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -539,7 +539,8 @@ static void device_init_rd0_ring(struct vnt_private *priv)
>   	     i ++, curr += sizeof(struct vnt_rx_desc)) {
>   		desc = &priv->aRD0Ring[i];
>   		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> -
> +		if (!desc->rd_info)
> +			goto error;
>   		if (!device_alloc_rx_buf(priv, desc))
>   			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
>   
> @@ -550,6 +551,10 @@ static void device_init_rd0_ring(struct vnt_private *priv)
>   	if (i > 0)
>   		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
>   	priv->pCurrRD[0] = &priv->aRD0Ring[0];
> +
> +	return;
> +error:
> +	device_free_rd0_ring(priv);
>   }
>   

I think you should return an error number here, because 
device_init_rd0_ring() is called by vnt_start().
You should also implement error handling code in vnt_start(), and let 
vnt_start() returns an error number too.
The same for device_init_rd1_ring(), device_init_td0_ring() and 
device_init_td1_ring().


Best wishes,
Jia-Ju Bai

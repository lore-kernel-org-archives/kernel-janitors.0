From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Wed, 28 Mar 2018 09:55:57 +0000
Subject: Re: [PATCH] staging: vt6655: check for memory allocation failures
Message-Id: <fc4cd041-f8b4-f799-916d-9df790efbba7@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180328063144epcas1p305216b582520b884b09c93a7ad591660@epcas1p3.samsung.com>
 <1522218691-7917-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522218691-7917-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>, gregkh@linuxfoundation.org, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, santhameena13@gmail.com



On 2018/3/28 14:31, Ji-Hun Kim wrote:
> There are no null pointer checking on rd_info and td_info values which
> are allocated by kzalloc. It has potential null pointer dereferencing
> issues. Add return when allocation is failed.
>
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
> ---
>   drivers/staging/vt6655/device_main.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index fbc4bc6..5d0ba94 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -539,7 +539,8 @@ static void device_init_rd0_ring(struct vnt_private *priv)
>   	     i ++, curr += sizeof(struct vnt_rx_desc)) {
>   		desc = &priv->aRD0Ring[i];
>   		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> -
> +		if (WARN_ON(!desc->rd_info))
> +			return;
>   		if (!device_alloc_rx_buf(priv, desc))
>   			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
>   
> @@ -563,7 +564,8 @@ static void device_init_rd1_ring(struct vnt_private *priv)
>   	     i ++, curr += sizeof(struct vnt_rx_desc)) {
>   		desc = &priv->aRD1Ring[i];
>   		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
> -
> +		if (WARN_ON(!desc->rd_info))
> +			return;
>   		if (!device_alloc_rx_buf(priv, desc))
>   			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
>   
> @@ -621,7 +623,8 @@ static void device_init_td0_ring(struct vnt_private *priv)
>   	     i++, curr += sizeof(struct vnt_tx_desc)) {
>   		desc = &priv->apTD0Rings[i];
>   		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
> -
> +		if (WARN_ON(!desc->td_info))
> +			return;
>   		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
>   		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
>   
> @@ -646,7 +649,8 @@ static void device_init_td1_ring(struct vnt_private *priv)
>   	     i++, curr += sizeof(struct vnt_tx_desc)) {
>   		desc = &priv->apTD1Rings[i];
>   		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
> -
> +		if (WARN_ON(!desc->td_info))
> +			return;
>   		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
>   		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
>   

I think the bugs you found are right.
But your patch is not correct, because it is dangerous to return directly.
I think you should return an error and then implement error handling 
code for these functions.


Best wishes,
Jia-Ju Bai

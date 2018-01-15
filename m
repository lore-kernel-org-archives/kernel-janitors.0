From: Steve Longerbeam <slongerbeam@gmail.com>
Date: Mon, 15 Jan 2018 16:22:02 +0000
Subject: Re: [PATCH] media: staging/imx: Checking the right variable in vdic_get_ipu_resources()
Message-Id: <1cf19bb9-0ada-523e-9c9c-02a36d6deb21@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180115081147.upana3zubsxp4vvd@mwanda>
In-Reply-To: <20180115081147.upana3zubsxp4vvd@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Steve Longerbeam <steve_longerbeam@mentor.com>


On 01/15/2018 12:11 AM, Dan Carpenter wrote:
> We recently changed this error handling around but missed this error
> pointer check.  We're testing "priv->vdi_in_ch_n" instead of "ch" so the
> error handling can't be triggered.
>
> Fixes: 0b2e9e7947e7 ("media: staging/imx: remove confusing IS_ERR_OR_NULL usage")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
> index 433474d58e3e..ed356844cdf6 100644
> --- a/drivers/staging/media/imx/imx-media-vdic.c
> +++ b/drivers/staging/media/imx/imx-media-vdic.c
> @@ -177,7 +177,7 @@ static int vdic_get_ipu_resources(struct vdic_priv *priv)
>   		priv->vdi_in_ch = ch;
>   
>   		ch = ipu_idmac_get(priv->ipu, IPUV3_CHANNEL_MEM_VDI_NEXT);
> -		if (IS_ERR(priv->vdi_in_ch_n)) {
> +		if (IS_ERR(ch)) {
>   			err_chan = IPUV3_CHANNEL_MEM_VDI_NEXT;
>   			ret = PTR_ERR(ch);
>   			goto out_err_chan;


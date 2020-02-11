From: Steve Longerbeam <slongerbeam@gmail.com>
Date: Tue, 11 Feb 2020 18:10:57 +0000
Subject: Re: [PATCH] media: staging/imx: Missing assignment in imx_media_capture_device_register()
Message-Id: <8cafab51-93d9-9596-bf4d-d8990df7ccda@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200211073522.jobdu256d22c3y32@kili.mountain>
In-Reply-To: <20200211073522.jobdu256d22c3y32@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for catching. Tested on a imx6 sabreauto and it's fine.

On 2/10/20 11:35 PM, Dan Carpenter wrote:
> There was supposed to be a "ret = " assignment here, otherwise the
> error handling on the next line won't work.
>
> Fixes: 64b5a49df486 ("[media] media: imx: Add Capture Device Interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
> Not tested.  Sometimes in these situations the function could be
> returning something bogus but no one knew because the assignment wasn't
> there.  So it's best to test these.
>
>   drivers/staging/media/imx/imx-media-capture.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 7712e7be8625..df0bf680721b 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -778,7 +778,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>   	/* setup default format */
>   	fmt_src.pad = priv->src_sd_pad;
>   	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -	v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
>   	if (ret) {
>   		v4l2_err(sd, "failed to get src_sd format\n");
>   		goto unreg;

From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 22 Jul 2020 13:04:11 +0000
Subject: Re: [PATCH] media: allegro: fix an error pointer vs NULL check
Message-Id: <20200722130411.GB21264@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722123848.GA220681@mwanda>
In-Reply-To: <20200722123848.GA220681@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

On Wed, 22 Jul 2020 15:38:48 +0300, Dan Carpenter wrote:
> The allegro_mbox_init() function returns error pointers, it never
> returns NULL.
> 
> Fixes: 94dc76560261 ("media: allegro: rework mbox handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 61beae1fca36..9f718f43282b 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2952,7 +2952,7 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
>  					      info->mailbox_size);
>  	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
>  					     info->mailbox_size);
> -	if (!dev->mbox_command || !dev->mbox_status) {
> +	if (IS_ERR(dev->mbox_command) || IS_ERR(dev->mbox_status)) {
>  		v4l2_err(&dev->v4l2_dev,
>  			 "failed to initialize mailboxes\n");
>  		return -EIO;
> -- 
> 2.27.0
> 
> 

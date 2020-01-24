From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 24 Jan 2020 13:03:35 +0000
Subject: Re: [PATCH] media: allegro: fix spelling mistake "to" -> "too"
Message-Id: <20200124140335.1900eef7@litschi.hi.pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123010643.2834801-1-colin.king@canonical.com>
In-Reply-To: <20200123010643.2834801-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

On Thu, 23 Jan 2020 01:06:43 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a v4l2_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 3be41698df4c..9908d851d4be 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -781,7 +781,7 @@ static int allegro_mbox_write(struct allegro_dev *dev,
>  
>  	if (size > mbox->size) {
>  		v4l2_err(&dev->v4l2_dev,
> -			 "message (%zu bytes) to large for mailbox (%zu bytes)\n",
> +			 "message (%zu bytes) too large for mailbox (%zu bytes)\n",
>  			 size, mbox->size);
>  		return -EINVAL;
>  	}

From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 29 Sep 2020 14:06:44 +0000
Subject: Re: [PATCH 01/20] media: coda: use semicolons rather than commas to separate statements
Message-Id: <71e129112af93a3ba618e8046313cd4b3871a7a8.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
         <1601385283-26144-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2020-09-29 at 15:14 +0200, Julia Lawall wrote:
> Replace commas with semicolons.  Commas introduce unnecessary
> variability in the code structure and are hard to see.  What is done
> is essentially described by the following Coccinelle semantic patch
> (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/media/platform/coda/coda-common.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index eeba6c060981..1bb16cc0a823 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -2861,7 +2861,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
>  	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
>  	vfd->fops	= &coda_fops;
>  	vfd->ioctl_ops	= &coda_ioctl_ops;
> -	vfd->release	= video_device_release_empty,
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->dev_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> 
> 

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

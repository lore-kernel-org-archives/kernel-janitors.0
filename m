From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 19 Aug 2010 16:16:50 +0000
Subject: RE: [patch] V4L/DVB: unlock on error path
Message-Id: <002801cb3fb9$ee00a370$ca01ea50$%nawrocki@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100812074158.GH645@bicker>
In-Reply-To: <20100812074158.GH645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <error27@gmail.com>
Cc: 'Mauro Carvalho Chehab' <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Thank you for catching this up. I had this fixed already, but due to hassle
caused by having multiple versions of the driver this bug somehow made it
unnoticed to mainline.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Thursday, August 12, 2010 9:42 AM
> To: Mauro Carvalho Chehab
> Cc: Pawel Osciak; Kyungmin Park; Sylwester Nawrocki; linux-
> media@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] V4L/DVB: unlock on error path
> 
> If we return directly here then we miss out on some mutex_unlock()s
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/media/video/s5p-fimc/fimc-core.c
> b/drivers/media/video/s5p-fimc/fimc-core.c
> index b151c7b..1beb226 100644
> --- a/drivers/media/video/s5p-fimc/fimc-core.c
> +++ b/drivers/media/video/s5p-fimc/fimc-core.c
> @@ -822,7 +822,8 @@ static int fimc_m2m_s_fmt(struct file *file, void
> *priv, struct v4l2_format *f)
>  	} else {
>  		v4l2_err(&ctx->fimc_dev->m2m.v4l2_dev,
>  			 "Wrong buffer/video queue type (%d)\n", f->type);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto s_fmt_out;
>  	}
> 
>  	pix = &f->fmt.pix;



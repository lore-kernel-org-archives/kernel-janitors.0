From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 22 Nov 2016 21:39:44 +0000
Subject: Re: [patch] Staging: media: davinci_vpfe: unlock on error in vpfe_reqbufs()
Message-Id: <1552231.W5T0VxdTBZ@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118113024.GA3150@mwanda>
In-Reply-To: <20161118113024.GA3150@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Manjunath Hadli <manjunath.hadli@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Thaissa Falbo <thaissa.falbo@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Leo Sperling <leosperling97@gmail.com>, sayli karnik <karniksayli1995@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Friday 18 Nov 2016 14:30:24 Dan Carpenter wrote:
> We should unlock before returning this error code in vpfe_reqbufs().
> 
> Fixes: 622897da67b3 ("[media] davinci: vpfe: add v4l2 video driver support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree. I will send a pull request for v4.11.

> diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c
> b/drivers/staging/media/davinci_vpfe/vpfe_video.c index c34bf46..353f3a8
> 100644
> --- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
> +++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
> @@ -1362,7 +1362,7 @@ static int vpfe_reqbufs(struct file *file, void *priv,
> ret = vb2_queue_init(q);
>  	if (ret) {
>  		v4l2_err(&vpfe_dev->v4l2_dev, "vb2_queue_init() failed\n");
> -		return ret;
> +		goto unlock_out;
>  	}
> 
>  	fh->io_allowed = 1;

-- 
Regards,

Laurent Pinchart


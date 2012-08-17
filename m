From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Fri, 17 Aug 2012 07:34:07 +0000
Subject: RE: [patch] [media] mem2mem_testdev: unlock and return error code properly
Message-Id: <01eb01cd7c4a$b271a9b0$1754fd10$%szyprowski@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120814065856.GC4791@elgon.mountain>
In-Reply-To: <20120814065856.GC4791@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Mauro Carvalho Chehab' <mchehab@infradead.org>
Cc: 'Hans Verkuil' <hans.verkuil@cisco.com>, =?iso-8859-2?Q?'Tomasz_Mo=F1'?= <desowin@gmail.com>, 'Guennadi Liakhovetski' <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tuesday, August 14, 2012 8:59 AM Dan Carpenter wrote:

> We recently added locking to this function, but there was an error path
> which accidentally returned holding a lock.  Also we returned zero on
> failure on some paths instead of the error code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch!

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Applies to linux-next.
> 
> diff --git a/drivers/media/video/mem2mem_testdev.c b/drivers/media/video/mem2mem_testdev.c
> index 0aa8c47..0b496f3 100644
> --- a/drivers/media/video/mem2mem_testdev.c
> +++ b/drivers/media/video/mem2mem_testdev.c
> @@ -911,10 +911,9 @@ static int m2mtest_open(struct file *file)
>  	v4l2_ctrl_new_custom(hdl, &m2mtest_ctrl_trans_time_msec, NULL);
>  	v4l2_ctrl_new_custom(hdl, &m2mtest_ctrl_trans_num_bufs, NULL);
>  	if (hdl->error) {
> -		int err = hdl->error;
> -
> +		rc = hdl->error;
>  		v4l2_ctrl_handler_free(hdl);
> -		return err;
> +		goto open_unlock;
>  	}
>  	ctx->fh.ctrl_handler = hdl;
>  	v4l2_ctrl_handler_setup(hdl);
> @@ -946,7 +945,7 @@ static int m2mtest_open(struct file *file)
> 
>  open_unlock:
>  	mutex_unlock(&dev->dev_mutex);
> -	return 0;
> +	return rc;
>  }
> 
>  static int m2mtest_release(struct file *file)


Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center



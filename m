From: Jingoo Han <jg1.han@samsung.com>
Date: Mon, 12 May 2014 02:39:12 +0000
Subject: Re: [patch] [media] Staging: dt3155v4l: set error code on failure
Message-Id: <000a01cf6d8b$5c0ef6c0$142ce440$%han@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140509115509.GA32027@mwanda>
In-Reply-To: <20140509115509.GA32027@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Mauro Carvalho Chehab' <m.chehab@samsung.com>
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Hans Verkuil' <hans.verkuil@cisco.com>, 'Jon Mason' <jdmason@kudzu.us>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Sakari Ailus' <sakari.ailus@iki.fi>, =?iso-8859-2?Q?'Kristina_Mart=B9enko'?= <kristina.martsenko@gmail.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 09, 2014 8:55 PM, Dan Carpenter wrote:
> 
> We should be returning -ENOMEM here instead of success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

It looks good. video_device_alloc() calls kzalloc(); thus,
when video_device_alloc() returns NULL, '-ENOMEM' should be
returned.

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> 
> diff --git a/drivers/staging/media/dt3155v4l/dt3155v4l.c b/drivers/staging/media/dt3155v4l/dt3155v4l.c
> index afbc2e5..178aa5b 100644
> --- a/drivers/staging/media/dt3155v4l/dt3155v4l.c
> +++ b/drivers/staging/media/dt3155v4l/dt3155v4l.c
> @@ -907,8 +907,10 @@ dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (!pd)
>  		return -ENOMEM;
>  	pd->vdev = video_device_alloc();
> -	if (!pd->vdev)
> +	if (!pd->vdev) {
> +		err = -ENOMEM;
>  		goto err_video_device_alloc;
> +	}
>  	*pd->vdev = dt3155_vdev;
>  	pci_set_drvdata(pdev, pd);    /* for use in dt3155_remove() */
>  	video_set_drvdata(pd->vdev, pd);  /* for use in video_fops */


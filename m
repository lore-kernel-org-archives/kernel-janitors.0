From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 22 Jun 2012 08:37:14 +0000
Subject: Re: [patch] staging: comedi: double unlock in usbduxsigma_attach()
Message-Id: <4FE42EBA.9010002@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120622071459.GB27618@elgon.mountain>
In-Reply-To: <20120622071459.GB27618@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-06-22 08:14, Dan Carpenter wrote:
> There was a double unlock introduced in 60ff461067 ("staging: comedi:
> usbduxsigma: use attach_usb() hook").
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
> index 28f41e9..015b0d0 100644
> --- a/drivers/staging/comedi/drivers/usbduxsigma.c
> +++ b/drivers/staging/comedi/drivers/usbduxsigma.c
> @@ -2781,7 +2781,6 @@ static int usbduxsigma_attach(struct comedi_device *dev,
>   	if (index < 0) {
>   		dev_err(dev->class_dev,
>   			"usbduxsigma: error: attach failed, dev not connected to the usb bus.\n");
> -		up(&start_stop_sem);
>   		ret = -ENODEV;
>   	} else
>   		ret = usbduxsigma_attach_common(dev, &usbduxsub[index],

Oops, I must have missed that one!

Acked-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-



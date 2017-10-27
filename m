From: Jules Maselbas <jules.maselbas@grenoble-inp.org>
Date: Fri, 27 Oct 2017 09:06:36 +0000
Subject: Re: [PATCH] usb: max3421: unlock on error in max3421_hub_control()
Message-Id: <622639427.1520752.1509095196276.JavaMail.zimbra@grenoble-inp.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171027062620.emm5wwdv73kjjpvl@mwanda>
In-Reply-To: <20171027062620.emm5wwdv73kjjpvl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

> We can't return directly in max3421_hub_control(), we have to unlock
> first.
Yes you are right.
I think testing if pdata is null is not necessary as driver_probe will fail if
the device do not have a platform_data.

Jules.

> Fixes: 721fdc83b31b ("usb: max3421: Add devicetree support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> index 928a5aabee02..46a86a7f3360 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1704,7 +1704,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16
> value, u16 index,
> 	pdata = spi->dev.platform_data;
> 	if (!pdata) {
> 		dev_err(&spi->dev, "Device platform data is missing\n");
> -		return -EFAULT;
> +		retval = -EFAULT;
> +		goto unlock;
> 	}
> 
> 	switch (type_req) {
> @@ -1787,6 +1788,7 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16
> value, u16 index,
> 		retval = -EPIPE;
> 	}
> 
> +unlock:
> 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> 	return retval;
>  }

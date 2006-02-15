From: Greg KH <greg@kroah.com>
Date: Wed, 15 Feb 2006 03:04:56 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <20060215030456.GA17983@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44588027258874474=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============44588027258874474==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
> 
> Hello,
> Gcc 4.0.2 had the warning:
> 
> drivers/usb/media/ov511.c: In function 'show_exposure':
> drivers/usb/media/ov511.c:5642: warning: 'exp' may be used uninitialized
> in this function
> 
> Here is the patch to fix that warning.
> 
> Signed-off-by: Matthew Martin <lihnucks@gmail.com>
> 
> ---
> 
> --- orig-linux-2.6.15/drivers/usb/media/ov511.c	2006-02-14 15:15:10.000000000 -0600
> +++ linux-2.6.15/drivers/usb/media/ov511.c	2006-02-14 15:12:32.000000000 -0600
> @@ -5639,7 +5639,7 @@ static CLASS_DEVICE_ATTR(hue, S_IRUGO, s
>  static ssize_t show_exposure(struct class_device *cd, char *buf)
>  {
>  	struct usb_ov511 *ov = cd_to_ov(cd);
> -	unsigned char exp;
> +	unsigned char exp = '\0';

What's wrong with just "0" here?

thanks,

greg k-h

--===============44588027258874474==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44588027258874474==--

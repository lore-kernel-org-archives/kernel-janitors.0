From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Fri, 11 Feb 2005 06:20:15 +0000
Subject: Re: [KJ] [PATCH][19/26] drivers/video/kyro/* - compile warning cleanup
Message-Id: <200502110911.28762.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66837363173080955=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.32422.5872E2@localhost>
In-Reply-To: <420BEF84.32422.5872E2@localhost>
To: kernel-janitors@vger.kernel.org

--===============66837363173080955==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 10 February 2005 23:34, Stephen Biggs wrote:

> --- linux-2.6.11-rc3-mm-original/drivers/video/kyro/fbdev.c
> +++ linux-2.6.11-rc3-mm/drivers/video/kyro/fbdev.c

> -		copy_from_user(&ol_create, argp, sizeof(overlay_create));
> +		if (copy_from_user(&ol_create, argp, sizeof(overlay_create))) {
> +			printk(KERN_ERR "copy_from_user failed!\n");

Forgotten "Kyro FB: " prefix.

> -		copy_from_user(&ol_viewport_set, argp,
> -			       sizeof(overlay_viewport_set));
> +		if (copy_from_user(&ol_viewport_set, argp,
> +			       sizeof(overlay_viewport_set))) {
> +			printk(KERN_ERR "copy_from_user failed!\n");

> -		copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long));
> +		if (copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long))) {
> +			printk(KERN_ERR "copy_to_user failed!\n");

> -		copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long));
> +		if (copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long))) {
> +			printk(KERN_ERR "copy_to_user failed!\n");

> -		copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long));
> +		if (copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long))) {
> +			printk(KERN_ERR "copy_to_user failed!\n");

	Alexey

--===============66837363173080955==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66837363173080955==--

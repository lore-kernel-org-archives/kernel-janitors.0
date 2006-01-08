From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 08 Jan 2006 21:55:35 +0000
Subject: Re: [KJ] [Patch] Remove MOD_{INC,DEC}_USE_COUNT in pcf8563.c
Message-Id: <20060108215535.GB7488@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98471396138392486=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135097000.27486.3.camel@alice>
In-Reply-To: <1135097000.27486.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============98471396138392486==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2005 at 05:45:11PM +0100, Eric Sesterhenn / snakebyte wrote:
> --- linux-2.6.15-rc6/arch/cris/arch-v32/drivers/pcf8563.c.orig
> +++ linux-2.6.15-rc6/arch/cris/arch-v32/drivers/pcf8563.c

>  static struct file_operations pcf8563_fops = {
>  	owner: THIS_MODULE,
>  	ioctl: pcf8563_ioctl,
> -	open: pcf8563_open,
> -	release: pcf8563_release,
> +	open: nonseekable_open,

Why nooseekable_open()?


--===============98471396138392486==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98471396138392486==--

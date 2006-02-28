From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 28 Feb 2006 21:48:07 +0000
Subject: Re: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <20060228214806.GD7793@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============041736155010669407=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602272229.51950.tim@aapopfiets.nl>
In-Reply-To: <200602272229.51950.tim@aapopfiets.nl>
To: kernel-janitors@vger.kernel.org

--===============041736155010669407==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2006 at 07:18:58AM +0100, Tim Cooijmans wrote:
>  void __init
> +chrp_request_region(unsigned long start, unsigned long n, char *desc)
> +{
> +	if (!request_region(start, n, desc))
> +		printk(KERN_WARNING "chrp: unable to allocate %s region.\n", desc);
> +}
> +
> +void __init
>  chrp_init2(void)
>  {
>  #ifdef CONFIG_NVRAM
>  	chrp_nvram_init();
>  #endif
>
> -	request_region(0x20,0x20,"pic1");
> -	request_region(0xa0,0x20,"pic2");
> -	request_region(0x00,0x20,"dma1");
> -	request_region(0x40,0x20,"timer");
> -	request_region(0x80,0x10,"dma page reg");
> -	request_region(0xc0,0x20,"dma2");
> +	chrp_request_region(0x20,0x20,"pic1");
> +	chrp_request_region(0xa0,0x20,"pic2");
> +	chrp_request_region(0x00,0x20,"dma1");
> +	chrp_request_region(0x40,0x20,"timer");
> +	chrp_request_region(0x80,0x10,"dma page reg");
> +	chrp_request_region(0xc0,0x20,"dma2");

OK, you've followed this route. One question they'll ask me is

	Can those calls ever fail?

I mean, you're deeply in arch-specific setup code. And request_region()
parameters are hardwired. And numbers are common among other subarchs in
this patch.


--===============041736155010669407==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============041736155010669407==--

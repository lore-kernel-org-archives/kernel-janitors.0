From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Feb 2006 21:47:03 +0000
Subject: Re: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <20060227214703.GA14119@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35344779127759773=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35344779127759773==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27.02.2006 [22:29:51 +0100], Tim Cooijmans wrote:
> From: Tim Cooijmans <tim@aapopfiets.nl>
> 
> Check request_region() return value and warn on failure.  Note that
> releasing succeeded requests doesn't make much sense, as the calling
> code doesn't know if anything failed.
> 
> The powerpc code has been compile tested.  The ppc code has not been
> tested, but the changes are very similar.

Looks good in general, one small nit.

> Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
> ---
> diff -uprN linux-2.6.16-rc5-orig/arch/powerpc/platforms/chrp/setup.c linux-2.6.16-rc5/arch/powerpc/platforms/chrp/setup.c
> --- linux-2.6.16-rc5-orig/arch/powerpc/platforms/chrp/setup.c	2006-02-27 20:36:36.000000000 +0100
> +++ linux-2.6.16-rc5/arch/powerpc/platforms/chrp/setup.c	2006-02-27 21:52:27.000000000 +0100
> @@ -465,18 +465,26 @@ void __init chrp_init_IRQ(void)
>  }
>  
>  void __init
> +chrp_request_region(unsigned long start, unsigned long n, char *desc)
> +{
> +	if (!request_region(start, n, desc)) {
> +		printk(KERN_WARNING "CHRP: unable to allocate %s region.\n", desc);
> +	}

Here and in the other request_region() wrappers, no { } for the one-line
if, please.

Thanks,
Nish

--===============35344779127759773==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35344779127759773==--

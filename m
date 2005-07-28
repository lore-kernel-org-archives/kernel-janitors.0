From: Domen Puncer <domen@coderock.org>
Date: Thu, 28 Jul 2005 17:18:47 +0000
Subject: Re: [KJ] [PATCH] drivers/video/vgastate.c
Message-Id: <20050728171847.GC2249@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7956490054579981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42E8EA34.3020300@steunenberg.org>
In-Reply-To: <42E8EA34.3020300@steunenberg.org>
To: kernel-janitors@vger.kernel.org

--===============7956490054579981==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28/07/05 16:22 +0200, Jerome Steunenberg wrote:
> This is my first patch to kernel-janitors. Please tell me if I got it all ok
> In drivers/video/vgastate.c, the calls to init_module and cleanup_module 
> have been replaced by calls to module_init and module_exit.

"Subject" could be improved

> 
> Signed-off-by: Jerome Steunenberg <jerome@steunenberg.org>
> 
> 
> 
> --- linux-2.6.13-rc3/drivers/video/vgastate.c.orig	2005-07-25 
> 15:09:51.000000000 +0200

Wrapped line. Try playing with your mailer settings.

> +++ linux-2.6.13-rc3/drivers/video/vgastate.c	2005-07-26 
> 10:15:32.000000000 +0200
> @@ -491,8 +491,17 @@ int restore_vga (struct vgastate *state)
>  }
> 
>  #ifdef MODULE
> -int init_module(void) { return 0; };
> -void cleanup_module(void) {};
> +static int __init vgastate_init(void)
> +{
> +	return 0;
> +}
> +
> +static void __exit vgastate_exit(void)
> +{
> +}
> +
> +module_init(vgastate_init);
> +module_exit(vgastate_exit);
>  #endif

How about just removing it? A quick hello world module confirmed it
works without these functions.

--===============7956490054579981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7956490054579981==--

From: Domen Puncer <domen@coderock.org>
Date: Sun, 30 Jan 2005 11:54:57 +0000
Subject: [KJ] Re: rivafb: Clean up printk()'s in drivers/video/riva/fbdev.c
Message-Id: <20050130115457.GB3835@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32454725629570991=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32454725629570991==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 25/01/05 19:52 -0600, James Nelson wrote:
> This patch adds KERN_ constants to all of the printk()'s that need them in
> drivers/video/riva/fbdev.c - resent after reworking the debug #defines
> 
> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/riva/fbdev.c linux-2.6.11-rc2-mm1/drivers/video/riva/fbdev.c
> --- linux-2.6.11-rc2-mm1-original/drivers/video/riva/fbdev.c	2005-01-24 17:15:49.000000000 -0500
> +++ linux-2.6.11-rc2-mm1/drivers/video/riva/fbdev.c	2005-01-25 20:49:29.534947199 -0500
> @@ -68,18 +68,17 @@
>   *
>   * ------------------------------------------------------------------------- */
>  #ifdef CONFIG_FB_RIVA_DEBUG
> -#define NVTRACE          printk
> -#else
> -#define NVTRACE          if(0) printk
> +#define DEBUG
>  #endif

DEBUG should be defined before inclusion of kernel.h .


	Domen

--===============32454725629570991==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32454725629570991==--

From: Domen Puncer <domen@coderock.org>
Date: Mon, 21 Feb 2005 20:34:57 +0000
Subject: Re: [KJ] [PATCH 9/53] radeonfb: Clean up printk()'s in
Message-Id: <20050221203457.GA4174@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78870833498470283=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78870833498470283==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 25/01/05 17:09 -0600, James Nelson wrote:
> @@ -28,6 +28,7 @@
>   *
>   */
>  
> +#undef DEBUG
>  
>  #define RADEON_VERSION	"0.1.6"
>  
> @@ -80,12 +81,8 @@
>  #include <video/radeon.h>
>  #include <linux/radeonfb.h>
>  
> -#define DEBUG	1
> -
> -#if DEBUG
> -#define RTRACE		printk
> -#else
> -#define RTRACE		if(0) printk
> +#ifdef DEBUG
> +#define RTRACE		pr_debug
>  #endif
>  
>  // XXX

This produced warning, on !DEBUG RTRACE wasn't defined. Fixed for -kj,
and also restored DEBUG behaviour which you turned off.


	Domen

--===============78870833498470283==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78870833498470283==--

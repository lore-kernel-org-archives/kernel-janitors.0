From: Karsten Keil <kkeil@suse.de>
Date: Fri, 09 Nov 2007 13:06:39 +0000
Subject: Re: [PATCH] isdn - remove dead config symbol from isdn code
Message-Id: <20071109130639.GC32605@pingi.kke.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47344579.10405@gmail.com>
In-Reply-To: <47344579.10405@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 09, 2007 at 12:33:13PM +0100, Jiri Olsa wrote:
> remove dead config symbol from isdn code
> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
> 

Please not. Even if here is not such COBALT_MICRO_SERVER
config symbol this give some hint how to setup I4L
for small systems.

> ---
>  include/linux/isdn.h |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/isdn.h b/include/linux/isdn.h
> index d0ecc8e..a2303b6 100644
> --- a/include/linux/isdn.h
> +++ b/include/linux/isdn.h
> @@ -16,14 +16,8 @@
>  
>  #include <linux/ioctl.h>
>  
> -#ifdef CONFIG_COBALT_MICRO_SERVER
> -/* Save memory */
> -#define ISDN_MAX_DRIVERS    2
> -#define ISDN_MAX_CHANNELS   8
> -#else
>  #define ISDN_MAX_DRIVERS    32
>  #define ISDN_MAX_CHANNELS   64
> -#endif
>  
>  /* New ioctl-codes */
>  #define IIOCNETAIF  _IO('I',1)

-- 
Karsten Keil
SuSE Labs
ISDN and VOIP development
SUSE LINUX Products GmbH, Maxfeldstr.5 90409 Nuernberg, GF: Markus Rex, HRB 16746 (AG Nuernberg)

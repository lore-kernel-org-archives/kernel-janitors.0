From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 23 Mar 2004 18:40:20 +0000
Subject: Re: [Kernel-janitors] [PATCH 2/5] Remove concatenation with
Message-Id: <200403231940.21045.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 22 March 2004 06:35, Tony Breeds wrote:
> @@ -70,8 +70,8 @@ typedef enum {
>  #define TRACE(l, m, i...)						\
>  {									\
>  	if ((ft_trace_t)(l) = FT_TRACE_TOP_LEVEL) {			\
> -		printk(KERN_INFO"ftape"__FILE__"("__FUNCTION__"):\n"	\
> -		       KERN_INFO m".\n" ,##i);				\
> +		printk(KERN_INFO"ftape%s(%s):\n"	                \
> +		       KERN_INFO m".\n" ,__FILE__, __FUNCTION__, ##i);	\

Old gcc versions (gcc-2.95 and earlier) require you to have a space in
front of the ', ##', for obscure reasons. OTOH, you should use normal
spacing rules for all other occurrences of ','.
The correct line should look like:

+		       KERN_INFO m".\n", __FILE__, __FUNCTION__ , ##i);	\

> --- linux-2.6.4.clean/drivers/media/video/w9966.c	2004-03-19 15:52:37.000000000 +1100
> +++ linux-2.6.4.kj_func/drivers/media/video/w9966.c	2004-03-22 11:53:14.000000000 +1100
> @@ -63,7 +63,7 @@
>  //#define DEBUG				// Undef me for production
>  
>  #ifdef DEBUG
> -#define DPRINTF(x, a...) printk(KERN_DEBUG "W9966: "__FUNCTION__ "(): "x, ##a)
> +#define DPRINTF(x, a...) printk(KERN_DEBUG "W9966: %s(): "x, __FUNCTION__, ##a)
>  #else

This was already broken, but you can fix it while you are at it.

Your other patches have more examples similar to these two. I wonder if
we should make broken varargs macros a new janitor item or just fix those
that cause trouble and deprecate gcc-2.x for linux-2.7.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

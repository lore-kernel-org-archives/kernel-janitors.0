From: Domen Puncer <domen@coderock.org>
Date: Sat, 07 Feb 2004 17:41:17 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/wireless/strip.c MIN/MAX
Message-Id: <200402071841.17634.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <402505A9.8060903@gmx.net>
In-Reply-To: <402505A9.8060903@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 07 of February 2004 16:35, Michael Veeck wrote:
> Hi!
> Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes
> calls to use kernel.h macros instead.
> Feedback always welcome
> Michael

Just some suggestions...

> @@ -454,8 +454,6 @@
>  
>  #define READDEC(X) ((X)>='0' && (X)<='9' ? (X)-'0' : 0)
>  
> -#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
> -#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
>  #define ELEMENTS_OF(X) (sizeof(X) / sizeof((X)[0]))

Remove this define and s/ELEMENTS_OF/ARRAY_SIZE/g


> @@ -847,7 +845,7 @@
>  static int allocate_buffers(struct strip *strip_info, int mtu)
>  {
>         struct net_device *dev = strip_info->dev;
> -       int sx_size = MAX(STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
> +       int sx_size = max((int)STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);

max_t?


	Domen

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

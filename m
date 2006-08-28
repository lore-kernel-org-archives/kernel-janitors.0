From: "Benoit Boissinot" <bboissin@gmail.com>
Date: Mon, 28 Aug 2006 16:59:54 +0000
Subject: Re: [KJ] [PATCH] Removed unreachable code and fixed one compiler
Message-Id: <40f323d00608280959y5f4bbb1ai2033931528c8bf9e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156784251.4195.7.camel@localhost.localdomain>
In-Reply-To: <1156784251.4195.7.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 8/28/06, ville palo <ville.palo@vi64pa.net> wrote:
> There were some unreachable code segments in drivers/cdrom.
> This patch removes them and fixes one compiler warning:
> "gscd.c:269: warning: unsigned int format, long unsigned int arg"
>
> Patch is made against 2.6.18-rc5
>
> @@ -1710,11 +1707,7 @@ static int mcdx_tray_move(struct cdrom_d
>         if (!(stuffp->present & DOOR))
>                 return -ENOSYS;
>
> -       if (position)           /* 1: eject */
> -               return mcdx_talk(stuffp, "\xf6", 1, NULL, 1, 5 * HZ, 3);
> -       else                    /* 0: close */
> -               return mcdx_talk(stuffp, "\xf8", 1, NULL, 1, 5 * HZ, 3);
> -       return 1;
> +       return mcdx_talk(stuffp, position ? "\xf6" : "\xf8", 1, NULL, 1, 5 * HZ, 3);
>  }
>
You are removing the comments here, and it is useful information to
understand the code.

regards,

Benoit
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

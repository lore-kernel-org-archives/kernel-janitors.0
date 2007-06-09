From: "Thomas De Schampheleire" <patrickdepinguin@gmail.com>
Date: Sat, 09 Jun 2007 07:27:29 +0000
Subject: Re: [KJ] [PATCH 1/4] 2.6 drivers/net actisys-sir replace SIZE macros
Message-Id: <9d133f60706090027x3803311dsa938992a140c9a8f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070609031308.14624.49208.sendpatchset@localhost.localdomain>
In-Reply-To: <20070609031308.14624.49208.sendpatchset@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2007/6/9, acripps <acripps@gmail.com>:
> this is a simple patch to remove the MAX_SPEEDS macro in favor of the more
> generic ARRAY_SIZE(arr) macro defined in kernel.h
>
> Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>
>
>
> diff --git a/drivers/net/irda/actisys-sir.c b/drivers/net/irda/actisys-sir.c
> index 9715ab5..44bf0c2 100644
> --- a/drivers/net/irda/actisys-sir.c
> +++ b/drivers/net/irda/actisys-sir.c
> @@ -43,7 +43,7 @@
> #include <linux/module.h>
> #include <linux/delay.h>
> #include <linux/init.h>
> -
> +#include <linux/kernel.h>
> #include <net/irda/irda.h>
>

Maybe I'm just picking, but I don't think you should remove the white
line that was put between init.h and irda.h. It seems like the author
wanted to distinguish between the headers of 'linux' and those of the
networking subsystem.

I would therefore suggest placing kernel.h directly below init.h,
leave the white line, and then include irda.h.

Thomas
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

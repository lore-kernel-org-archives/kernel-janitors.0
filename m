From: Benoit Boissinot <bboissin@gmail.com>
Date: Wed, 27 Apr 2005 20:02:25 +0000
Subject: Re: [KJ] cli()/sti()-removal
Message-Id: <40f323d00504271302be268ae@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <IFMF7B$A1BC6FE6642552690BEA67D5E7D8ABF3@tiscali.fr>
In-Reply-To: <IFMF7B$A1BC6FE6642552690BEA67D5E7D8ABF3@tiscali.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/27/05, david.chosrova@libertysurf.fr <david.chosrova@libertysurf.fr> wrote:
> 
> 
> --- linux-2.6.11.7/drivers/net/irda/ep7211_ir.c.orig    2005-04-27 17:41:36.000000000 +0100
> +++ linux-2.6.11.7/drivers/net/irda/ep7211_ir.c 2005-04-27 17:53:33.000000000 +0100
> @@ -14,6 +14,7 @@
> 
>  #include <asm/io.h>
>  #include <asm/hardware.h>
> +#include<asm/spinlock.h>
> 
>  #define MIN_DELAY 25      /* 15 us, but wait a little more to be sure */
>  #define MAX_DELAY 10000   /* 1 ms */
> @@ -22,7 +23,7 @@ static void ep7211_ir_open(dongle_t *sel
>  static void ep7211_ir_close(dongle_t *self);
>  static int  ep7211_ir_change_speed(struct irda_task *task);
>  static int  ep7211_ir_reset(struct irda_task *task);
> -
> +static spinlock_t driver_lock = SPIN_LOCK_UNLOCKED;

spin_lock_init(driver_lock)
(cf TODO)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

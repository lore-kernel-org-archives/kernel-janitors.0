From: Jan Dittmer <jdittmer@ppp0.net>
Date: Sat, 18 Dec 2004 01:21:00 +0000
Subject: [KJ] Re: [PATCH] esp: replace cli()/sti() with
Message-Id: <41C385FC.3010109@ppp0.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217231915.14919.49991.15433@localhost.localdomain>
In-Reply-To: <20041217231915.14919.49991.15433@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

James Nelson wrote:
> This is an attempt to make the esp driver SMP-correct.

You're trying to protect the info data, correct? Could you please
add a comment to the locks which data structures need to be
protected by them?!
Just blindly replacing cli/sti with spin_(un)lock doesn't make it
SMP save.

> diff -urN --exclude='*~' linux-2.6.10-rc3-mm1-original/drivers/char/esp.c linux-2.6.10-rc3-mm1/drivers/char/esp.c
> --- linux-2.6.10-rc3-mm1-original/drivers/char/esp.c	2004-12-03 16:52:13.000000000 -0500
> +++ linux-2.6.10-rc3-mm1/drivers/char/esp.c	2004-12-17 18:11:31.275037730 -0500
> @@ -212,14 +214,14 @@
>  	if (serial_paranoia_check(info, tty->name, "rs_stop"))
>  		return;
>  	
> -	save_flags(flags); cli();
> +	spin_lock_irqsave(&esp_lock, flags);

info can change between return and lock

>  	if (info->IER & UART_IER_THRI) {
>  		info->IER &= ~UART_IER_THRI;
>  		serial_out(info, UART_ESI_CMD1, ESI_SET_SRV_MASK);
>  		serial_out(info, UART_ESI_CMD2, info->IER);
>  	}
>  
> -	restore_flags(flags);
> +	spin_unlock_irqrestore(&esp_lock, flags);
>  }
>  
>  static void rs_start(struct tty_struct *tty)
> @@ -230,13 +232,13 @@
>  	if (serial_paranoia_check(info, tty->name, "rs_start"))
>  		return;
>  	
> -	save_flags(flags); cli();
> +	spin_lock_irqsave(&esp_lock, flags);

same here.

>  	if (info->xmit_cnt && info->xmit_buf && !(info->IER & UART_IER_THRI)) {
>  		info->IER |= UART_IER_THRI;
>  		serial_out(info, UART_ESI_CMD1, ESI_SET_SRV_MASK);
>  		serial_out(info, UART_ESI_CMD2, info->IER);
>  	}
> -	restore_flags(flags);
> +	spin_unlock_irqrestore(&esp_lock, flags);
>  }
>  
>  /*

Didn't read the rest. Are you sure you didn't introduce a deadlock in
the interrupt handler? {transmit,receiver}_chars_{pio,dma} also try to take
the lock.

Jan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

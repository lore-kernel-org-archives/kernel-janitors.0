From: Jan Dittmer <jdittmer@ppp0.net>
Date: Fri, 31 Dec 2004 09:45:30 +0000
Subject: [KJ] Re: [PATCH] esp: Make driver SMP-correct
Message-Id: <41D51FBA.2040002@ppp0.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041231014403.3309.58245.96163@localhost.localdomain>
In-Reply-To: <20041231014403.3309.58245.96163@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

James Nelson wrote:
>  static inline int serial_paranoia_check(struct esp_struct *info,
>  					char *name, const char *routine)
>  {
> @@ -209,34 +197,38 @@
>  	struct esp_struct *info = (struct esp_struct *)tty->driver_data;
>  	unsigned long flags;
>  
> -	if (serial_paranoia_check(info, tty->name, "rs_stop"))
> -		return;
> +	spin_lock_irqsave(&info->irq_lock, flags);
> +
> +	if (unlikely(serial_paranoia_check(info, tty->name, __FUNCTION__)))
> +		goto out;

>  static void rs_start(struct tty_struct *tty)
>  {
>  	struct esp_struct *info = (struct esp_struct *)tty->driver_data;
>  	unsigned long flags;
> -	
> -	if (serial_paranoia_check(info, tty->name, "rs_start"))
> -		return;
> -	
> -	save_flags(flags); cli();
> +
> +	spin_lock_irqsave(&info->irq_lock, flags);
> +
> +	if (unlikely(serial_paranoia_check(info, tty->name, __FUNCTION__)))
> +		goto out;
> +

This will deadlock. serial_paranoia_check also unconditionally tries to
take the lock.

Jan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

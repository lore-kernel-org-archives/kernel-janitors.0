From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Wed, 11 Apr 2007 11:23:07 +0000
Subject: Re: [KJ] [PATCH] HYSDN cards: use spin_lock_init() for spinlock
Message-Id: <b6fcc0a0704110423l2f5e8ee9raaf9a136e7bf07df@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411071951.GJ24898@traven>
In-Reply-To: <20070411071951.GJ24898@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/11/07, Matthias Kaehlcke <matthias.kaehlcke@gmail.com> wrote:
> HYSDN cards: use spin_lock_init() for spinlock initialization

> --- a/drivers/isdn/hysdn/hysdn_proclog.c
> +++ b/drivers/isdn/hysdn/hysdn_proclog.c
> @@ -299,7 +299,8 @@ hysdn_log_close(struct inode *ino, struct file *filep)
>  	hysdn_card *card;
>  	int retval = 0;
>  	unsigned long flags;
> -	spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
> +	spinlock_t hysdn_lock;
> +	spin_lock_init(&hysdn_lock);

Wow! Second spinlock on stack I've seen.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

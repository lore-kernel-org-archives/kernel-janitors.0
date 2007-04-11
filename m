From: "Milind Arun Choudhary" <milindchoudhary@gmail.com>
Date: Wed, 11 Apr 2007 08:19:50 +0000
Subject: Re: [KJ] [PATCH] HYSDN cards: use spin_lock_init() for spinlock
Message-Id: <3b44d3fb0704110107j639728bfna1345b4f92f3373f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411071951.GJ24898@traven>
In-Reply-To: <20070411071951.GJ24898@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/11/07, Matthias Kaehlcke <matthias.kaehlcke@gmail.com> wrote:
> HYSDN cards: use spin_lock_init() for spinlock initialization
>
> Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
> ---
> diff --git a/drivers/isdn/hysdn/hysdn_proclog.c b/drivers/isdn/hysdn/hysdn_proclog.c
> index f7e83a8..168fd56 100644
> --- a/drivers/isdn/hysdn/hysdn_proclog.c
> +++ b/drivers/isdn/hysdn/hysdn_proclog.c
> @@ -299,7 +299,8 @@ hysdn_log_close(struct inode *ino, struct file *filep)
>         hysdn_card *card;
>         int retval = 0;
>         unsigned long flags;
> -       spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
> +       spinlock_t hysdn_lock;
> +       spin_lock_init(&hysdn_lock);

use DEFINE_SPINLOCK() instead,for static/compile time initialization

spin_lock_init() is for runtime

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

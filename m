From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 17 Mar 2011 20:08:20 +0000
Subject: Re: [patch] genirq: incorrect unlock in __setup_irq()
Message-Id: <20110317200820.GF14675@home.goodmis.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110317114307.GJ2008@bicker>
In-Reply-To: <20110317114307.GJ2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2011 at 02:43:07PM +0300, Dan Carpenter wrote:
> goto out_thread is called before we take the lock.  It causes a gcc
> warning: "kernel/irq/manage.c:858: warning: ???flags??? may be used
> uninitialized in this function"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index acd599a..cdcdf13 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1065,9 +1065,9 @@ mismatch:
>  
>  out_mask:
>  	free_cpumask_var(mask);
> +	raw_spin_unlock_irqrestore(&desc->lock, flags);
>  
>  out_thread:
> -	raw_spin_unlock_irqrestore(&desc->lock, flags);

That's more than a warning fix, this is a real bug.

Acked-by: Steven Rostedt <rostedt@goodims.org>

-- Steve

>  	if (new->thread) {
>  		struct task_struct *t = new->thread;
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

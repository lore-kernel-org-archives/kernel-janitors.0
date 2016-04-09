From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 09 Apr 2016 09:01:00 +0000
Subject: Re: [PATCH] ALSA: constify ct_timer_ops structures
Message-Id: <s5hh9fbcg1f.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460190975-16270-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460190975-16270-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 09 Apr 2016 10:36:15 +0200,
Julia Lawall wrote:
> 
> The ct_timer_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.


Takashi

> 
> ---
>  sound/pci/ctxfi/cttimer.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> index a5d4604..8f94534 100644
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -49,7 +49,7 @@ struct ct_timer {
>  	spinlock_t lock;		/* global timer lock (for xfitimer) */
>  	spinlock_t list_lock;		/* lock for instance list */
>  	struct ct_atc *atc;
> -	struct ct_timer_ops *ops;
> +	const struct ct_timer_ops *ops;
>  	struct list_head instance_head;
>  	struct list_head running_head;
>  	unsigned int wc;		/* current wallclock */
> @@ -128,7 +128,7 @@ static void ct_systimer_prepare(struct ct_timer_instance *ti)
>  
>  #define ct_systimer_free	ct_systimer_prepare
>  
> -static struct ct_timer_ops ct_systimer_ops = {
> +static const struct ct_timer_ops ct_systimer_ops = {
>  	.init = ct_systimer_init,
>  	.free_instance = ct_systimer_free,
>  	.prepare = ct_systimer_prepare,
> @@ -322,7 +322,7 @@ static void ct_xfitimer_free_global(struct ct_timer *atimer)
>  	ct_xfitimer_irq_stop(atimer);
>  }
>  
> -static struct ct_timer_ops ct_xfitimer_ops = {
> +static const struct ct_timer_ops ct_xfitimer_ops = {
>  	.prepare = ct_xfitimer_prepare,
>  	.start = ct_xfitimer_start,
>  	.stop = ct_xfitimer_stop,
> 
> 

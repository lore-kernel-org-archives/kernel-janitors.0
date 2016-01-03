From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 Jan 2016 16:41:21 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <56894D2D.1010801@users.sourceforge.net>
In-Reply-To: <56894D2D.1010801@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Christopher Harrer <charrer@alacritech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lior Dotan <liodot@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 3 Jan 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 3 Jan 2016 17:25:59 +0100
> 
> Replace explicit initialisation for two local variables at the beginning
> by assignments.

Why?

julia

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/slicoss/slicoss.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
> index b23a2d1..8fdcac8 100644
> --- a/drivers/staging/slicoss/slicoss.c
> +++ b/drivers/staging/slicoss/slicoss.c
> @@ -2301,9 +2301,9 @@ static int slic_adapter_allocresources(struct adapter *adapter,
>   */
>  static int slic_if_init(struct adapter *adapter, unsigned long *flags)
>  {
> -	struct sliccard *card = adapter->card;
> +	struct sliccard *card;
>  	struct net_device *dev = adapter->netdev;
> -	__iomem struct slic_regs *slic_regs = adapter->slic_regs;
> +	__iomem struct slic_regs *slic_regs;
>  	struct slic_shmem *pshmem;
>  	int rc;
>  
> @@ -2348,6 +2348,7 @@ static int slic_if_init(struct adapter *adapter, unsigned long *flags)
>  		adapter->queues_initialized = 1;
>  	}
>  
> +	slic_regs = adapter->slic_regs;
>  	slic_reg32_write(&slic_regs->slic_icr, ICR_INT_OFF, FLUSH);
>  	mdelay(1);
>  
> @@ -2374,6 +2375,7 @@ static int slic_if_init(struct adapter *adapter, unsigned long *flags)
>  	}
>  
>  	adapter->state = ADAPT_UP;
> +	card = adapter->card;
>  	if (!card->loadtimerset) {
>  		setup_timer(&card->loadtimer, &slic_timer_load_check,
>  			    (ulong)card);
> -- 
> 2.6.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

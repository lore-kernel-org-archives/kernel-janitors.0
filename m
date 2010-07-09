From: Dan Carpenter <error27@gmail.com>
Date: Fri, 09 Jul 2010 16:58:17 +0000
Subject: Re: [PATCH] at1700: fix double free_irq
Message-Id: <20100709165817.GN19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678686-7215-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678686-7215-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Joe Perches <joe@perches.com>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org

On Fri, Jul 09, 2010 at 04:31:26PM +0400, Kulikov Vasiliy wrote:
> free_irq() is called both in net_close() and cleanup_card().  Since it
> is requested in at1700_probe1(), leave free_irq() only in cleanup_card()
> for balance.
> 

Are you sure?  I would think that we should make the free_irq() in
cleanup_card() conditional instead.

> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/net/at1700.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/at1700.c b/drivers/net/at1700.c
> index 93185f5..8987689 100644
> --- a/drivers/net/at1700.c
> +++ b/drivers/net/at1700.c
> @@ -811,10 +811,8 @@ static int net_close(struct net_device *dev)
>  	/* No statistic counters on the chip to update. */
>  
>  	/* Disable the IRQ on boards of fmv18x where it is feasible. */
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It seems like this comment should be updated?

> -	if (lp->jumpered) {
> +	if (lp->jumpered)
>  		outb(0x00, ioaddr + IOCONFIG1);
> -		free_irq(dev->irq, dev);
> -	}

regards,
dan carpenter

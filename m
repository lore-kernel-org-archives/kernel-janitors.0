From: Thomas Meyer <thomas@m3y3r.de>
Date: Wed, 03 Aug 2011 15:54:04 +0000
Subject: Re: [PATCH 8/20] drivers/parport: Use kzalloc
Message-Id: <1312386848.2629.21.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132200410.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132200410.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Donnerstag, den 13.05.2010, 22:01 +0200 schrieb Julia Lawall:

> From: Julia Lawall <julia@diku.dk>
> 
> Use kzalloc rather than the combination of kmalloc and memset.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,size,flags;
> statement S;
> @@
> 
> -x = kmalloc(size,flags);
> +x = kzalloc(size,flags);
>  if (x = NULL) S
> -memset(x, 0, size);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Reviewed-by: Thomas Meyer <thomas@m3y3r.de>

> 
> ---
>  drivers/parport/share.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff -u -p a/drivers/parport/share.c b/drivers/parport/share.c
> --- a/drivers/parport/share.c
> +++ b/drivers/parport/share.c
> @@ -282,14 +282,13 @@ struct parport *parport_register_port(un
>  	int device;
>  	char *name;
>  
> -	tmp = kmalloc(sizeof(struct parport), GFP_KERNEL);
> +	tmp = kzalloc(sizeof(struct parport), GFP_KERNEL);
>  	if (!tmp) {
>  		printk(KERN_WARNING "parport: memory squeeze\n");
>  		return NULL;
>  	}
>  
>  	/* Init our structure */
> - 	memset(tmp, 0, sizeof(struct parport));
>  	tmp->base = base;
>  	tmp->irq = irq;
>  	tmp->dma = dma;




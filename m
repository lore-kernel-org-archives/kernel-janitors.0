From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 04 Oct 2006 02:15:00 +0000
Subject: Re: [KJ] [PATCH] Check kmalloc() return value
Message-Id: <20061003191500.e083d246.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9a8748490609280141p49413782l66fd266aa076a877@mail.gmail.com>
In-Reply-To: <9a8748490609280141p49413782l66fd266aa076a877@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 28 Sep 2006 12:18:35 +0300 Galya Tcharny wrote:

> On 9/28/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> > On 28/09/06, Galya Tcharny <gtcharny@gmail.com> wrote:
> > > Added checks for kmalloc() return value.
> > >
> > The patch also seems to be whitespace damaged somehow. Your lines are
> > not properly indented - at least not the copy my mail client gives me.
> >
> 
> Thanks for your suggestions. Please find below fixed version.
> 
>  drivers/net/au1000_eth.c |    5 ++++-
>  drivers/net/s2io.c       |    3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
> linux-2.6.18-orig/drivers/net/au1000_eth.c
> linux-2.6.18/drivers/net/au1000_eth.c
> --- linux-2.6.18-orig/drivers/net/au1000_eth.c	2006-09-27
> 14:51:31.000000000 +0300
> +++ linux-2.6.18/drivers/net/au1000_eth.c	2006-09-28 12:10:30.000000000 +0300
> @@ -717,7 +717,10 @@ static struct net_device * au1000_probe(
>  	aup->mii_bus.name = "au1000_eth_mii";
>  	aup->mii_bus.id = aup->mac_id;
>  	aup->mii_bus.irq = kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
> -	for(i = 0; i < PHY_MAX_ADDR; ++i)
> +	if (aup->mii_bus.irq = NULL) {
> +		goto err_out;
> +	}
> +	for (i = 0; i < PHY_MAX_ADDR; ++i)
>  		aup->mii_bus.irq[i] = PHY_POLL;
> 
>  	/* if known, set corresponding PHY IRQs */
> diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
> linux-2.6.18-orig/drivers/net/s2io.c linux-2.6.18/drivers/net/s2io.c
> --- linux-2.6.18-orig/drivers/net/s2io.c	2006-09-27 14:51:33.000000000 +0300
> +++ linux-2.6.18/drivers/net/s2io.c	2006-09-28 12:07:54.000000000 +0300
> @@ -624,6 +624,9 @@ static int init_shared_mem(struct s2io_n
>  			rx_blocks->rxds = kmalloc(sizeof(rxd_info_t)*
>  						  rxd_count[nic->rxd_mode],
>  						  GFP_KERNEL);
> +			if (rx_blocks->rxds = NULL) {
> +				return -ENOMEM;
> +			}
>  			for (l=0; l<rxd_count[nic->rxd_mode];l++) {
>  				rx_blocks->rxds[l].virt_addr >  					rx_blocks->block_virt_addr +

Along with Jesper's comments, kernel style is only to use
braces around an if-block when the block is more than one
statement long -- not used when it's only one statement.

Hm, maybe we need to add that to Documentation/CodingStyle.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

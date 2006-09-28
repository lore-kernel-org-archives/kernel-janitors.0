From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 28 Sep 2006 08:41:10 +0000
Subject: Re: [KJ] [PATCH] Check kmalloc() return value
Message-Id: <9a8748490609280141p49413782l66fd266aa076a877@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28/09/06, Galya Tcharny <gtcharny@gmail.com> wrote:
> Added checks for kmalloc() return value.
>
> Signed-off-by: Galya Tcharny <gtcharny@gmail.com>
>
>  drivers/net/au1000_eth.c |    3 +++
>  drivers/net/s2io.c       |    3 +++
>  2 files changed, 6 insertions(+)
>
> diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
> linux-2.6.18-orig/drivers/net/au1000_eth.c
> linux-2.6.18/drivers/net/au1000_eth.c
> --- linux-2.6.18-orig/drivers/net/au1000_eth.c 2006-09-27
> 14:51:31.000000000 +0300
> +++ linux-2.6.18/drivers/net/au1000_eth.c 2006-09-28 09:24:11.000000000 +0300
> @@ -717,6 +717,9 @@ static struct net_device * au1000_probe(
>   aup->mii_bus.name = "au1000_eth_mii";
>   aup->mii_bus.id = aup->mac_id;
>   aup->mii_bus.irq = kmalloc(sizeof(int)*PHY_MAX_ADDR, GFP_KERNEL);
> + if(aup->mii_bus.irq = NULL) {

Missing space after "if":
   if (aup->mii_bus.irq = NULL) {


> +  goto err_out;
> + }
>   for(i = 0; i < PHY_MAX_ADDR; ++i)

While you are there you might consider adding the missing space in
that "for" loop as well :
   for (i = 0; i < PHY_MAX_ADDR; ++i)



>    aup->mii_bus.irq[i] = PHY_POLL;
>
> diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff
> linux-2.6.18-orig/drivers/net/s2io.c linux-2.6.18/drivers/net/s2io.c
> --- linux-2.6.18-orig/drivers/net/s2io.c 2006-09-27 14:51:33.000000000 +0300
> +++ linux-2.6.18/drivers/net/s2io.c 2006-09-28 09:26:32.000000000 +0300
> @@ -624,6 +624,9 @@ static int init_shared_mem(struct s2io_n
>     rx_blocks->rxds = kmalloc(sizeof(rxd_info_t)*
>          rxd_count[nic->rxd_mode],
>          GFP_KERNEL);
> +   if(rx_blocks->rxds = NULL) {

Missing space :
   if (rx_blocks->rxds = NULL) {

> +    return -ENOMEM;
> +   }
>     for (l=0; l<rxd_count[nic->rxd_mode];l++) {
>      rx_blocks->rxds[l].virt_addr >       rx_blocks->block_virt_addr +


The patch also seems to be whitespace damaged somehow. Your lines are
not properly indented - at least not the copy my mail client gives me.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

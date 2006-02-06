From: walter harms <wharms@bfs.de>
Date: Mon, 06 Feb 2006 08:40:06 +0000
Subject: [KJ] Re: cassini compwb fixup
Message-Id: <43E70B66.9060408@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
this is a problem that only the author can resolve.
perhaps this is used in some embedded system or so.
I would advise to fix the obvious problem before removing
since this may break an otherwise working driver.

re,
  walter


Alexey Dobriyan wrote:
>> drivers/net/cassini.c: fix undefined variable
>>
>> We had a discussion about %L vs %ll in cassini but we agreed that you
>> will change %L into %ll so perhaps that went an other way.
> 
> Warnings were fixed since then. I wonder if driver is used with
> USE_TX_COMPWB undefined. If not #ifdefs should be removed. Also we may
> stop printing after status and not print 0 at all.
> 
> --- a/drivers/net/cassini.c
> +++ b/drivers/net/cassini.c
> @@ -1946,10 +1946,11 @@ static inline void cas_tx_ringN(struct c
>  static void cas_tx(struct net_device *dev, struct cas *cp,
>  		   u32 status)
>  {
>          int limit, ring;
> +	u64 compwb = 0;
>  #ifdef USE_TX_COMPWB
> -	u64 compwb = le64_to_cpu(cp->init_block->tx_compwb);
> +	compwb = le64_to_cpu(cp->init_block->tx_compwb);
>  #endif
>  	if (netif_msg_intr(cp))
>  		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %llx\n",
>  			cp->dev->name, status, (unsigned long long)compwb);
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

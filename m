From: Matthew Wilcox <willy@debian.org>
Date: Sat, 03 Jan 2004 22:37:36 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return value in net/ipv4/ipmr.c
Message-Id: <20040103223736.GQ6982@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 03, 2004 at 09:31:16PM +0800, Eugene Teo wrote:
> http://www.anomalistic.org/patches/ipmr-check-ret-alloc_netdev-fix-2.6.1-rc1-mm1.patch
> 
> diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/net/ipv4/ipmr.c 2.6.1-rc1-mm1-fix/net/ipv4/ipmr.c
> --- 2.6.1-rc1-mm1/net/ipv4/ipmr.c	2003-12-18 10:58:49.000000000 +0800
> +++ 2.6.1-rc1-mm1-fix/net/ipv4/ipmr.c	2004-01-03 20:43:14.000000000 +0800
> @@ -25,6 +25,7 @@
>   *      Carlos Picoto           :       PIMv1 Support
>   *	Pavlin Ivanov Radoslavov:	PIMv2 Registers must checksum only PIM header
>   *					Relax this requrement to work with older peers.
> + *	Eugene Teo		:	Check the return value of alloc_netdev.		
>   *
>   */
>  
> @@ -205,6 +206,9 @@
>  	dev = alloc_netdev(sizeof(struct net_device_stats), "pimreg",
>  			   reg_vif_setup);
>  
> +	if (!dev)
> +		return NULL;
> +
>  	if (register_netdevice(dev)) {
>  		kfree(dev);
>  		return NULL;

Looks good, but I'd hold off on network drivers till viro's alloc_netdev()
150-patches have gone in.

Again, adding your name to the file isn't really necessary.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

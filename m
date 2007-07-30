From: Jeff Garzik <jeff@garzik.org>
Date: Mon, 30 Jul 2007 20:03:01 +0000
Subject: Re: [PATCH] dev->priv to netdev_priv(dev), drivers/net/tokenring/
Message-Id: <46AE43F5.8070802@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r6mzmf6q.fsf@wanadoo.fr>
In-Reply-To: <87r6mzmf6q.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Yoann Padioleau wrote:
> Replacing accesses to dev->priv to netdev_priv(dev). The replacment
> is safe when netdev_priv is used to access a private structure that is
> right next to the net_device structure in memory. 
> Cf http://groups.google.com/group/comp.os.linux.development.system/browse_thread/thread/de19321bcd94dbb8/0d74a4adcd6177bd
> This is the case when the net_device structure was allocated with
> a call to alloc_netdev or one of its derivative.
> 
> Here is an excerpt of the semantic patch that performs the transformation
> 
> @ rule1 @
> type T;
> struct net_device *dev;
> @@
> 
>  dev = 
> (
>         alloc_netdev
> | 
>         alloc_etherdev
> |
>         alloc_trdev
> )
>    (sizeof(T), ...)
> 
> @ rule1bis @
> struct net_device *dev;
> expression E;
> @@
>  dev->priv = E
> 
> @ rule2 depends on rule1 && !rule1bis  @
> struct net_device *dev;
> type rule1.T;
> @@
> 
> - (T*) dev->priv
> + netdev_priv(dev)
> 
> 
> PS: I have performed the same transformation on the whole kernel
> and it affects around 70 files, most of them in drivers/net/.
> Should I split my patch for each subnet directories ? (wireless/, wan/, etc)

applied.  splitting up by sub-directory would be helpful.



From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jun 2012 12:53:06 +0000
Subject: Re: [patch] net/ethernet: ks8851_mll unregister_netdev() before freeing
Message-Id: <20120608125306.GN4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120606063129.GA26829@elgon.mountain>
 <20120607.131544.346298142594197233.davem@davemloft.net>
In-Reply-To: <20120607.131544.346298142594197233.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: raffaele.recalcati@bticino.it, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2012 at 01:15:44PM -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Wed, 6 Jun 2012 09:31:29 +0300
> 
> > We added another error condition here, but if we were to hit it then
> > we need to unregister_netdev() before doing the free_netdev().
> > Otherwise we would hit the BUG_ON() in free_netdev():
> > 
> > 	BUG_ON(dev->reg_state != NETREG_UNREGISTERED);
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied, but please be explicit that your patch is against one
> tree or another.  This one was for net-next only, but I tried
> initially to apply it to net which failed.

Sorry about that.  Will be more careful in the future.

regards,
dan carpenter


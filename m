From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:45:57 +0000
Subject: Re: [patch 1/2] caif: remove unneeded variable from caif_net_open()
Message-Id: <20100601074557.GJ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070855.GD5483@bicker> <4C04B646.9080506@bfs.de>
In-Reply-To: <4C04B646.9080506@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2010 at 09:27:02AM +0200, walter harms wrote:
> >  static int caif_net_open(struct net_device *dev)
> >  {
> > -	struct ser_device *ser;
> > -	ser = netdev_priv(dev);
> >  	netif_wake_queue(dev);
> >  	return 0;
> >  }
> 
> 
> what makes caif_net_open() obsolet ?
> 

No.  It has to return an int to match this:
        int                     (*ndo_open)(struct net_device *dev);

regards,
dan carpenter

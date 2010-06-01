From: walter harms <wharms@bfs.de>
Date: Tue, 01 Jun 2010 07:27:02 +0000
Subject: Re: [patch 1/2] caif: remove unneeded variable from caif_net_open()
Message-Id: <4C04B646.9080506@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070855.GD5483@bicker>
In-Reply-To: <20100601070855.GD5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org



Dan Carpenter schrieb:
> We don't use the "ser" variable so I've removed it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
> index 09257ca..f30a6a0 100644
> --- a/drivers/net/caif/caif_serial.c
> +++ b/drivers/net/caif/caif_serial.c
> @@ -410,8 +410,6 @@ static void caifdev_setup(struct net_device *dev)
>  
>  static int caif_net_open(struct net_device *dev)
>  {
> -	struct ser_device *ser;
> -	ser = netdev_priv(dev);
>  	netif_wake_queue(dev);
>  	return 0;
>  }


what makes caif_net_open() obsolet ?

re,
 wh


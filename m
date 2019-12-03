From: walter harms <wharms@bfs.de>
Date: Tue, 03 Dec 2019 13:42:23 +0000
Subject: Re: [PATCH net] net: fix a leak in register_netdevice()
Message-Id: <5DE6663F.40803@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203130011.wzzwdi5sebevkenj@kili.mountain>
In-Reply-To: <20191203130011.wzzwdi5sebevkenj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Petr Machata <petrm@mellanox.com>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Taehee Yoo <ap420073@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, Alexander Lobakin <alobakin@dlink.ru>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 03.12.2019 14:00, schrieb Dan Carpenter:
> We have to free "dev->name_node" on this error path.
> 
> Fixes: ff92741270bf ("net: introduce name_node struct to be used in hashlist")
> Reported-by: syzbot+6e13e65ffbaa33757bcb@syzkaller.appspotmail.com
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/core/dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/net/core/dev.c b/net/core/dev.c
> index d75fd04d4e2c..9cc4b193d8c4 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -9246,7 +9246,7 @@ int register_netdevice(struct net_device *dev)
>  		if (ret) {
>  			if (ret > 0)
>  				ret = -EIO;
> -			goto out;
> +			goto err_free_name;
>  		}
>  	}
>  
> @@ -9361,12 +9361,13 @@ int register_netdevice(struct net_device *dev)
>  	return ret;
>  
>  err_uninit:
> -	if (dev->name_node)
> -		netdev_name_node_free(dev->name_node);
>  	if (dev->netdev_ops->ndo_uninit)
>  		dev->netdev_ops->ndo_uninit(dev);
>  	if (dev->priv_destructor)
>  		dev->priv_destructor(dev);
> +err_free_name:
> +	if (dev->name_node)
> +		netdev_name_node_free(dev->name_node);
>  	goto out;
>  }
>  EXPORT_SYMBOL(register_netdevice);

nitpick:
netdev_name_node_free() is a wrapper for kfree().
no need to check dev->name_node.

jm2c

re,
 wh

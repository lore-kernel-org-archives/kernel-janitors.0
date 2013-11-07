From: Alexander Aring <alex.aring@gmail.com>
Date: Thu, 07 Nov 2013 08:17:13 +0000
Subject: Re: [Linux-zigbee-devel] [patch] 6lowpan: release device on error path
Message-Id: <20131107081712.GA1035@x61s.campuswlan.hs-rm.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107074445.GD21844@elgon.mountain>
In-Reply-To: <20131107074445.GD21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>, Alan Ott <alan@signal11.us>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net

On Thu, Nov 07, 2013 at 10:44:45AM +0300, Dan Carpenter wrote:
> We recently added a new error path and it needs a dev_put().
> 
> Fixes: 7adac1ec8198 ('6lowpan: Only make 6lowpan links to IEEE802154 devices')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Compile tested only.  Please review carefully.
> 
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index 9497c6f..426b5df 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -1358,8 +1358,10 @@ static int lowpan_newlink(struct net *src_net, struct net_device *dev,
>  	real_dev = dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
>  	if (!real_dev)
>  		return -ENODEV;
> -	if (real_dev->type != ARPHRD_IEEE802154)
> +	if (real_dev->type != ARPHRD_IEEE802154) {
> +		dev_put(real_dev);
>  		return -EINVAL;
> +	}
looks correct for me.

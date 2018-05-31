From: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
Date: Thu, 31 May 2018 17:26:41 +0000
Subject: Re: [PATCH 2/2 net-next] net_failover: fix error code in net_failover_create()
Message-Id: <b11cf2ca-e230-057c-77c2-4d02efb672b6@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531120425.tqwhhfxqawjuvtws@kili.mountain>
In-Reply-To: <20180531120425.tqwhhfxqawjuvtws@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 5/31/2018 5:04 AM, Dan Carpenter wrote:
> We forgot to set the error code on this path.  This function is supposed
> to return error pointers, so with this bug it accidentally returns NULL
> and the caller doesn't check for that.
>
> Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sridhar Samudrala <sridhar.samudrala@intel.com>

>
> diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
> index ef50158e90a9..881f3fa13e6b 100644
> --- a/drivers/net/net_failover.c
> +++ b/drivers/net/net_failover.c
> @@ -761,8 +761,10 @@ struct failover *net_failover_create(struct net_device *standby_dev)
>   	netif_carrier_off(failover_dev);
>   
>   	failover = failover_register(failover_dev, &net_failover_ops);
> -	if (IS_ERR(failover))
> +	if (IS_ERR(failover)) {
> +		err = PTR_ERR(failover);
>   		goto err_failover_register;
> +	}
>   
>   	return failover;
>   


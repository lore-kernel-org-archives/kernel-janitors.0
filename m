From: David Miller <davem@davemloft.net>
Date: Mon, 04 Jun 2018 13:31:47 +0000
Subject: Re: [PATCH 1/2 net-next] net_failover: fix net_failover_compute_features()
Message-Id: <20180604.093147.1707102168081704551.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531120124.pc4txiifxnrslbei@kili.mountain>
In-Reply-To: <20180531120124.pc4txiifxnrslbei@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sridhar.samudrala@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 15:01:25 +0300

> @@ -380,7 +380,8 @@ static rx_handler_result_t net_failover_handle_frame(struct sk_buff **pskb)
>  
>  static void net_failover_compute_features(struct net_device *dev)
>  {
> -	u32 vlan_features = FAILOVER_VLAN_FEATURES & NETIF_F_ALL_FOR_ALL;
> +	netdev_features_t vlan_features = FAILOVER_VLAN_FEATURES |
> +					  NETIF_F_ALL_FOR_ALL;

The type does need to be corrected to netdev_features_t, but the
logical operation is correct.

It's a policy operation that was simply by-hand propagated all
over the place where these kinds of calculations are performed.

So vlan_features is starting with a value of 0 intentionally.

From: David Miller <davem@davemloft.net>
Date: Mon, 04 Jun 2018 21:30:53 +0000
Subject: Re: [PATCH 1/2 v2 net-next] net_failover: Use netdev_features_t instead of u32
Message-Id: <20180604.173053.1467861125387241500.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604.093147.1707102168081704551.davem@davemloft.net>
        <20180604144321.kjemxdfhi4qqb5ji@kili.mountain>
In-Reply-To: <20180604144321.kjemxdfhi4qqb5ji@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sridhar.samudrala@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 4 Jun 2018 17:43:21 +0300

> The features mask needs to be a netdev_features_t (u64) because a u32
> is not big enough.
> 
> Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: In the original patch, I thought that the & should be | and I
>     introduced a bug.

Applied.

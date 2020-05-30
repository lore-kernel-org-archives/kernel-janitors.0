From: David Miller <davem@davemloft.net>
Date: Sat, 30 May 2020 00:15:21 +0000
Subject: Re: [PATCH][net-next] nexthop: fix incorrect allocation failure on nhg->spare
Message-Id: <20200529.171521.699478164991447623.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528145114.420100-1-colin.king@canonical.com>
In-Reply-To: <20200528145114.420100-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dsahern@kernel.org, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 28 May 2020 15:51:14 +0100

> @@ -1185,7 +1185,7 @@ static struct nexthop *nexthop_create_group(struct net *net,
>  
>  	/* spare group used for removals */
>  	nhg->spare = nexthop_grp_alloc(num_nh);

I don't even see this line in the current net-next tree nor any references
to ->spare.

What am I missing?

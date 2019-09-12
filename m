From: David Miller <davem@davemloft.net>
Date: Thu, 12 Sep 2019 10:21:40 +0000
Subject: Re: [PATCH] ipv6: Fix the link time qualifier of 'ping_v6_proc_exit_net()'
Message-Id: <20190912.122140.1024775651317943407.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190910112959.9222-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190910112959.9222-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 10 Sep 2019 13:29:59 +0200

> The '.exit' functions from 'pernet_operations' structure should be marked
> as __net_exit, not __net_init.
> 
> Fixes: d862e5461423 ("net: ipv6: Implement /proc/net/icmp6.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Untested, but using __net_exit looks consistent with other
> pernet_operations.exit use case.

Looks good, applied.

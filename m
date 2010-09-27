From: David Miller <davem@davemloft.net>
Date: Mon, 27 Sep 2010 01:55:29 +0000
Subject: Re: [PATCH 3/9] sgiseeq: use free_netdev(netdev) instead of kfree()
Message-Id: <20100926.185529.200365761.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285495086-21956-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285495086-21956-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, eric.dumazet@gmail.com, u.kleine-koenig@pengutronix.de, julia@diku.dk, tj@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 13:58:06 +0400

> Freeing netdev without free_netdev() leads to net, tx leaks.
> I might lead to dereferencing freed pointer.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> @@
> struct net_device* dev;
> @@
> 
> -kfree(dev)
> +free_netdev(dev)

Applied.

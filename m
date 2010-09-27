From: David Miller <davem@davemloft.net>
Date: Mon, 27 Sep 2010 01:54:57 +0000
Subject: Re: [PATCH 1/9] ibm_newemac: use free_netdev(netdev) instead of
Message-Id: <20100926.185457.242128057.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285495080-21857-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285495080-21857-1-git-send-email-segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jpirko-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 13:58:00 +0400

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

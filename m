From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:22:06 +0000
Subject: Re: [PATCH 08/43] drivers/net/ppp*.c: fix sparse warnings: fix
Message-Id: <20090217.172206.07506142.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211346.23489.96321.stgit@vmbox.hanneseder.net>
	<20090214212948.GE7648@localhost>
In-Reply-To: <20090214212948.GE7648@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gorcunov@gmail.com
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Sun, 15 Feb 2009 00:29:48 +0300

> [Hannes Eder - Sat, Feb 14, 2009 at 10:13:52PM +0100]
> | Fix this sparse warnings:
> |   drivers/net/ppp_generic.c:919:43: warning: incorrect type in argument 1 (different signedness)
> |   drivers/net/pppoe.c:1195:43: warning: incorrect type in argument 1 (different signedness)
> |   drivers/net/pppol2tp.c:2666:43: warning: incorrect type in argument 1 (different signedness)
> | 
> | Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ...
> 
> Thanks Hannes,
> 
> Acked-by: Cyrill Gorcunov <gorcunov@openvz.org>

Applied.

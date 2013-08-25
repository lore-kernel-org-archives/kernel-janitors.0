From: David Miller <davem@davemloft.net>
Date: Sun, 25 Aug 2013 22:40:19 +0000
Subject: Re: [patch -next] ipip: potential race in ip_tunnel_init_net()
Message-Id: <20130825.184019.2151038981865894784.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130820.233301.985050199020241179.davem@davemloft.net>
	<20130823081537.GB31293@elgon.mountain>
In-Reply-To: <20130823081537.GB31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, eric.dumazet@gmail.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 11:15:37 +0300

> Eric Dumazet says that my previous fix for an ERR_PTR dereference
> (ea857f28ab 'ipip: dereferencing an ERR_PTR in ip_tunnel_init_net()')
> could be racy and suggests the following fix instead.
> 
> Reported-by: Eric Dumazet <eric.dumazet@gmail.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.

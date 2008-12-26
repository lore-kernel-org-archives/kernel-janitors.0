From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 26 Dec 2008 19:59:21 +0000
Subject: Re: [PATCH 03/27] drivers/net: fix sparse warning: returning
Message-Id: <20081226115921.bb094c58.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191517.11807.20718.stgit@vmbox.hanneseder.net>
	<20081225.161740.10052019.davem@davemloft.net>
In-Reply-To: <20081225.161740.10052019.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 25 Dec 2008 16:17:40 -0800 (PST)
David Miller <davem@davemloft.net> wrote:

> From: Hannes Eder <hannes@hanneseder.net>
> Date: Mon, 22 Dec 2008 20:15:17 +0100
> 
> > Fix this sparse warning:
> > 
> >   drivers/net/niu.c:8850:2: warning: returning void-valued expression
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> 
> Can we just fix sparse not to generate this warning?  It's
> marginal, at best.  C++ even explicitly defines this as valid
> and last time I brought this up Linus even agreed.

Ack, I discussed it with him also and he thought that
they were just fine as they were...

> The types match, the function returns void and it is returning a void,
> what is the problem?


-- 
~Randy

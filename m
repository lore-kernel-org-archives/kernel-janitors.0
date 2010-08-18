From: David Miller <davem@davemloft.net>
Date: Wed, 18 Aug 2010 21:27:38 +0000
Subject: Re: [patch] net/sched: remove unneeded NULL check
Message-Id: <20100818.142738.48517986.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814210949.GB645@bicker>
In-Reply-To: <20100814210949.GB645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: hadi@cyberus.ca, kaber@trash.net, jarkao2@gmail.com, eric.dumazet@gmail.com, shemminger@vyatta.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 14 Aug 2010 23:09:49 +0200

> There is no need to check "s".  nla_data() doesn't return NULL.  Also we
> already dereferenced "s" at this point so it would have oopsed ealier if
> it were NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.

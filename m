From: David Miller <davem@davemloft.net>
Date: Fri, 28 Nov 2008 11:07:07 +0000
Subject: Re: [PATCH] pkt_sched: fix sparse warning
Message-Id: <20081128.030707.31836881.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <492fbbfd.190c660a.1db3.fffffcc3@mx.google.com>
In-Reply-To: <492fbbfd.190c660a.1db3.fffffcc3@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 27 Nov 2008 20:33:17 +0100

> Impact: make global function static
> 
> Fix the following sparse warning:
> 
>   net/sched/sch_api.c:192:14: warning: symbol 'qdisc_match_from_root' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied, thanks Hannes.

From: David Miller <davem@davemloft.net>
Date: Sun, 23 Mar 2008 01:04:30 +0000
Subject: Re: [PATCH 3/7] net/ipv6/ndisc.c: remove unused variable
Message-Id: <20080322.180430.22999528.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803151702580.24178@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803151702580.24178@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: pekkas@netcore.fi, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 Mar 2008 17:03:20 +0100 (CET)

> The variable hlen is initialized but never used otherwise.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.

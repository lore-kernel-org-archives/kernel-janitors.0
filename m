From: David Miller <davem@davemloft.net>
Date: Sun, 23 Mar 2008 01:05:52 +0000
Subject: Re: [PATCH 2/7] net/9p/trans_fd.c: remove unused variable
Message-Id: <20080322.180552.238705480.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803151702380.24178@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803151702380.24178@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 Mar 2008 17:02:58 +0100 (CET)

> The variable cb is initialized but never used otherwise.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.

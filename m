From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jul 2009 18:39:57 +0000
Subject: Re: [PATCH 1/12] drivers/atm: Correct redundant test
Message-Id: <20090727.113957.63290485.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907271812130.2682@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907271812130.2682@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 18:12:34 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> str has already been tested.  It seems that this test should be on the
> recently returned value snr.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://www.emn.fr/x-info/coccinelle/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, but as per the MAINTAINERS entry, please CC: ATM patches
to netdev@vger.kernel.org, thanks:

ATM
P:	Chas Williams
M:	chas@cmf.nrl.navy.mil
L:	linux-atm-general@lists.sourceforge.net (subscribers-only)
L:	netdev@vger.kernel.org
W:	http://linux-atm.sourceforge.net
S:	Maintained
F:	drivers/atm/
F:	include/linux/atm*

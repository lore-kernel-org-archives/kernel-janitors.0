From: David Miller <davem@davemloft.net>
Date: Tue, 01 Jun 2010 08:28:24 +0000
Subject: Re: [PATCH 2/2] drivers/isdn/hardware/mISDN: Use GFP_ATOMIC when a
Message-Id: <20100601.012824.186321680.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005301549230.15938@ask.diku.dk>
	<20100601080535.GA19288@gw.linux-pingi.de>
In-Reply-To: <20100601080535.GA19288@gw.linux-pingi.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: isdn@linux-pingi.de
Cc: julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Karsten Keil <isdn@linux-pingi.de>
Date: Tue, 1 Jun 2010 10:05:35 +0200

> thanks for that report, the issue is valid, but I think the fix in that case
> should be to move the allocation to an other place, to avoid wasting of
> GFP_ATOMIC allocation. I will come up with an other fix.

You'll have to write your patch relative to Julia'a s ince it's already
in my net-2.6 tree, since it's a bug fix.

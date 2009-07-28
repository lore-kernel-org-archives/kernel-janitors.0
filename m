From: David Miller <davem@davemloft.net>
Date: Tue, 28 Jul 2009 18:33:53 +0000
Subject: Re: [PATCH] MAINTAINERS: Add networking wireless drivers section
Message-Id: <20090728.113353.08715297.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281753540.28189@ask.diku.dk>
	<20090728.103044.179053537.davem@davemloft.net>
	<1248804397.18284.5.camel@Joe-Laptop.home>
In-Reply-To: <1248804397.18284.5.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: linville@tuxdriver.com, julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

From: Joe Perches <joe@perches.com>
Date: Tue, 28 Jul 2009 11:06:37 -0700

> On Tue, 2009-07-28 at 10:30 -0700, David Miller wrote:
>> Wireless patches need to be CC:'d to linux-wireless so that
>> John Linville can notice and pick them up
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Why not just create a plain "WIRELESS" umbrella entry
that contains all of drivers/net/wireless, net/mac80211,
and net/wireless?

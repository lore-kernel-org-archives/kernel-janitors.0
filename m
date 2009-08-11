From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 11 Aug 2009 13:55:46 +0000
Subject: Re: [PATCH] MAINTAINERS: Add networking wireless drivers section
Message-Id: <alpine.LRH.2.00.0908111555410.11142@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281753540.28189@ask.diku.dk>  <20090728.103044.179053537.davem@davemloft.net>  <1248804397.18284.5.camel@Joe-Laptop.home>  <20090728.113353.08715297.davem@davemloft.net> <1248806896.18284.14.camel@Joe-Laptop.home>
In-Reply-To: <1248806896.18284.14.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, linville@tuxdriver.com, julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

On Tue, 28 Jul 2009, Joe Perches wrote:

> > Why not just create a plain "WIRELESS" umbrella entry that contains 
> > all of drivers/net/wireless, net/mac80211, and net/wireless?
> Whatever works for John I suppose. John, do you have a preference?
> I was trying to avoid the "S: Maintained" label
> and was copying the form of this section:
> 
> NETWORKING DRIVERS
> L:	netdev@vger.kernel.org
> W:	http://www.linuxfoundation.org/en/Net
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6.git
> S:	Odd Fixes
> F:	drivers/net/

Just out of curiosity, why is drivers/net marked as "Odd fixes" and not 
"Maintained"?

-- 
Jiri Kosina
SUSE Labs


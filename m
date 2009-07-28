From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 28 Jul 2009 18:15:52 +0000
Subject: Re: [PATCH] MAINTAINERS: Add networking wireless drivers section
Message-Id: <20090728111552.528a2c9a.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281753540.28189@ask.diku.dk>
	<20090728.103044.179053537.davem@davemloft.net>
	<1248804397.18284.5.camel@Joe-Laptop.home>
In-Reply-To: <1248804397.18284.5.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

On Tue, 28 Jul 2009 11:06:37 -0700 Joe Perches wrote:

> On Tue, 2009-07-28 at 10:30 -0700, David Miller wrote:
> > Wireless patches need to be CC:'d to linux-wireless so that
> > John Linville can notice and pick them up
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebc2691..0574aad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4186,6 +4186,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6.git
>  S:	Odd Fixes
>  F:	drivers/net/
>  
> +NETWORKING WIRELESS DRIVERS
> +L:	linux-wireless@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-2.6.git
> +S:	Odd Fixes
> +F:	drivers/net/wireless/
> +

Already have this:

NETWORKING [WIRELESS]
P:	John W. Linville
M:	linville@tuxdriver.com
L:	linux-wireless@vger.kernel.org
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-2.6.git
S:	Maintained
F:	net/wireless/
F:	include/net/ieee80211*
F:	include/linux/wireless.h


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/

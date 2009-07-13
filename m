From: David Miller <davem@davemloft.net>
Date: Mon, 13 Jul 2009 03:26:10 +0000
Subject: Re: [PATCH] drivers/net/bonding: Adjust constant name
Message-Id: <20090712.202610.254288767.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907111006090.29592@ask.diku.dk>
	<9220.1247342635@death.nxdomain.ibm.com>
In-Reply-To: <9220.1247342635@death.nxdomain.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fubar@us.ibm.com
Cc: julia@diku.dk, bonding-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Jay Vosburgh <fubar@us.ibm.com>
Date: Sat, 11 Jul 2009 13:03:55 -0700

> 
> From: Julia Lawall <julia@diku.dk>
> 
> AD_SHORT_TIMEOUT and AD_STATE_LACP_ACTIVITY have the same value, but
> AD_STATE_LACP_ACTIVITY better reflects the intended semantics.
> 
> [ J adds: AD_STATE_LACP_ACTIVITY is a value defined by the standard, and
> should be set here in accordance with 802.3ad 43.4.12; AD_SHORT_TIMEOUT
> is a constant specific to the Linux 802.3ad implementation that happens
> to have the same value ]
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> struct port_params p;
> @@
> * p.port_state |= AD_SHORT_TIMEOUT
> // </smpl>
> 
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> Signed-off-by: Jay Vosburgh <fubar@us.ibm.com>

Applied.

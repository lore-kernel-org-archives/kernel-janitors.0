From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 10 Mar 2018 19:17:44 +0000
Subject: Re: [PATCH 0/2] net/usb/ax88179_178a: Adjustments for ax88179_chk_eee()
Message-Id: <20180310191744.GN27783@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b92bebdb-c1dc-a9d3-2e3a-845d8dc4998f@users.sourceforge.net>
In-Reply-To: <b92bebdb-c1dc-a9d3-2e3a-845d8dc4998f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Mar 10, 2018 at 07:22:55PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Mar 2018 19:05:45 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.

Hi Markus

How about re-writing this driver to use phylib. The whole of
ax88179_chk_eee() would then go away, since it is a duplication of
phy_init_eee().

	Andrew

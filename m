From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 13 Mar 2018 10:26:57 +0000
Subject: Re: [2/2] net/usb/ax88179_178a: Delete three unnecessary variables in ax88179_chk_eee()
Message-Id: <1520936817.5879.2.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d45bd0c-5ab2-a2c0-d746-ef2d859eea08@users.sourceforge.net>
In-Reply-To: <7d45bd0c-5ab2-a2c0-d746-ef2d859eea08@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Andrew Lunn <andrew@lunn.ch>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Yuval Shaia <yuval.shaia@oracle.com>, "Andrew F. Davis" <afd@ti.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Dienstag, den 13.03.2018, 08:24 +0100 schrieb SF Markus Elfring:
> > 
> > > 
> > > Use three values directly for a condition check without assigning them
> > > to intermediate variables.
> > 
> > Hi,
> > 
> > what is the benefit of this?
> 
> I proposed a small source code reduction.
> 
> Other software design directions might become more interesting for this use case.

Yes and doing so you killed three meaningful names that tell
us what these checks actually test for. That is not an improvement.

	Regards
		Oliver


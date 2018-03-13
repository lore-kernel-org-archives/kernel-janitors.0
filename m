From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Mar 2018 07:24:31 +0000
Subject: Re: [2/2] net/usb/ax88179_178a: Delete three unnecessary variables in ax88179_chk_eee()
Message-Id: <7d45bd0c-5ab2-a2c0-d746-ef2d859eea08@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Andrew F. Davis" <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>

>> Use three values directly for a condition check without assigning them
>> to intermediate variables.
> 
> Hi,
> 
> what is the benefit of this?

I proposed a small source code reduction.

Other software design directions might become more interesting for this use case.

Regards,
Markus

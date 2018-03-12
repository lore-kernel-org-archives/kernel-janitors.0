From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 12 Mar 2018 10:03:58 +0000
Subject: Re: [PATCH 2/2] net/usb/ax88179_178a: Delete three unnecessary variables in ax88179_chk_eee()
Message-Id: <1520849038.29340.3.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <019cc24b-d9c0-d782-35e8-f9f8be0534db@users.sourceforge.net>
In-Reply-To: <019cc24b-d9c0-d782-35e8-f9f8be0534db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Yuval Shaia <yuval.shaia@oracle.com>, "Andrew F. Davis" <afd@ti.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Samstag, den 10.03.2018, 19:26 +0100 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Mar 2018 18:53:28 +0100
> 
> Use three values directly for a condition check without assigning them
> to intermediate variables.

Hi,

what is the benefit of this? It looks like needless code churn to me.

	Regards
		Oliver


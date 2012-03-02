From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 02 Mar 2012 17:57:06 +0000
Subject: Re: [PATCH] Bluetooth: Silence static checker warning.
Message-Id: <1330711026.3392.126.camel@aeonflux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330537602.3392.101.camel@aeonflux>
	 <AE90C24D6B3A694183C094C60CF0A2F6026B6E88@saturn3.aculab.com>
	 <20120302110420.GH22598@mwanda>
In-Reply-To: <20120302110420.GH22598@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Laight <David.Laight@ACULAB.COM>, santosh nayak <santoshprasadnayak@gmail.com>, padovan@profusion.mobi, davem@davemloft.net, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ville Tervo <ville.tervo@nokia.com>

Hi Dan,

> > How long has this code been in tree?
> > It isn't obvious to me that this change won't break code on BE systems
> > where the application code is already fixing the endianness.
> > 
> 
> It looks like we've had an endian bug since last February.
> 
> b62f328b8f20a "Bluetooth: Add server socket support for LE
> connection"
> 
> +               l2cap_pi(sk)->scid = la.l2_cid;
> 
> ->scid was cpu endian.

this is a bug. No questions asked.

However you can only exercise this code if you work with Bluetooth Low
Energy and that is not enabled by default since it is not fully finished
yet. CID is only used by Low Energy.

Bluetooth BR/EDR only uses PSM part of the socket address and that has
been endian safe.

Regards

Marcel



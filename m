From: David Miller <davem@davemloft.net>
Date: Wed, 31 Jul 2013 02:24:42 +0000
Subject: Re: [patch] net: remove an unneeded check
Message-Id: <20130730.192442.636351467466486145.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130729191519.GA11874@elgon.mountain>
In-Reply-To: <20130729191519.GA11874@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Jul 2013 22:15:19 +0300

> "ifa->ifa_label" is an array inside the in_ifaddr struct.  It can never
> be NULL so we can remove this check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeah this has been like this forever, applied to net-next, thanks
Dan.

From: Richard Cochran <richardcochran@gmail.com>
Date: Tue, 18 Apr 2017 20:19:17 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170418201917.GA4428@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
In-Reply-To: <20170418191426.GA17838@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan =?iso-8859-1?Q?S=F8rensen?= <stefan.sorensen@spectralink.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 18, 2017 at 10:14:26PM +0300, Dan Carpenter wrote:
> This patch is prompted by a static checker warning about a potential
> use after free.  The concern is that netif_rx_ni() can free "skb" and we
> call it twice.

Right, the code already calls netif_rx_ni() in the list_for_each_safe()
loop just above, in the case that the shhwtstamps pointer has been set.
 
> When I look at the commit that added this, it looks like some stray
> lines were added accidentally.  It doesn't make sense to me that we
> would recieve the same data two times.  I asked the author but never
> recieved a response.

Hm, maybe the intent was to move the call to netif_rx_ni() outside of
the spin_lock_irqsave() region (which how I had it before Stefan's
changes).

But calling netif_rx_ni() twice is clearly wrong.

Thanks,
Richard




From: Richard Cochran <richardcochran@gmail.com>
Date: Thu, 20 Apr 2017 21:30:12 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170420213012.GC16894@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
 <1492593414.3108.1.camel@spectralink.com>
 <20170419103135.GA1670@localhost.localdomain>
 <20170420.160227.1855463512293087492.davem@davemloft.net>
In-Reply-To: <20170420.160227.1855463512293087492.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Stefan.Sorensen@spectralink.com, dan.carpenter@oracle.com, netdev@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, kernel-janitors@vger.kernel.org

On Thu, Apr 20, 2017 at 04:02:27PM -0400, David Miller wrote:
> Oops, I read this too late.
> 
> I already applied and pushed out Dan's fix.

No problem, i'll submit a patch on top of that to move the netif calls
out of the spin-locked regions.

Thanks,
Richard

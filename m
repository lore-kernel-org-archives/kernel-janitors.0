From: Ben Hutchings <bhutchings@solarflare.com>
Date: Wed, 04 Sep 2013 14:41:18 +0000
Subject: Re: [patch] sfc: check for allocation failure
Message-Id: <1378305678.1556.2.camel@bwh-desktop.uk.level5networks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130902082828.GA30037@elgon.mountain>
	 <20130903.224939.866623192858217581.davem@davemloft.net>
In-Reply-To: <20130903.224939.866623192858217581.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>

On Tue, 2013-09-03 at 22:49 -0400, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Mon, 2 Sep 2013 12:04:42 +0300
> 
> > It upsets static analyzers when we don't check for allocation failure.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This applies cleanly neither to net nor net-next, please send me a
> version that does.

Oh yes, I failed to spot the filename.  That function has since been
moved to falcon.c.

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.


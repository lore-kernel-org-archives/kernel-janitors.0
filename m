From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Wed, 13 Nov 2013 18:00:54 +0000
Subject: Re: [patch] net: mv643xx_eth: potential NULL dereference in probe()
Message-Id: <20131113180054.GA19645@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075247.GI25541@elgon.mountain>
 <52833734.5000507@gmail.com>
In-Reply-To: <52833734.5000507@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 09:24:20AM +0100, Sebastian Hesselbarth wrote:
> On 11/13/13 08:52, Dan Carpenter wrote:
> >We assume that "mp->phy" can be NULL a couple lines before the
> >dereference.
> >
> >Fixes: 1cce16d37d0f ('net: mv643xx_eth: Add missing phy_addr_set in DT mode')
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Acked-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

My bad, I missed this possibility.

Jason

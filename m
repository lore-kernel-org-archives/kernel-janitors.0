From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2018 18:26:46 +0000
Subject: Re: [PATCH] xarray: unlock on error in xa_alloc()
Message-Id: <20180706182645.orttu3jjiox3v6kn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180706172101.vvp3fv3l244y2p7w@kili.mountain>
 <20180706175130.GA7259@bombadil.infradead.org>
In-Reply-To: <20180706175130.GA7259@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 06, 2018 at 10:51:30AM -0700, Matthew Wilcox wrote:
> On Fri, Jul 06, 2018 at 08:21:01PM +0300, Dan Carpenter wrote:
> > We need to unlock on this error path.
> > 
> > Fixes: 29a6bfc32eb2 ("xarray: Track free entries in an XArray")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > 
> > There "UINT_MAX + 1" is an integer overflow and is equal to zero but I
> > don't know what was intended there.
> 
> Ah.  I didn't realise UINT_MAX was defined as ~0U.  I had intended
> UINT_MAX + 1UL.  ie 0x10000000UL on 64-bit and 0 on 32-bit.
> 

I will push a Smatch check so that the wrap around on 32 bit systems
will generate a warning.

regards,
dan carpenter


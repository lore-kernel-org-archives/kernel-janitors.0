From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Jul 2018 05:16:06 +0000
Subject: Re: [PATCH] xarray: unlock on error in xa_alloc()
Message-Id: <20180707051606.c2xghzl3bpbnya6x@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180706172101.vvp3fv3l244y2p7w@kili.mountain>
 <20180706175130.GA7259@bombadil.infradead.org>
 <20180706182645.orttu3jjiox3v6kn@mwanda>
 <20180706190814.GB7259@bombadil.infradead.org>
In-Reply-To: <20180706190814.GB7259@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 06, 2018 at 12:08:14PM -0700, Matthew Wilcox wrote:
> On Fri, Jul 06, 2018 at 09:26:46PM +0300, Dan Carpenter wrote:
> > On Fri, Jul 06, 2018 at 10:51:30AM -0700, Matthew Wilcox wrote:
> > > On Fri, Jul 06, 2018 at 08:21:01PM +0300, Dan Carpenter wrote:
> > > > We need to unlock on this error path.
> > > > 
> > > > Fixes: 29a6bfc32eb2 ("xarray: Track free entries in an XArray")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > 
> > > > There "UINT_MAX + 1" is an integer overflow and is equal to zero but I
> > > > don't know what was intended there.
> > > 
> > > Ah.  I didn't realise UINT_MAX was defined as ~0U.  I had intended
> > > UINT_MAX + 1UL.  ie 0x10000000UL on 64-bit and 0 on 32-bit.
> > > 
> > 
> > I will push a Smatch check so that the wrap around on 32 bit systems
> > will generate a warning.
> 
> Do you mean "on 64-bit systems"?  Because the code as-written was correct
> on 32-bit systems and buggy on 64-bit systems.
> 
> I suppose generally, this is:
> 
> 	if (unsigned long = unsigned int + int)
> 
> where we can tell statically that the right hand side will wrap on 32-bit
> systems and not on 64-bit systems.

No no.  I'm going to print a warning any time you add two numbers
together and it wraps around.  It's normally a bug.

One idea to silence the warning would be to use #ifdef 64BIT #else.

regards,
dan carpenter

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 11:50:05 +0000
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-Id: <20121122115005.GK6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583603.2701.45.camel@sauron.fi.intel.com>
In-Reply-To: <1353583603.2701.45.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>

On Thu, Nov 22, 2012 at 01:26:43PM +0200, Artem Bityutskiy wrote:
> On Thu, 2012-11-22 at 14:14 +0300, Dan Carpenter wrote:
> > On Thu, Nov 22, 2012 at 12:31:37PM +0200, Artem Bityutskiy wrote:
> > > On Sat, 2012-11-17 at 18:11 +0300, Dan Carpenter wrote:
> > > >  	out_len = le32_to_cpu(dn->size);
> > > > -	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
> > > > +	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
> > > >  	if (!buf)
> > > >  		return -ENOMEM;
> > > 
> > > I think this makes the code unreadable, because we really allocate a
> > > buffer, not an array.
> > 
> > The problem with the original code is that the multiply looks very
> > suspect.  Everyone who reads it has to backtrack to find where
> > dn->size is capped.
> > 
> > I guess in one sense we never allocate an array, we always declare
> > it on the stack.  We debated the naming and there really isn't a
> > good name.  kmalloc_safe() isn't right either.  But anyway, the
> > intent is that eventually someone will right a coccinelle script
> > which replaces all these allocations with kmalloc_array().
> 
> Did you consider kcalloc() ? Just like malloc() / calloc() libc
> functions?

We already have a kcalloc() but it zeroes out the memory.

regards,
dan carpenter



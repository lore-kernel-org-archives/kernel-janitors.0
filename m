From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 23:42:03 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120905234203.GG19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 05, 2012 at 03:20:57PM +0200, Borislav Petkov wrote:
> On Wed, Sep 05, 2012 at 03:30:42PM +0300, Dan Carpenter wrote:
> > list_for_each_entry_reverse() dereferences the iterator, but we already
> > freed it.
> 
> Wait a sec, we assign the iterator in each iteration of the loop, right?
> 
> And if so, I don't see a problem: we derefence a new element each time
> and *then* free it...

The dereference happens inside the assignment.  That's actually the
reason why we have the the _safe() version of the macro.

regards,
dan carpenter


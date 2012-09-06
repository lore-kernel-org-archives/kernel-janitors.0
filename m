From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Sep 2012 12:30:48 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120906123048.GH19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 02:01:45PM +0200, Borislav Petkov wrote:
> On Wed, Sep 05, 2012 at 04:42:03PM -0700, Dan Carpenter wrote:
> > The dereference happens inside the assignment.
> 
> Yes, this:
> 
> #define list_for_each_entry_reverse(pos, head, member)			\
> 	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
> 	     &pos->member != (head); 	\					<--- DEREF.

No.  That's not what I'm talking about.  (And also that's not a
dereference, it just gives you the address of the struct member).

> 	     pos = list_entry(pos->member.prev, typeof(*pos), member))
                              ^^^^^
Here is the dereference.  We have already freed "pos" at this point.

> 
> but we kfree pos aka p after the deref and in the next iteration p
> becomes the list entry of the next list element, AFAICT.
> 
> > That's actually the reason why we have the the _safe() version of the
> > macro.
> 
> _safe, the way I see it, is for concurrent list manipulations and at the
> point we free the cache, I don't see us concurrently manipulating that
> list.
> 

GAR GAR GAR!  STOP! NO!  I've seen this before where people remove
locking code and change to using the _safe() version of the
list_for_each macros.  The _safe() version has *NOTHING* to do with
concurency.  It is for if we are freeing a list element.

regards,
dan carpenter



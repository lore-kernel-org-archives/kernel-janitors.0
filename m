From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Sep 2012 14:04:01 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120906140401.GJ19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 03:06:53PM +0200, Borislav Petkov wrote:
> On Thu, Sep 06, 2012 at 05:30:48AM -0700, Dan Carpenter wrote:
> > > #define list_for_each_entry_reverse(pos, head, member)			\
> > > 	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
> > > 	     &pos->member != (head); 	\					<--- DEREF.
> > 
> > No.  That's not what I'm talking about.  (And also that's not a
> > dereference, it just gives you the address of the struct member).
> > 
> > > 	     pos = list_entry(pos->member.prev, typeof(*pos), member))
> >                               ^^^^^
> > Here is the dereference.  We have already freed "pos" at this point.
> 
> Ok, I see it now, thanks for pointing it out exactly.
> 
> One last thing remains: why didn't I hit this during testing at all?
> Timings, or some other out-of-order x86 reason I'm unable to see now?
> 

You wouldn't see it unless something called kmalloc() on another CPU
and reused the freed memory.  Or if you had CONFIG_DEBUG_SLAB
enabled then I believe that will poison freed memory immediately.

(Btw, I haven't tested this code either before or after my patch
because I don't have any AMD systems).

regards,
dan carpenter


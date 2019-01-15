From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Jan 2019 21:35:00 +0000
Subject: Re: [PATCH] XArray: Fix a math problem in xa_is_err()
Message-Id: <20190115213500.GJ4504@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115195241.GB1074@kadam>
 <20190115210726.GC6310@bombadil.infradead.org>
In-Reply-To: <20190115210726.GC6310@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 15, 2019 at 01:07:26PM -0800, Matthew Wilcox wrote:
> On Tue, Jan 15, 2019 at 10:52:41PM +0300, Dan Carpenter wrote:
> > @@ -177,7 +177,8 @@ static inline bool xa_is_internal(const void *entry)
> >  static inline bool xa_is_err(const void *entry)
> >  {
> >  	return unlikely(xa_is_internal(entry) &&
> > -			(unsigned long)entry >= -((MAX_ERRNO << 2) + 2));
> > +			(unsigned long)entry >> > +				(((unsigned long)(-MAX_ERRNO << 2) + 2)));
> >  }
> 
> Ugh all the brackets, I'm not surprised I got it wrong.  How about this
> instead; does it make your static checker happy?
> 

I wasn't a super fan of that expression either...  I think your code
will work, and if not then it's the checker which needs fixing.  Thanks!

regards,
dan carpenter

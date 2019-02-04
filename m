From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 13:49:55 +0000
Subject: Re: [PATCH] mm/hmm: potential deadlock in nonblocking code
Message-Id: <20190204134955.GE2581@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190204132043.GA16485@kadam>
 <20190204134203.GB21860@bombadil.infradead.org>
In-Reply-To: <20190204134203.GB21860@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Mon, Feb 04, 2019 at 05:42:03AM -0800, Matthew Wilcox wrote:
> On Mon, Feb 04, 2019 at 04:20:44PM +0300, Dan Carpenter wrote:
> >  
> > -	if (!nrange->blockable && !mutex_trylock(&hmm->lock)) {
> > -		ret = -EAGAIN;
> > -		goto out;
> > +	if (!nrange->blockable) {
> > +		if (!mutex_trylock(&hmm->lock)) {
> > +			ret = -EAGAIN;
> > +			goto out;
> > +		}
> >  	} else
> >  		mutex_lock(&hmm->lock);
> 
> I think this would be more readable written as:
> 
> 	ret = -EAGAIN;
> 	if (nrange->blockable)
> 		mutex_lock(&hmm->lock);
> 	else if (!mutex_trylock(&hmm->lock))
> 		goto out;

I agree, that does look nicer.  I will resend.

regards,
dan carpenter

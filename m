From: Joe Perches <joe@perches.com>
Date: Fri, 03 Oct 2014 15:11:09 +0000
Subject: Re: [patch] checkpatch: remove the ether_addr_copy warning
Message-Id: <1412349069.3247.114.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141003093505.GA7393@mwanda>
	 <1412346147.3247.97.camel@joe-AO725> <20141003144729.GK23154@mwanda>
In-Reply-To: <20141003144729.GK23154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Whitcroft <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org

On Fri, 2014-10-03 at 17:47 +0300, Dan Carpenter wrote:
> On Fri, Oct 03, 2014 at 07:22:27AM -0700, Joe Perches wrote:
> > On Fri, 2014-10-03 at 12:35 +0300, Dan Carpenter wrote:
> > > Most people sending checkpatch.pl fixes don't know how to verify the
> > > alignment.  This checkpatch warning just encourages newbies to try
> > > introduce bugs.  Patch submitters tell us that they just sed the code
> > > and it's the job for the maintainer to check that it's correct.

And that's where it's the maintainer's job to educate,
inform, reject 
 
> > I haven't seen many instances of bad patch submittals
> > on netdev.  Is this mostly an issue for staging?
> 
> I don't follow netdev so I can't say.
> 
> Most of the time data is aligned at a 4 byte mark so probably you are
> just getting lucky.

All typical Ethernet frames have 1 of the 2 addresses on an
even byte boundary but not 4 byte aligned.

Most all of the is_<foo>_ether_addr tests assume __aligned(2)

> I really doubt that netdev checkpatch newbies know
> about alignment...

I think that's a learning opportunity...

> > Maybe a downgrade to CHK requiring --strict is OK.
> 
> I would actually like to turn --strict by default in staging.

I recall a suggested patch for that.

> Checkpatch is a good concept, but it should only do safe things instead
> of telling newbies to send buggy patches.

checkpatch isn't just for the inexperienced.
It's an oversight tester and a style tool.

Degrading it doesn't make it better.


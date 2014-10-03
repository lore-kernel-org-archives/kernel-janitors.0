From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Oct 2014 14:47:29 +0000
Subject: Re: [patch] checkpatch: remove the ether_addr_copy warning
Message-Id: <20141003144729.GK23154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141003093505.GA7393@mwanda>
 <1412346147.3247.97.camel@joe-AO725>
In-Reply-To: <1412346147.3247.97.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org

On Fri, Oct 03, 2014 at 07:22:27AM -0700, Joe Perches wrote:
> On Fri, 2014-10-03 at 12:35 +0300, Dan Carpenter wrote:
> > Most people sending checkpatch.pl fixes don't know how to verify the
> > alignment.  This checkpatch warning just encourages newbies to try
> > introduce bugs.  Patch submitters tell us that they just sed the code
> > and it's the job for the maintainer to check that it's correct.
> 
> I haven't seen many instances of bad patch submittals
> on netdev.  Is this mostly an issue for staging?

I don't follow netdev so I can't say.

Most of the time data is aligned at a 4 byte mark so probably you are
just getting lucky.  I really doubt that netdev checkpatch newbies know
about alignment...

> 
> Maybe a downgrade to CHK requiring --strict is OK.

I would actually like to turn --strict by default in staging.

Checkpatch is a good concept, but it should only do safe things instead
of telling newbies to send buggy patches.

regards,
dan carpenter


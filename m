From: Rob Landley <rob@landley.net>
Date: Wed, 21 Aug 2013 01:36:27 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <1377048987.2737.89@driftwood>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377043822.2737.86@driftwood>
	<1377044556.2016.102.camel@joe-AO722>
In-Reply-To: <1377044556.2016.102.camel@joe-AO722> (from joe@perches.com on
	Tue Aug 20 19:22:36 2013)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On 08/20/2013 07:22:36 PM, Joe Perches wrote:
> On Tue, 2013-08-20 at 19:10 -0500, Rob Landley wrote:
> > The important question is does he want to handle patches that you're
> > flipping out about not going in before the next merge window because
> > they are SO IMPORTANT that the trivial tree must promote them out of
> > sequence.
> 
> You're misreading.  I see no flipping out here.
> 
> I'm simply saying that obvious defects should be
> corrected sooner rather than later.
> 
> I'm also saying that the trivial tree should
> have some visibility about whether or not a
> patch or series will be handled by the trivial
> maintainer or not.

I fetch his git and look at the log of the branch to see which of the  
documentation patches I forwarded are there. That said, there's no  
guarantee they'll go in from there because other maintainers often grab  
them and put them in through their trees.

> Jiri has not responded to this point.

He did. Twice.

> Silence about the status of patches that extends
> for months is not good.

He has a public git tree. It's listed in his MAINTAINERS entry. I've  
found that if a patch isn't in there, he hasn't picked it up yet. (I've  
been feeding Documentation patches through his tree, hence my interest  
in this thread.)

Rob
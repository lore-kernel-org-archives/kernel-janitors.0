From: Joe Perches <joe@perches.com>
Date: Wed, 21 Aug 2013 04:10:07 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <1377058207.1936.6.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377043822.2737.86@driftwood>
	 <1377044556.2016.102.camel@joe-AO722> <1377048987.2737.89@driftwood>
In-Reply-To: <1377048987.2737.89@driftwood>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Tue, 2013-08-20 at 20:36 -0500, Rob Landley wrote:
> On 08/20/2013 07:22:36 PM, Joe Perches wrote:
> > I'm also saying that the trivial tree should
> > have some visibility about whether or not a
> > patch or series will be handled by the trivial
> > maintainer or not.
[]
> > Jiri has not responded to this point.
> He did. Twice.

Not really.

> > Silence about the status of patches that extends
> > for months is not good.
> 
> He has a public git tree.

Yes, I know.

> I've found that if a patch isn't in there, he hasn't picked
> it up yet.

It's the visibility of if/yet/when for the trivial
patches submitted and unresponded to that's the question.

And no, Jiri hasn't responded with any intention of
making any such scheme public.

I think a public patchwork queue like netdev's could
work reasonably well.

http://patchwork.ozlabs.org/project/netdev/list/



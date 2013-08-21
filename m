From: Rob Landley <rob@landley.net>
Date: Wed, 21 Aug 2013 00:10:22 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <1377043822.2737.86@driftwood>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1377036678.2016.88.camel@joe-AO722> (from joe@perches.com on
	Tue Aug 20 17:11:18 2013)
References: <1376944033.2016.13.camel@joe-AO722>
In-Reply-To: <1376944033.2016.13.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On 08/20/2013 05:11:18 PM, Joe Perches wrote:
> On Tue, 2013-08-20 at 16:49 -0500, Rob Landley wrote:
> > On 08/20/2013 03:14:10 PM, Joe Perches wrote:
> > > On Tue, 2013-08-20 at 15:02 -0500, Rob Landley wrote:
> > > > On 08/19/2013 04:27:17 PM, Joe Perches wrote:
> > > > > On Mon, 2013-08-19 at 23:22 +0200, Jiri Kosina wrote:
> > > > > > On Mon, 19 Aug 2013, Joe Perches wrote:
> > > > > >
> > > > > > > This is a 7 line patch that corrects logging defects that  
> has
> > > had
> > > > > no
> > > > > > > reply from you for the last month.
> > > > > > >
> > > > > > > https://patchwork.kernel.org/patch/2833648/
> > > > > >
> > > > > > This hasn't missed any Linus' major release, as it has been
> > > > > submitted post
> > > > > > 3.11 merge, right? (hint, that was Jul 4th).
> > > > > >
> > > > > > If this would miss *next* major Linus' release, I would  
> accept
> > > your
> > > > > > complaints. But this is definitely not the case.
> > > > >
> > > > > You're suggesting this patch, which corrects obvious
> > > > > defects, should miss 3.12 and go into 3.13?
> > > > >
> > > > > I think that's wrong.
> > > >
> > > > Correcting obvious defects, which can't wait a release, is  
> "trivial"
> > > > now, is it?
> > >
> > > Rob, how do you suggest this obvious and trivial
> > > patch be handled?
> >
> > Obvious != trivial. They're orthogonal.
> 
> Silly.  Some things are both obvious _and_ trivial.

You believe orthogonal things never coincide? Then they wouldn't be  
orthogonal. (It means unrelated, not exclusive.)

> > > Send 6+ 1 line patches that do the same thing to
> > > individual maintainers?
> >
> > If it's important send it to Andrew Morton.
> 
> Andrew?  Do you want to handle patches for defects that
> are both obvious _and_ trivial?

The important question is does he want to handle patches that you're  
flipping out about not going in before the next merge window because  
they are SO IMPORTANT that the trivial tree must promote them out of  
sequence.

If it's that important, it's not "trivial".

> > If it's trivial it's not time critical. If it's time critical it's  
> not
> > trivial.
> 
> We disagree on the definition of trivial.

Yes. Yes we do.

> Trivial can also mean simple and immediately evident.

If it's so important that it can't wait until the next merge window,  
the trivial tree's maintainer said the trivial tree is not the right  
channel to merge it through.

Rob
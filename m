From: Julia Lawall <julia@diku.dk>
Date: Wed, 23 Apr 2008 14:24:53 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.58.0804231608000.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 23 Apr 2008, Roel Kluin wrote:

> Julia Lawall wrote:
>
> >> and besides your evaluated the tests:
> >>
> >> * i < [any negative value]
> >> * i >= [0 or any negative value]
> >> * i = [any negative value]
> >> * i != [any negative value]
> >> * [0 or any negative value] <= i
> >> * [0 or any negative value] > i
> >
> > We do 0 > i via the isomoprhisms.  But I have never seen such code.
> >
> > As you mention, we could consider more kinds of comparison to 0 by writing
> > more patterns, eg;
> >
> > (
> >  i < 0
> > |
> >  i <= 0
> > |
> >  i = -C
> > |
> >  i < -C
> > |
> >  i <= -C
> > )
> >
> > where C was previously declared to be any constant.
>
> this should be different:
>
>  (
> * i < 0
> |
> * i = -C
> |
> * i < -C
> |
> * i >= -C
> )

Agreed.  But maybe i <= -C should be there too?  And i > -C.

julia

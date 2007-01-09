From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 09 Jan 2007 13:04:15 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701090802470.8391@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:
> > On Tue, 9 Jan 2007, Richard Knutsson wrote:

> > > What about something like:
> > >
> > > #define LESS_THEN_2_BITS(x)  (x & (x - 1))
> > >
> Oops, forgot a '= 0' there...
> > > #define IS_POWER_OF_2(x)   (x != 0 && LESS_THEN_2_BITS(x))
> > >
> >
> > i'm not sure i'd bother with the "LESS_THAN_2_BITS" macro, since i
> > doubt it would have widespread application.  in any event, this is
> > just something to think about for future consideration.
> >
> So just leaving those who are (with right) accepting non-zero alone?

as a first pass, i would try a cleanup that left the semantics of the
existing code *exactly* the way it was.  so if there was a
pathological case in the current code, it would still be there in the
new code.  that's clearly the safe way to proceed.

a couple final thoughts on this later.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

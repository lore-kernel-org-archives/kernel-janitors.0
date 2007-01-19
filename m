From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 19 Jan 2007 19:58:00 +0000
Subject: Re: [KJ] value of "__attribute__((no_instrument_function))"??
Message-Id: <Pine.LNX.4.64.0701191456540.25914@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701190258510.20218@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701190258510.20218@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 19 Jan 2007, Nishanth Aravamudan wrote:

> On 19.01.2007 [03:09:07 -0500], Robert P. J. Day wrote:
> >
> >   i just noticed that there are a *very* small number of routines in
> > the source tree tagged with the attribute of "no_instrument_function".
> >
> > $ grep -rw no_instrument_function .
> > ./net/rxrpc/main.c:__attribute__((no_instrument_function));
> > ./net/rxrpc/main.c:__attribute__((no_instrument_function));
> > ./fs/afs/main.c:__attribute__((no_instrument_function));
> > ./fs/afs/main.c:__attribute__((no_instrument_function));
> >
> >   from the gcc manual:
> >
> > "If -finstrument-functions is given, profiling function calls will be
> > generated at entry and exit of most user-compiled functions. Functions
> > with this attribute will not be so instrumented."
> >
> >   that *seems* like a useful attribute so the obvious question is --
> > why is it not used more widely?  that seems kind of odd.  (in fact,
> > the functions with these attributes are all commented out within an
> > "#if 0" so they make no difference, anyway.)
>
> It seems like a useful attribute to *disable* instrumentation in the
> kernel? Why?

yes, and the point it -- are there places where people *should* be
using it in the kernel?  as i mentioned, there are only four instances
of it, and all four of those are commented out.  i was just curious.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

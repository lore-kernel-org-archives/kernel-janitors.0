From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 28 Jan 2016 10:24:03 +0000
Subject: Re: [PATCH] net/mac80211/agg-rx.c: fix use of uninitialised values
Message-Id: <alpine.DEB.2.10.1601281120580.2516@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126111730.GA6765@localhost> <20160127154618.GA5717@localhost> <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com> <1453974492.2217.2.camel@sipsolutions.net>
 <CAGRGNgVqtj8SwP-gEt0ZnbgWzgVHjcY9Q=JyB6bf6d_m+8mvhA@mail.gmail.com>
In-Reply-To: <CAGRGNgVqtj8SwP-gEt0ZnbgWzgVHjcY9Q=JyB6bf6d_m+8mvhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Chris Bainbridge <chris.bainbridge@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, aryabinin@virtuozzo.com, Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>



On Thu, 28 Jan 2016, Julian Calaby wrote:

> Hi Johannes,
>
> On Thu, Jan 28, 2016 at 8:48 PM, Johannes Berg
> <johannes@sipsolutions.net> wrote:
> > On Thu, 2016-01-28 at 10:27 +1100, Julian Calaby wrote:
> >> I'd prefer to just set ->removed to false right after we set
> >> ->auto_seq as that should be faster, however I don't know if
> >> __ieee80211_start_rx_ba_session() is a fast path so I don't know if
> >> this is saving anything.
> >
> > It's not supposed to be called frequently, no.
>
> Then most of my commentary is moot.
>
> I guess the argument comes down to do we zero everything or initialise
> everything, and if speed isn't an issue, the former is better.
>
> >> On another note, this is an error that should be pretty easy to spot.
> >> Could any of the automated tools find cases where a struct containing
> >> a bool variable is kmalloc'd and returned without assigning all the
> >> bools?
> >
> > I think you'd quickly drown in false positives, since "return" isn't
> > necessarily something that means it needs to have been fully
> > initialized.
>
> True.
>
> Either way, I'm guessing that UBSAN will pick up a lot of similar bugs
> and the output of that is probably a much smaller haystack to dig
> through than just "every" kmalloc() call.

It could be possible to find the cases where most of the fields are
initialized, but one is left out.  This could be done for all the fields of
a given type, or in general.

julia


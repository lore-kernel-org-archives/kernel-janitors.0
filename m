From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 06:57:15 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711270755280.2369@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com> <alpine.DEB.2.20.1711260648130.2387@hadrien> <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com> <alpine.DEB.2.20.1711261807590.2111@hadrien> <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com>
 <alpine.DEB.2.20.1711261912150.2111@hadrien> <1511746526.20482.38.camel@perches.com> <alpine.DEB.2.20.1711270738470.2369@hadrien> <alpine.DEB.2.20.1711270741190.2369@hadrien> <214bd4fd-7074-8af7-2993-a11b2605346f@deltatee.com>
In-Reply-To: <214bd4fd-7074-8af7-2993-a11b2605346f@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Sun, 26 Nov 2017, Logan Gunthorpe wrote:

>
>
> On 26/11/17 11:42 PM, Julia Lawall wrote:
> > Although I guess that in that case the whole exercise is pointless?
> > Because every print will at runtime be followed by another print, which
> > will add either the newline or a continuation.
>
> Yes, in practice the '\n' at the end of every log line is optional based
> on what the code actually does. Nothing bad happens if you omit one. But
> reviewers still point out that they are required. (That's what started
> me on this mess -- because I'd rather know what the correct thing is
> before I commit the code for the first time, and not months after the
> code reached mainline.)
>
> The reviewers have a really good point though: if a significant fraction
> of the log calls have no new line and a majority have them, then making
> any kind of change in this area could break things. Not to mention the
> ugliness of the inconsistencies everywhere. Also, the more cases that
> are "wrong" that get into the kernel the more it confuses people trying
> to learn what the "right" thing is.

The problem is probably mostly for the non-standard functions, where a lot
of function/macro unfolding is often required to see what is really going
on.

julia


>
> Honestly, though, I have no dog in this race. I just thought it would be
> useful.
>
> Logan
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

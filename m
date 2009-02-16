From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 16 Feb 2009 14:19:17 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <20090216141917.GA8981@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de>
In-Reply-To: <4999717F.7090205@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


* Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:

> Ingo Molnar wrote:
> > * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
> >> Furthermore, the changelog is bad (non-exiting in fact).
> >> 
> >> The fact that the issues where discovered using checkpatch is absolutely
> >> uninteresting.  The changelog should describe /what/ is fixed, [...]
> > 
> > The commit log definitely needs enhancements but it's not uninteresting 
> > at all what tools were used to arrive to a change. [...] if a
> > good and acceptable commit results out of a tool's usage then that tool 
> > needs to be advertised some more.)
> 
> Fine, then the author could mention it below the --- delimitor in the 
> patch posting.  The changelog however, as annotation of the source 
> history, is not a billboard.  We also don't describe for example that 
> a nice cup of hot Earl Grey or whatever was vital to the creation of a 
> patch.

Well there's a difference between a nice cup of tea (that really has no 
direct connection to kernel development) and a tool that is in the Linux 
kernel specifically for the purpose of helping keep code clean, and that 
was used to come up with a cleanup.

We routinely mention Sparse, lockdep, Coverity, Coccinelle, kmemleak, 
ftrace, kmemcheck and other tools as well when it motives to fix a bug 
or uncleanliness. We routinely mention checkpatch as well when it 
catches an uncleanliness in a submitted patch. It is absolutely fine to 
mention checkpatch when it catches uncleanliness in code that already 
got merged. I dont understand your point.

	Ingo

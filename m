From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 16 Feb 2009 15:50:23 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <20090216155023.GA4422@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de> <20090216141917.GA8981@elte.hu> <499984C1.6020004@s5r6.in-berlin.de>
In-Reply-To: <499984C1.6020004@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


* Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:

> Ingo Molnar wrote:
> > We routinely mention Sparse, lockdep, Coverity, Coccinelle, kmemleak, 
> > ftrace, kmemcheck and other tools as well when it motives to fix a bug 
> > or uncleanliness. [...] It is absolutely fine to
> > mention checkpatch when it catches uncleanliness in code that already 
> > got merged. I dont understand your point.
> 
> I wrote "don't mention checkpatch" but I really meant "think about what
> the effect of the patch is and describe this".

Are you arguing that in all those other cases the tools should not be 
mentioned either? I dont think that position is tenable.

	Ingo

From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 14:00:31 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in	kernel/kallsyms.c
Message-Id: <4999717F.7090205@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu>
In-Reply-To: <20090216132822.GC17996@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Ingo Molnar wrote:
> * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
>> Furthermore, the changelog is bad (non-exiting in fact).
>> 
>> The fact that the issues where discovered using checkpatch is absolutely
>> uninteresting.  The changelog should describe /what/ is fixed, [...]
> 
> The commit log definitely needs enhancements but it's not uninteresting 
> at all what tools were used to arrive to a change. [...] if a
> good and acceptable commit results out of a tool's usage then that tool 
> needs to be advertised some more.)

Fine, then the author could mention it below the --- delimitor in the
patch posting.  The changelog however, as annotation of the source
history, is not a billboard.  We also don't describe for example that a
nice cup of hot Earl Grey or whatever was vital to the creation of a patch.
-- 
Stefan Richter
-===-=--= --=- =----
http://arcgraph.de/sr/

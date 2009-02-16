From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 16:35:16 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in kernel/kallsyms.c
Message-Id: <499995C4.3070504@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <Pine.LNX.4.64.0902161711580.9565@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902161711580.9565@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Ingo Molnar <mingo@elte.hu>, Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> Is everything below the --- preserved in what is available via git log?  

No, none of it (if the patch is mechanically applied with e.g. git-am).

Sometimes, useful information does indeed get lost because an author
didn't consider it "above ---"-worthy.

...
> I think the how information has some value, 
> both to make people aware of what tools are useful for what kinds of 
> tasks, and to help one understand what criteria were used in making the 
> patch.

That information is perfect for conservation mailing list archives.

The source repository metadata (commit logs) have other purposes:  Keep
book about what happened to the source code and why.

> This can sometimes be conveyed more precisely using code than 
> English text.

If the scope of a change is better captured that way, then OK.

> I agree that the how information is not always relevant for 
> the person who just wants to scan a changelog to see what is new in the 
> current Linux release.

The changelog is not only to learn what's new (i.e. a source of release
notes), it's also to learn what's old. :-)  I go through old changelogs
all the time because I deal with code with history older than my
involvement or too old for me to remember the circumstances.
-- 
Stefan Richter
-===-=--= --=- =----
http://arcgraph.de/sr/

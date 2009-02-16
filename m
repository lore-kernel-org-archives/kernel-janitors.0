From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 16 Feb 2009 17:21:47 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <20090216172147.GB26995@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <Pine.LNX.4.64.0902161711580.9565@pc-004.diku.dk> <499995C4.3070504@s5r6.in-berlin.de>
In-Reply-To: <499995C4.3070504@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Julia Lawall <julia@diku.dk>, Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


* Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:

> Julia Lawall wrote:
> > Is everything below the --- preserved in what is available via git log?  
> 
> No, none of it (if the patch is mechanically applied with e.g. git-am).
> 
> Sometimes, useful information does indeed get lost because an author
> didn't consider it "above ---"-worthy.
> 
> ...
> > I think the how information has some value, 
> > both to make people aware of what tools are useful for what kinds of 
> > tasks, and to help one understand what criteria were used in making the 
> > patch.
> 
> That information is perfect for conservation mailing list archives.

Uhm, a mailing list archives have numerous well-known disadvantages: 
they are not permanent or accessible in any acceptable fashion - URLs 
can go stale, certain mails get lost, the commit itself has no backlink 
to the lkml discussion [or whichever of the hundreds of maintainer lists 
it was discussed on], etc. etc.

Claiming that information is 'perfect' for the mailing list but not good 
for the Git log is a double standard.

The thing is, we need more information about how a given patch was 
originated, not less. We need more information about how efficient our 
tools are, not less.

The main problems we have with commit logs today is not too much 
information but too little information. A log message should be 
well-structured, with the more important information near the top of it, 
the less important information at the end - but arguing that something 
as fundamental as the tools that motivated a change is silly on its 
face.

	Ingo

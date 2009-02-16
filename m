From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 18:04:03 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in	kernel/kallsyms.c
Message-Id: <4999AA93.5030009@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de> <20090216141917.GA8981@elte.hu> <499984C1.6020004@s5r6.in-berlin.de> <20090216155023.GA4422@elte.hu> <4999908D.4050403@s5r6.in-berlin.de> <20090216171233.GB25907@elte.hu>
In-Reply-To: <20090216171233.GB25907@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Ingo Molnar wrote:
> * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
> That position of not adding tool information to the commit log is not 
> just not tenable but also incredibly silly.

It's not a hard requirement; it's a rule of thumb to detect changelogs
which lack important information.

I made it sound like a hard requirement for simplicity's sake. :-)

(The rule works thusly:  If the author put irrelevant information into
the log, then this is a sign that insufficient care was taken and hence
there is a danger that necessary information was forgotten.)

> Those tools are useful, they result in fixes, so why should the patch 
> author pretend and hide the method of finding problems from the Git 
> history?

Because the result is what counts:  What is the change doing?  Why
change the source in this way?

The changelogs don't teach programming or discuss our development
methods.  They are not a channel for feedback from tools users to tools
developers.

I stress again that putting irrelevant information into the log is
almost as bad as forgetting relevant information.  The S/N ratio is
lowered by the latter /and/ by the former.

> We often write "found via review" or "found via testing". It's 
> useful and it gives people an idea of how certain types of fixes were 
> found.

We write it
  - to acknowledge the work which was spent by people,
  - to describe under which circumstances an issue was reproducible.

"I used script XYZ to find whitespace style deviations" is fundamentally
different from "I used this and that benchmark setup to produce the
following results" --- because there are several alternative and
*obvious* ways to find style deviations, while there may be only
non-trivial and highly specific ways to reproduce a bug or performance
result.
-- 
Stefan Richter
-===-=--= --=- =----
http://arcgraph.de/sr/

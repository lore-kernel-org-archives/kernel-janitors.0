From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sun, 15 Oct 2006 19:26:28 +0000
Subject: Re: [KJ] Is documentation in the kernel code desired?
Message-Id: <20061015192628.GI10744@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610131953.05746.lists-receive@programmierforen.de>
In-Reply-To: <200610131953.05746.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 15.10.2006 [11:27:36 -0400], Chris Smith wrote:
> On 10/13/06, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > On Fri, 13 Oct 2006 19:53:05 +0200 Andi Drebes wrote:
> >
> > In general, yes, we want/need more documentation.
> > Caveat:  don't document obvious things like:
> >
> > 	i++;		/* increment the array index */
> >
> > It's more important to document why something is done and
> > generally how it is done.  "What" is important, but could easily
> > be one or two sentences, while the why and how may take much more.
> >
> > It's not clear to me that this is a good kernel-janitors project,
> > but I don't want to discourage anyone either.  However, I've tried
> > documenting some parts of the kernel code and it's fairly difficult
> > to do so in lots of places, unless you are very familiar with the code.
> >
> 
> As I've been putting .5 hours/day into reading the LKML and LWN etc.,
> what I really want to see is

TBH, 30 minutes a day isn't going to cut it, unless you're just treading
subject lines on LKML (and even then, only on low-volume days).

> a) A better documented object model.  Something doxygen-esque pulled
> out of the kernel headers would be teh r0x0rz, particularly if the
> output reflected obviously the .config used against that particular
> run

There is the source, after all (which was the start of this thread, more
comments in the source). And various files in
Documentation/driver-model, which is probably the most
developed-as-an-object-model object-model that I can think of in the
kernel right now.

I'm not sure, though, what you want documented in a).

> b) More clear peripheral tool documentation.  Kbuild has some good
> stuff, but try this experiment: get someone who has, say, run a Gentoo
> system (i.e. knows their way around a command line) and say, "Build me
> the latest -mm kernel" and watch them not have a smooth experience.

There is Documentation/applying-patches.txt, as well as the tools that
Randy mentioned. Gentoo user != kernel developer, btw.

> c) A little more coherence on the LKML.  I'm not at the point of
> trying to pluck patches and try them out, but I wouldn't even really
> want to try.  The organization scheme for the kernel community is
> rather mystical. ;)

It works for most :) Yes, as Randy said separately, it would be nice if
devlopment discussions stuck to the appropriate list, but there is
sufficient (and sometimes necessary) cross-development that often things
spillover.

As far as plucking patches go, it requires some finesse, but that's what
the tools are for: git, mercurial and quilt, to name a few (there's also
akpm's patch-scripts, which quilt is based on).

> My point is that the current situation filters out all but the
> hardiest.  Maybe I'm just a little slow, and maybe keeping out the
> riff-raff is rather a feature.  A little more OLS and maybe that Linux
> Lunacy Cruise next summer will help.  You really have to want to do
> this kernel stuff.

Yes, and if you want do more than lurk, then you probably need to
dedicate yourself to one subsystem for a while, unless you're someone
like Andrew or Randy, who are able to keep tabs on multiple things at
the same time (in Andrew's case, way more than I ever though possible).

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

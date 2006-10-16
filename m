From: "Chris Smith" <smitty1elkml@gmail.com>
Date: Mon, 16 Oct 2006 12:38:36 +0000
Subject: Re: [KJ] Is documentation in the kernel code desired?
Message-Id: <9b53a56d0610160538w44385563p7bf9d1f364e922d4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610131953.05746.lists-receive@programmierforen.de>
In-Reply-To: <200610131953.05746.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/15/06, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> > As I've been putting .5 hours/day into reading the LKML and LWN etc.,
> > what I really want to see is
>
> TBH, 30 minutes a day isn't going to cut it, unless you're just treading
> subject lines on LKML (and even then, only on low-volume days).
>
Absolutely, I have been skimming.  Just understanding the various
version control systems seems to be time-consuming.  I've acquired and
booted the latest -mm via mercurial and quilt, but git has eluded me
thus far.

> > a) A better documented object model.  Something doxygen-esque pulled
> > out of the kernel headers would be teh r0x0rz, particularly if the
> > output reflected obviously the .config used against that particular
> > run
>
> There is the source, after all (which was the start of this thread, more
> comments in the source). And various files in
> Documentation/driver-model, which is probably the most
> developed-as-an-object-model object-model that I can think of in the
> kernel right now.
>
> I'm not sure, though, what you want documented in a).
>
A really discoverable model would be something along the lines of
javadoc.  Some of my best learning comes from simply browsing about in
such.  Certainly the source is the ultimate, but it would also be nice
to produce documentation filtered via the .config, so that undesired
options and platform-specific items are omitted.
This would especially help the n00b.
I say these things knowing that the best way to attack the itch is
scratch it. ;)

> > b) More clear peripheral tool documentation.  Kbuild has some good
> > stuff, but try this experiment: get someone who has, say, run a Gentoo
> > system (i.e. knows their way around a command line) and say, "Build me
> > the latest -mm kernel" and watch them not have a smooth experience.
>
> There is Documentation/applying-patches.txt, as well as the tools that
> Randy mentioned. Gentoo user != kernel developer, btw.
>
Certainly.  Wasn't meaning to evangelize Gentoo there, just offer a
rough skill gauge.  An earlier draft of the post said "someone who has
completed a linuxfromscratch.org project"

> > c) A little more coherence on the LKML.  I'm not at the point of
> > trying to pluck patches and try them out, but I wouldn't even really
> > want to try.  The organization scheme for the kernel community is
> > rather mystical. ;)
>
> It works for most :) Yes, as Randy said separately, it would be nice if
> devlopment discussions stuck to the appropriate list, but there is
> sufficient (and sometimes necessary) cross-development that often things
> spillover.
>
> As far as plucking patches go, it requires some finesse, but that's what
> the tools are for: git, mercurial and quilt, to name a few (there's also
> akpm's patch-scripts, which quilt is based on).
>
Worked examples, while tedious to produce, would help.  As above, I
say this realizing that I need to Just Do It (and then post the worked
example).

> > My point is that the current situation filters out all but the
> > hardiest.  Maybe I'm just a little slow, and maybe keeping out the
> > riff-raff is rather a feature.  A little more OLS and maybe that Linux
> > Lunacy Cruise next summer will help.  You really have to want to do
> > this kernel stuff.
>
> Yes, and if you want do more than lurk, then you probably need to
> dedicate yourself to one subsystem for a while, unless you're someone
> like Andrew or Randy, who are able to keep tabs on multiple things at
> the same time (in Andrew's case, way more than I ever though possible).
>
Still making measured progress soaking the general stuff.  The lovely
thing about FOSS is that you don't have a change in someones business
model wiping out the equity in your time investments.  It's all good,
and I will get there.  Thanks.

-- 
Christopher Smith
Pursuer of knowledge
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

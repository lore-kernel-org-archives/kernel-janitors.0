From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 05 Feb 2007 17:25:08 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <20070205092508.1f4f0ea3.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 5 Feb 2007 12:19:11 -0500 (EST) Robert P. J. Day wrote:

> On Mon, 5 Feb 2007, Randy Dunlap wrote:
> 
> > On Mon, 5 Feb 2007 02:04:10 -0500 (EST) Robert P. J. Day wrote:
> >
> > >
> > >   now that 2.6.20 is official, what's the schedule for the queued
> > > patches to hit linus' tree?
> >
> > Which patches are queued?
> 
> sorry, maybe i'm misunderstanding the patch process.  i'm interested
> in when all the stuff in, for example, andrew morton's -mm tree is
> going to make it into the main git tree so it's part of my regular
> pull and i can start submitting patches against *that* stuff.


Andrew waits for most subsystem maintainers to push patches to
Linus before he pushes his remaining patches (where subsystem includes
both driver types, like USB, PCI, SCSI, I2C, etc., and processor
architectures).  All of those maintainers have about 2 weeks to
push patches, and then somewhere toward the end of that window,
Andrew will push his collected patches.  This is because Andrew
wants to make it easier on the subsystem maintainers -- he can
resolve patch conflicts easily (usually) in the -mm tree.

However, "all the stuff" in Andrew's tree won't be pushed.  He will
hold some of it back due to lack of maturity or known bugs or it just
being test-only code etc.  Anyway, we all just wait until it's been
pushed.


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

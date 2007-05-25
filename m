From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 25 May 2007 16:41:36 +0000
Subject: [KJ] Re: [PATCH] potential parse error in ifdef
Message-Id: <20070525094136.00be86ae.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87abvtfi9w.fsf@wanadoo.fr>
	<Pine.LNX.4.64.0705251349330.8531@twin.jikos.cz>
In-Reply-To: <Pine.LNX.4.64.0705251349330.8531@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@jikos.cz>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Fri, 25 May 2007 13:50:37 +0200 (CEST) Jiri Kosina <jikos@jikos.cz> wrote:

> On Fri, 25 May 2007, Yoann Padioleau wrote:
> 
> > I have made a tool to parse the kernel that does not pre-process the
> > source. That means that my parser tries to parse all the code, including
> > code in the #else branch or code that is not often compiled because
> > the driver is not very used (or not used at all). So, my parser
> > sometimes reports parse error not originally detected by gcc. 
> > Here is my (first) patch.
> >  drivers/char/watchdog/ixp2000_wdt.c |    2 +-
> >  drivers/mtd/devices/pmc551.c        |    2 +-
> >  drivers/mtd/nand/autcpu12.c         |    2 +-
> >  drivers/mtd/nand/ppchameleonevb.c   |    2 +-
> >  drivers/net/amd8111e.c              |    2 +-
> >  drivers/net/skfp/smt.c              |    2 +-
> >  drivers/scsi/aic7xxx/aic79xx_core.c |    2 +-
> >  sound/arm/sa11xx-uda1341.c          |    2 +-
> >  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> As these are totally independent fixes across various subsystems, you 
> should probably split the patch into per-subsystem patches and submit them 
> separately.

That's normally true, yes.  But for a bunch of obviously-better one-line
fixes in code which nobody has even compiled in ages, I think we can bend
the rules a bit and just slam it in.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

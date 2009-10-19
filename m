From: Greg KH <gregkh@suse.de>
Date: Mon, 19 Oct 2009 21:43:51 +0000
Subject: Re: [PATCH] staging/et131x:  adding __init/__exit macros
Message-Id: <20091019214351.GA15014@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290134.15295.PeterHuewe@gmx.de> <alpine.LSU.2.00.0909291107410.9280@wotan.suse.de> <200910191724.45300.PeterHuewe@gmx.de>
In-Reply-To: <200910191724.45300.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter H?we <PeterHuewe@gmx.de>
Cc: Jiri Kosina <jkosina@suse.cz>, Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 19, 2009 at 05:24:44PM +0200, Peter H?we wrote:
> Am Tuesday 29 September 2009 11:10:01 schrieb Jiri Kosina:
> > On Tue, 29 Sep 2009, Peter Huewe wrote:
> > > From: Peter Huewe <peterhuewe@gmx.de>
> > >
> > > Trivial patch which adds the __init/__exit macros to the module_init/
> > > module_exit functions of ./staging/et131x/et131x_initpci.c
> > >
> > > Greg, please have a look at the small patch and either pull it through
> > > your staging tree, or please ack' it so Jiri can pull it through the
> > > trivial tree.
> >
> > Greg -- I'd prefer you taking trivial staging fixes through yoru tree, as
> > I expect we'll be conflicting soon due to the speed of changes in staging
> > area, if you don't have any objections.
> >
> > Thanks,
> 
> 
> Hi Greg,
> 
> any updates on this patch?
> If I should recreate the patch against the linux-next tree, or your staging 
> tree, please tell me.
> 
> Same applies to 
> [PATCH] staging/cx25821:  adding __init/__exit macros
> [PATCH] staging/p9auth:  adding __init/__exit macros
> [PATCH] staging/phison:  adding __init/__exit macros
> and somewhat also to
> [PATCH] staging/panel: prevent driver from calling misc_deregister twice on 
> same ressource

These patches are still in my queue, sorry, been really busy, and am now
at the Linux kernel summit this week.  I should get to them next week
when I return.

thanks for your patience,

greg k-h

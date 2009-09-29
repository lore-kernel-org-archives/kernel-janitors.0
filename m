From: Greg KH <greg@kroah.com>
Date: Tue, 29 Sep 2009 15:30:39 +0000
Subject: Re: [PATCH] staging/et131x:  adding __init/__exit macros
Message-Id: <20090929153039.GA5020@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290134.15295.PeterHuewe@gmx.de> <alpine.LSU.2.00.0909291107410.9280@wotan.suse.de>
In-Reply-To: <alpine.LSU.2.00.0909291107410.9280@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: Peter Huewe <PeterHuewe@gmx.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Tue, Sep 29, 2009 at 11:10:01AM +0200, Jiri Kosina wrote:
> On Tue, 29 Sep 2009, Peter Huewe wrote:
> 
> > From: Peter Huewe <peterhuewe@gmx.de>
> > 
> > Trivial patch which adds the __init/__exit macros to the module_init/
> > module_exit functions of ./staging/et131x/et131x_initpci.c
> > 
> > Greg, please have a look at the small patch and either pull it through
> > your staging tree, or please ack' it so Jiri can pull it through the trivial tree.
> 
> Greg -- I'd prefer you taking trivial staging fixes through yoru tree, as 
> I expect we'll be conflicting soon due to the speed of changes in staging 
> area, if you don't have any objections.

No objection at all, I'll queue all of these up later today.

thanks,

greg k-h

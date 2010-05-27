From: Nicolas Palix <npalix@diku.dk>
Date: Thu, 27 May 2010 11:42:25 +0000
Subject: Re: [PATCH 6/17] arch/x86/kernel: Add missing spin_unlock
Message-Id: <201005271342.25619.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk> <20100527111136.GV3266@amd.com> <Pine.LNX.4.64.1005271317180.5422@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005271317180.5422@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Roedel, Joerg" <Joerg.Roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thursday 27 May 2010 13:17:58 Julia Lawall wrote:
> On Thu, 27 May 2010, Roedel, Joerg wrote:
> 
> > On Wed, May 26, 2010 at 11:55:59AM -0400, Julia Lawall wrote:
> > > The semantic match that finds this problem is as follows:
> > > (http://coccinelle.lip6.fr/)
> > > 
> > > // <smpl>
> > > @@
> > > expression E1;
> > > @@
> > > 
> > > * spin_lock(E1,...);
> > >   <+... when != E1
> > >   if (...) {
> > >     ... when != E1
> > > *   return ...;
> > >   }
> > >   ...+>
> > > * spin_unlock(E1,...);
> > > // </smpl>
> > 
> > Btw, I think it would be great to have a collection of these semantic
> > match scripts in the kernel repository together with a build target to
> > run these scripts over the kernel sources (like the cscope target).
> > Opinions?
> 
> We have submitted and received some feedback on an initial version of 
> this, but I'm not completely sure of the current status.

You can see the latest feedback we get at
http://lkml.org/lkml/2010/5/10/257

The initial submission and its comments are at
http://lkml.org/lkml/2010/4/26/269

> 
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Nicolas Palix
Tel: (+33) 1 44 27 87 25
Tel: (+33) 6 81 07 91 72
Web: http://www.diku.dk/~npalix/

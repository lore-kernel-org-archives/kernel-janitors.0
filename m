From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 11:17:58 +0000
Subject: Re: [PATCH 6/17] arch/x86/kernel: Add missing spin_unlock
Message-Id: <Pine.LNX.4.64.1005271317180.5422@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk>
 <20100527111136.GV3266@amd.com>
In-Reply-To: <20100527111136.GV3266@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Nicolas Palix <npalix@diku.dk>

On Thu, 27 May 2010, Roedel, Joerg wrote:

> On Wed, May 26, 2010 at 11:55:59AM -0400, Julia Lawall wrote:
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> > 
> > // <smpl>
> > @@
> > expression E1;
> > @@
> > 
> > * spin_lock(E1,...);
> >   <+... when != E1
> >   if (...) {
> >     ... when != E1
> > *   return ...;
> >   }
> >   ...+>
> > * spin_unlock(E1,...);
> > // </smpl>
> 
> Btw, I think it would be great to have a collection of these semantic
> match scripts in the kernel repository together with a build target to
> run these scripts over the kernel sources (like the cscope target).
> Opinions?

We have submitted and received some feedback on an initial version of 
this, but I'm not completely sure of the current status.

julia

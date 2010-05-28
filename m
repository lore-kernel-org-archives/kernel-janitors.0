From: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Date: Fri, 28 May 2010 07:11:15 +0000
Subject: Re: [PATCH 6/17] arch/x86/kernel: Add missing spin_unlock
Message-Id: <20100528071114.GA3266@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk>
 <20100527111136.GV3266@amd.com>
 <Pine.LNX.4.64.1005271317180.5422@ask.diku.dk>
 <201005271342.25619.npalix@diku.dk>
In-Reply-To: <201005271342.25619.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Julia Lawall <julia@diku.dk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, May 27, 2010 at 07:42:25AM -0400, Nicolas Palix wrote:
> > We have submitted and received some feedback on an initial version of 
> > this, but I'm not completely sure of the current status.
> 
> You can see the latest feedback we get at
> http://lkml.org/lkml/2010/5/10/257
> 
> The initial submission and its comments are at
> http://lkml.org/lkml/2010/4/26/269

I've also sent some feedback. Would be cool if you could work the
feedback in and do a repost asking Andrew to take it. Would be cool to
have this merged with 2.6.36.

	Joerg



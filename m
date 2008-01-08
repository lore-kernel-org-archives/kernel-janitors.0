From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 08 Jan 2008 18:52:56 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080108185255.GA4627@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org>
In-Reply-To: <20080108164015.GC31504@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com

On Tue, Jan 08, 2008 at 05:40:15PM +0100, Andi Kleen wrote:
> Here's a proposal for some useful code transformations the kernel janitors
> could do as opposed to running checkpatch.pl.
> 
> Most ioctl handlers still running implicitely under the big kernel 
> lock (BKL). But long term Linux is trying to get away from that. There is a new
> ->unlocked_ioctl entry point that allows ioctls without BKL, but the code
> needs to be explicitely converted to use this.
> 
> The first step of getting rid of the BKL is typically to make it visible
> in the source. Once it is visible people will have incentive to eliminate it.
> That is how the BKL conversion project for Linux long ago started too.
> On 2.0 all system calls were still implicitely BKL and in 2.1 the
> lock/unlock_kernel()s were moved into the various syscall functions and then
> step by step eliminated.
> 
> And now it's time to do the same for all the ioctls too.
> 
> So my proposal is to convert the ->ioctl handlers all over the tree 
> to ->unlocked_ioctl with explicit lock_kernel()/unlock_kernel.

Thanks, Andi! I think it'd very useful change.

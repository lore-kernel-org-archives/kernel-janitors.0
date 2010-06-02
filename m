From: Julia Lawall <julia@diku.dk>
Date: Wed, 02 Jun 2010 08:42:32 +0000
Subject: Re: [PATCH 6/17] arch/x86/kernel: Add missing spin_unlock
Message-Id: <Pine.LNX.4.64.1006021042220.21701@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk>
 <20100601141529.0c99f22c.akpm@linux-foundation.org> <20100602083837.GC21639@amd.com>
In-Reply-To: <20100602083837.GC21639@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, 2 Jun 2010, Roedel, Joerg wrote:

> Hi Andrew,
> 
> On Tue, Jun 01, 2010 at 05:15:29PM -0400, Andrew Morton wrote:
> > The reason why these bugs occur is that we sprinkle multiple `return'
> > statements inside the middle of non-trivial functions.  People miss
> > some or fail to modify some when later changing locking rules and we
> > gain bugs (or, similarly, resource leaks).
> 
> Right. I changed that in Julia's patch too before merging it into my
> tree. It is already in -tip. See
> http://git.kernel.org/tip/84fe6c19e4a598e8071e3bd1b2c923454eae1268

Thanks.  That looks fine.

julia

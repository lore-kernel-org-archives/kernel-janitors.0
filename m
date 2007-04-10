From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 10 Apr 2007 22:08:04 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <20070410220804.GI26692@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site> <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr> <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6> <Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr> <ada7isjq52p.fsf@cisco.com> <Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Roland Dreier <rdreier@cisco.com>, kernelnewbies@nl.linux.org, kernel-janitors@lists.osdl.org, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org

On Tue, Apr 10, 2007 at 05:45:07PM -0400, Robert P. J. Day wrote:
> that works fine if you're defining a single spinlock, but what do you
> do in cases like this:
> 
> arch/sparc/lib/atomic32.c:      [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
> 
> that is, when you're assigning an array of them?  you still need some
> kind of generic, unnamed spinlock in those circumstances, no?

That's a special case for architecture-only code.  It's not to be used
by drivers.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

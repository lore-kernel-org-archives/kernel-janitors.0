From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 01 Feb 2007 14:39:05 +0000
Subject: Re: [KJ] can someone clarify the changes to the spinlock API?
Message-Id: <20070201143905.GN7585@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010732070.14212@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010732070.14212@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 01, 2007 at 07:50:08AM -0500, Robert P. J. Day wrote:
> note carefully how the (now deprecated) SPIN_LOCK_UNLOCKED macro was
> utterly generic -- it didn't need any args, so you could easily
> allocate an array of them in one go:
> 
>   arch/sparc/lib/atomic32.c:  [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED

Is there anyone other than sparc32 creating an array of spinlocks?
On parisc, we use an array of raw_spinlock_t, and I suspect sparc32
should do the same.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

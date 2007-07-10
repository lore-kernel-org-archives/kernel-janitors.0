From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 10 Jul 2007 11:59:19 +0000
Subject: Re: BLK question
Message-Id: <20070710115919.GM9704@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710021217.GB19502@motherbox.xtechq.com.ar>
In-Reply-To: <20070710021217.GB19502@motherbox.xtechq.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 09, 2007 at 11:12:17PM -0300, Diego Woitasen wrote:
> 	I want to know is BLK is really deprecated. I see that is used
> 	in many places in the kernel, but the comments in the blk code
> 	say "Don't use in new code".

It really is deprecated, but it really is hard to get rid of too.  We've
been trying since 2.1 (that's 1996).

> 	For example, reading the driver/pci/syscall.c I see that
> 	sys_pciconfig_write() and sys_pciconfig_read() use it to control
> 	the concurrency between these calls. Could this
> 	lock_kernel()/unlock_kernel() be replaced by a local mutex?

It's not that easy.  lock_kernel() synchronises with *all* other places
that call lock_kernel().  There's no need for sys_pciconfig_write() and
sys_pciconfig_read() to be non-concurrent.  It's a matter of both of
these routines needing to be safe against PCI device removal.

Now, things have changed since this code was first written.  We should
be using pci_get_slot() and pci_dev_put() to hold a reference to the
pci_dev, and then we can get rid of the lock_kernel().  I'll send a
patch later today.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

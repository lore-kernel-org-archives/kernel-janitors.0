From: Josh Triplett <josh@joshtriplett.org>
Date: Fri, 28 Sep 2012 20:41:27 +0000
Subject: Re: [tip:x86/efi 7/11] arch/ia64/kernel/efi.c:629:1: error: redefinition of 'efi_enter_virtual_mode'
Message-Id: <20120928204127.GA6649@jtriplet-mobl1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928023751.GC9155@localhost>
In-Reply-To: <20120928023751.GC9155@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2012 at 12:10:28PM -0700, Josh Triplett wrote:
> On Fri, Sep 28, 2012 at 10:37:51AM +0800, Fengguang Wu wrote:
> > Hi Josh,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/efi
> > head:   ba49efa14f97ca6fe57390539e70a359aea779cd
> > commit: f383a1e37bc3fc93d19ed23dfdb1adfc5a7d1010 [7/11] efi: Add a stub for efi_enter_virtual_mode on non-x86
> > config: ia64-alldefconfig
> > 
> > All error/warnings:
> > 
> > arch/ia64/kernel/efi.c:629:1: error: redefinition of 'efi_enter_virtual_mode'
> > include/linux/efi.h:501:13: note: previous definition of 'efi_enter_virtual_mode' was here
> > 
> > vim +629 arch/ia64/kernel/efi.c
> > 
> > ^1da177e (Linus Torvalds 2005-04-16  623) 
> > ^1da177e (Linus Torvalds 2005-04-16  624) 	efi_map_pal_code();
> > ^1da177e (Linus Torvalds 2005-04-16  625) 	efi_enter_virtual_mode();
> > ^1da177e (Linus Torvalds 2005-04-16  626) }
> > ^1da177e (Linus Torvalds 2005-04-16  627) 
> > ^1da177e (Linus Torvalds 2005-04-16  628) void
> > ^1da177e (Linus Torvalds 2005-04-16 @629) efi_enter_virtual_mode (void)
> > ^1da177e (Linus Torvalds 2005-04-16  630) {
> > ^1da177e (Linus Torvalds 2005-04-16  631) 	void *efi_map_start, *efi_map_end, *p;
> > ^1da177e (Linus Torvalds 2005-04-16  632) 	efi_memory_desc_t *md;
> 
> Gah, ia64 has efi_enter_virtual_mode function too; I must have missed it
> when searching.  I'll have to separate that stub into a separate #ifdef
> block for non-x86 non-ia64.

Actually, it looks like ia64's efi_enter_virtual_mode gets called from a
different point (namely ia64's efi_init).  So, I can't use this stub to
eliminate the CONFIG_X86 #ifdef in init/main.c at all, because it really
does apply only to X86, not to IA64.

At this point I think I'll just stop trying to eliminate that particular
#ifdef.

- Josh Triplett

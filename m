From: Marcelo Tosatti <marcelo.tosatti@cyclades.com.br>
Date: Mon, 01 Mar 2004 14:32:53 +0000
Subject: [Kernel-janitors] Re: finding unused globals in the kernel
Message-Id: <Pine.LNX.4.44.0402282059580.2546-100000@dmt.cyclades>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <200402282213.34657.arnd@arndb.de>
References: <5138.1078121472@kao2.melbourne.sgi.com>
In-Reply-To: <5138.1078121472@kao2.melbourne.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org


On Sat, 28 Feb 2004, Arnd Bergmann wrote:

> I've been looking for a way to find symbols in the kernel that
> are not referenced anywhere and could be removed. This script is
> what I came up with, it's rather slow and complicated, but I have
> managed to find quite a bit of dead code with it.
> 
> It will also write a message for symbols that are both defined
> static and global in some places, that information is available
> for free here.
> 
> Going through the output might be a long-term task for the
> janitors.
> 
> As an example, I'm including the output of the script for the
> current i386 defconfig.

<snip>

> bash /home/arnd/linux-2.6-ipc/scripts/checkunused.sh i386 arch/i386/kernel/head.o arch/i386/kernel/init_task.o   init/built-in.o  usr/built-in.o  arch/i386/kernel/built-in.o  arch/i386/mm/built-in.o  arch/i386/mach-default/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  lib/lib.a  arch/i386/lib/lib.a  lib/built-in.o  arch/i386/lib/built-in.o  drivers/built-in.o  sound/built-in.o  arch/i386/pci/built-in.o  arch/i386/oprofile/built-in.o  arch/i386/power/built-in.o  net/built-in.o
> unreferenced definition VSYSCALL_BASE

Hi Arnd,

It seems your script is behaving wrongly for the VSYSCALL_BASE case 
(probably others too):

elf.h:

#define VSYSCALL_BASE   (__fix_to_virt(FIX_VSYSCALL))
#define VSYSCALL_EHDR   ((const struct elfhdr *) VSYSCALL_BASE)
#define VSYSCALL_ENTRY  ((unsigned long) &__kernel_vsyscall)
extern void __kernel_vsyscall;






_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

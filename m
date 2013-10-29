From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:53:48 +0000
Subject: [PATCH 0/14] JANITOR: Remove include/linux/sys.h
Message-Id: <20131029095347.GA12832@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

File include/linux/sys.h has a comment stating that the "file is no longer used or needed",
but it is still included in multiple places under several architectures. It does contain
bunch of #define's but those have been #ifdef'd out, and grepping did not show any uses
of those #define's in the source tree outside this file.

The uses of the file seem partially be accidental remains of some old use, but almost all
are in architecture specific code with only one outside in file net/core/pktgen.c. So this
patchset has been divided to 14 parts, addressing 12 architectures (c6x, cris, frv, h8300,
microblaze, mips, mn10300, parisc, powerpc, sh, unicore32 and x86) and the outlier in net
and then the final patch removes the file itself. All patches can be applied invidually
with the obvious exception of the last one which actually removes the file and should be
last.

Diffstat:
 arch/c6x/kernel/entry.S                    |  1 -
 arch/cris/arch-v10/kernel/entry.S          |  1 -
 arch/cris/arch-v32/kernel/entry.S          |  1 -
 arch/frv/kernel/cmode.S                    |  1 -
 arch/frv/kernel/entry-table.S              |  1 -
 arch/frv/kernel/sleep.S                    |  1 -
 arch/frv/mm/tlb-flush.S                    |  1 -
 arch/frv/mm/tlb-miss.S                     |  1 -
 arch/h8300/kernel/entry.S                  |  1 -
 arch/h8300/kernel/syscalls.S               |  1 -
 arch/microblaze/kernel/entry.S             |  1 -
 arch/microblaze/kernel/misc.S              |  1 -
 arch/microblaze/kernel/sys_microblaze.c    |  1 -
 arch/mips/kernel/process.c                 |  1 -
 arch/mn10300/kernel/entry.S                |  1 -
 arch/mn10300/kernel/gdb-io-serial-low.S    |  1 -
 arch/mn10300/kernel/gdb-io-ttysm-low.S     |  1 -
 arch/mn10300/kernel/gdb-low.S              |  1 -
 arch/mn10300/kernel/mn10300-serial-low.S   |  1 -
 arch/mn10300/kernel/mn10300-watchdog-low.S |  1 -
 arch/mn10300/kernel/profile-low.S          |  1 -
 arch/mn10300/kernel/smp-low.S              |  1 -
 arch/mn10300/kernel/switch_to.S            |  1 -
 arch/mn10300/mm/cache-dbg-flush-by-reg.S   |  1 -
 arch/mn10300/mm/cache-dbg-flush-by-tag.S   |  1 -
 arch/mn10300/mm/cache-dbg-inv-by-reg.S     |  1 -
 arch/mn10300/mm/cache-dbg-inv-by-tag.S     |  1 -
 arch/mn10300/mm/cache-dbg-inv.S            |  1 -
 arch/mn10300/mm/cache-flush-by-reg.S       |  1 -
 arch/mn10300/mm/cache-flush-by-tag.S       |  1 -
 arch/mn10300/mm/cache-inv-by-reg.S         |  1 -
 arch/mn10300/mm/cache-inv-by-tag.S         |  1 -
 arch/mn10300/mm/tlb-mn10300.S              |  1 -
 arch/parisc/hpux/entry_hpux.S              |  1 -
 arch/powerpc/kernel/entry_32.S             |  1 -
 arch/powerpc/kernel/misc_32.S              |  1 -
 arch/powerpc/kernel/misc_64.S              |  1 -
 arch/powerpc/kernel/syscalls.c             |  1 -
 arch/powerpc/lib/checksum_32.S             |  1 -
 arch/powerpc/lib/checksum_64.S             |  1 -
 arch/sh/boards/mach-ap325rxa/sdram.S       |  1 -
 arch/sh/boards/mach-ecovec24/sdram.S       |  1 -
 arch/sh/boards/mach-kfr2r09/sdram.S        |  1 -
 arch/sh/boards/mach-migor/sdram.S          |  1 -
 arch/sh/boards/mach-se/7724/sdram.S        |  1 -
 arch/sh/kernel/cpu/sh3/entry.S             |  1 -
 arch/sh/kernel/cpu/sh3/swsusp.S            |  1 -
 arch/sh/kernel/cpu/sh5/entry.S             |  1 -
 arch/sh/kernel/cpu/shmobile/sleep.S        |  1 -
 arch/sh/kernel/debugtraps.S                |  1 -
 arch/sh/kernel/syscalls_32.S               |  1 -
 arch/sh/kernel/syscalls_64.S               |  2 --
 arch/unicore32/kernel/hibernate_asm.S      |  1 -
 arch/x86/ia32/syscall_ia32.c               |  1 -
 arch/x86/kernel/syscall_32.c               |  1 -
 arch/x86/kernel/syscall_64.c               |  1 -
 arch/x86/um/sys_call_table_32.c            |  1 -
 arch/x86/um/sys_call_table_64.c            |  1 -
 include/linux/sys.h                        | 29 -----------------------------
 net/core/pktgen.c                          |  1 -
 60 files changed, 89 deletions(-)

Compile tested only on x86, but should be obviously correct since the symbols are
not defined or used anywhere.

The patchset is also available in my personal github tree as a branch janitor_retire_sys_h:
https://github.com/mikukkon/linux/tree/janitor_retire_sys_h.

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>

--MiKu


From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 26 Jul 2012 10:23:40 +0000
Subject: [s390:for-linus 5/5] arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of functi
Message-Id: <20120726102340.GA15269@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

Kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git for-linus
head:   fb70554e705cb201222a1a7c7b2e94c6522886fa
commit: fb70554e705cb201222a1a7c7b2e94c6522886fa [5/5] s390/mm: downgrade page table after fork of a 31 bit process
config: s390-allnoconfig (attached as .config)

All related error/warning messages:

In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/airq.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/chsc.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/cio.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/css.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/itcw.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/fcx.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/isc.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/device_fsm.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/device_status.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/cmf.c:33:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/device_ops.c:7:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/cio/device.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from init/main.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from init/do_mounts.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from init/version.c:10:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/bitmap.c:10:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/traps.c:27:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/time.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/elfcore.h:12,
                 from arch/s390/kernel/process.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/early.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/setup.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from arch/s390/kernel/processor.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from arch/s390/kernel/ptrace.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/cpcmd.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/ebcdic.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/nmi.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/debug.c:23:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/irq.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/ipl.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/dis.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/diag.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/mem_detect.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/vdso.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/jump_label.c:7:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/kernel/lgr.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/mm/fault.c:27:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/mm/extmem.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/mm/mmap.c:28:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/mm/vmem.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/mm/pgtable.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/fork.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/exec_domain.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/panic.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/printk.c:27:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/exit.c:10:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/sysctl.c:21:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/params.c:21:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/lglock.c:2:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/extable.c:20:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/kmod.c:21:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/kallsyms.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/rcutiny_plugin.h:26,
                 from kernel/rcutiny.c:54:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from mm/memory.c:58:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/fremap.c:19:0:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/mmap.c:38:0:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/page_alloc.c:28:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/vmscan.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/vmstat.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/percpu.c:62:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/mmu_context.c:11:0:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/backing-dev.c:10:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/slub.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
mm/slub.c: In function 'put_cpu_partial':
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
mm/slub.c:2007:1: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from mm/vmalloc.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/filesystems.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/open.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/file_table.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/char_dev.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/exec.c:43:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/pipe.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/fcntl.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/block_dev.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/direct-io.c:23:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/anon_inodes.c:18:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/binfmt_script.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/locks.c:122:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from security/commoncap.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-map.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-ioc.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-settings.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-softirq.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-timeout.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-iopoll.c:6:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/elevator.c:30:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/genhd.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-core.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-tag.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-sysfs.c:6:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-flush.c:68:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/scsi_ioctl.c:22:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/partition-generic.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-lib.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/noop-iosched.c:7:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-exec.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from block/blk-merge.c:5:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/class.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/cpu.c:6:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/platform.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/firmware.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/map.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/devres.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/attribute_container.c:20:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/topology.c:29:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/firmware_class.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/core.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/bus.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/dd.c:22:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/syscore.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/base/driver.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/char/random.c:234:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/char/misc.c:36:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/char/sclp_quiesce.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/char/sclp_cmd.c:20:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/char/keyboard.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/s390/char/sclp.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from net/nonet.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_io.c:90:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_ldisc.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_ioctl.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_buffer.c:18:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/n_tty.c:51:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/pty.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_mutex.c:2:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from drivers/tty/tty_port.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/lib/usercopy.c:1:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/lib/div64.c:9:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/lib/ucmpdi2.c:1:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/lib/delay.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from arch/s390/lib/string.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from lib/sort.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from lib/list_sort.c:2:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from lib/vsprintf.c:20:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from lib/extable.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from lib/bug.c:41:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/timekeeping.c:11:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/ntp.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/clocksource.c:29:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/jiffies.c:25:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/timer_list.c:14:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/timecompare.c:21:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/timeconv.c:31:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/time/clockevents.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from kernel/sched/core.c:30:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/devpts/inode.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/proc_sysctl.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/proc_tty.c:8:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/generic.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/base.c:71:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/root.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/proc/inode.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from fs/proc/task_mmu.c:15:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/file.c:13:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/dir.c:17:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/symlink.c:16:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/mount.c:19:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/bin.c:21:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/s390/include/asm/elf.h:130:0,
                 from include/linux/elf.h:7,
                 from include/linux/module.h:14,
                 from fs/sysfs/group.c:12:
arch/s390/include/asm/mmu_context.h: In function 'arch_dup_mmap':
arch/s390/include/asm/mmu_context.h:97:3: error: implicit declaration of function 'crst_table_downgrade' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +97 arch/s390/include/asm/mmu_context.h
    94					 struct mm_struct *mm)
    95	{
    96		if (oldmm->context.asce_limit < mm->context.asce_limit)
  > 97			crst_table_downgrade(mm, oldmm->context.asce_limit);
    98	}
    99	
   100	static inline void arch_exit_mmap(struct mm_struct *mm)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=".config"

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 3.5.0 Kernel Configuration
#
CONFIG_MMU=y
CONFIG_ZONE_DMA=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_NO_IOMEM=y
CONFIG_NO_DMA=y
# CONFIG_ARCH_DMA_ADDR_T_64BIT is not set
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_HAVE_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
# CONFIG_EXPERIMENTAL is not set
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
# CONFIG_SYSVIPC is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_FHANDLE is not set
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_KTIME_SCALAR=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BUILD=y

#
# Timers subsystem
#
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_PREEMPT_RCU is not set
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_IKCONFIG is not set
CONFIG_LOG_BUF_SHIFT=17
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_KALLSYMS=y
CONFIG_HOTPLUG=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_SYSCALL_WRAPPERS=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_ARCH_MUTEX_CPU_RELAX=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y

#
# GCOV-based kernel profiling
#
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_INIT_ALL_POSSIBLE=y
CONFIG_BLOCK=y
# CONFIG_LBDAF is not set
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
# CONFIG_IOSCHED_DEADLINE is not set
# CONFIG_IOSCHED_CFQ is not set
CONFIG_DEFAULT_NOOP=y
CONFIG_DEFAULT_IOSCHED="noop"
CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_SPIN_TRYLOCK=y
CONFIG_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_INLINE_SPIN_LOCK=y
CONFIG_INLINE_SPIN_LOCK_BH=y
CONFIG_INLINE_SPIN_LOCK_IRQ=y
CONFIG_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_INLINE_SPIN_UNLOCK_BH=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_READ_TRYLOCK=y
CONFIG_INLINE_READ_LOCK=y
CONFIG_INLINE_READ_LOCK_BH=y
CONFIG_INLINE_READ_LOCK_IRQ=y
CONFIG_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_BH=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_INLINE_WRITE_TRYLOCK=y
CONFIG_INLINE_WRITE_LOCK=y
CONFIG_INLINE_WRITE_LOCK_BH=y
CONFIG_INLINE_WRITE_LOCK_IRQ=y
CONFIG_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_BH=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE=y
# CONFIG_MUTEX_SPIN_ON_OWNER is not set
# CONFIG_FREEZER is not set

#
# Base setup
#

#
# Processor type and features
#
# CONFIG_64BIT is not set
CONFIG_32BIT=y
# CONFIG_SMP is not set
# CONFIG_SCHED_MC is not set
# CONFIG_MATHEMU is not set
CONFIG_AUDIT_ARCH=y
# CONFIG_HAVE_MARCH_Z900_FEATURES is not set
# CONFIG_HAVE_MARCH_Z990_FEATURES is not set
# CONFIG_HAVE_MARCH_Z9_109_FEATURES is not set
# CONFIG_HAVE_MARCH_Z10_FEATURES is not set
# CONFIG_HAVE_MARCH_Z196_FEATURES is not set

#
# Code generation options
#
CONFIG_MARCH_G5=y
# CONFIG_MARCH_Z900 is not set
# CONFIG_MARCH_Z990 is not set
# CONFIG_MARCH_Z9_109 is not set
# CONFIG_MARCH_Z10 is not set
# CONFIG_MARCH_Z196 is not set
# CONFIG_PACK_STACK is not set
# CONFIG_CHECK_STACK is not set
# CONFIG_WARN_DYNAMIC_STACK is not set

#
# Kernel preemption
#
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
# CONFIG_MIGRATION is not set
# CONFIG_PHYS_ADDR_T_64BIT is not set
CONFIG_ZONE_DMA_FLAG=1
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set

#
# I/O subsystem configuration
#
# CONFIG_QDIO is not set
# CONFIG_CHSC_SCH is not set

#
# Misc
#
# CONFIG_BINFMT_ELF is not set
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_FORCE_MAX_ZONEORDER=9
# CONFIG_PFAULT is not set
# CONFIG_SHARED_KERNEL is not set
# CONFIG_CMM is not set
# CONFIG_APPLDATA_BASE is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_SCHED_HRTICK is not set
# CONFIG_S390_HYPFS_FS is not set
# CONFIG_KEXEC is not set
# CONFIG_ZFCPDUMP is not set
# CONFIG_SECCOMP is not set

#
# Power Management
#
# CONFIG_PM_RUNTIME is not set
# CONFIG_NET is not set
# CONFIG_PCMCIA is not set
CONFIG_CCW=y

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=y
# CONFIG_FIRMWARE_IN_KERNEL is not set
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_SYS_HYPERVISOR is not set
CONFIG_GENERIC_CPU_DEVICES=y
# CONFIG_BLK_DEV is not set

#
# Misc devices
#
# CONFIG_ENCLOSURE_SERVICES is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set

#
# Texas Instruments shared transport line discipline
#

#
# Altera FPGA firmware download module
#

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
# CONFIG_MD is not set

#
# Character devices
#
CONFIG_UNIX98_PTYS=y
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVKMEM is not set
# CONFIG_HVC_IUCV is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_R3964 is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_HANGCHECK_TIMER is not set

#
# S/390 character device drivers
#
# CONFIG_TN3270 is not set
# CONFIG_TN3215 is not set
# CONFIG_SCLP_TTY is not set
# CONFIG_SCLP_VT220_TTY is not set
# CONFIG_SCLP_CPI is not set
# CONFIG_SCLP_ASYNC is not set
# CONFIG_S390_TAPE is not set
# CONFIG_VMCP is not set
# CONFIG_MONWRITER is not set
# CONFIG_S390_VMUR is not set
# CONFIG_HSI is not set

#
# PPS support
#

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable Device Drivers -> PPS to see the PTP clock options.
#
# CONFIG_POWER_SUPPLY is not set
# CONFIG_POWER_AVS is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
# CONFIG_REGULATOR is not set
# CONFIG_USB_ARCH_HAS_OHCI is not set
# CONFIG_USB_ARCH_HAS_EHCI is not set
# CONFIG_USB_ARCH_HAS_XHCI is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_AUXDISPLAY is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_BALLOON is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set

#
# Hardware Spinlock drivers
#
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers (EXPERIMENTAL)
#

#
# Rpmsg drivers (EXPERIMENTAL)
#
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_FS_POSIX_ACL is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FSNOTIFY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
# CONFIG_HUGETLB_PAGE is not set
# CONFIG_CONFIGFS_FS is not set
# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NLS is not set

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
# CONFIG_PRINTK_TIME is not set
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
# CONFIG_ENABLE_WARN_DEPRECATED is not set
# CONFIG_ENABLE_MUST_CHECK is not set
CONFIG_FRAME_WARN=1024
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_DEBUG_FS is not set
# CONFIG_HEADERS_CHECK is not set
# CONFIG_DEBUG_SECTION_MISMATCH is not set
# CONFIG_DEBUG_KERNEL is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
# CONFIG_SPARSE_RCU_POINTER is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_SAMPLES is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_STRICT_DEVMEM is not set
# CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
# CONFIG_CRYPTO is not set
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
# CONFIG_GENERIC_IO is not set
# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
# CONFIG_CRC32 is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_XZ_DEC is not set
# CONFIG_XZ_DEC_BCJ is not set
# CONFIG_AVERAGE is not set
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
# CONFIG_VIRTUALIZATION is not set

--NzB8fVQJ5HfG6fxh--

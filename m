From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:37:05 +0000
Subject: [signal:arch-sh 1/2] (.data+0x1bc): undefined reference to `sys_sh_pipe'
Message-Id: <20121015023705.GA15472@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-sh
head:   c366433956b536324357513f03f1fe6264d8ff98
commit: 4d2fef5f3f0f7cf0ea1a19f63dc8f6637ce41b5c [1/2] sh: switch to generic kernel_thread()/kernel_execve()
config: sh-allnoconfig # make ARCH=sh allnoconfig

All error/warnings:

arch/sh/kernel/cpu/sh2/../../entry-common.S: Assembler messages:
arch/sh/kernel/cpu/sh2/../../entry-common.S:375: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence
arch/sh/kernel/cpu/sh2/../../entry-common.S:378: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence
--
arch/sh/kernel/built-in.o: In function `sys_call_table':
(.data+0x1bc): undefined reference to `sys_sh_pipe'
arch/sh/kernel/built-in.o: In function `sys_call_table':
(.data+0x3e4): undefined reference to `sys_pread_wrapper'
arch/sh/kernel/built-in.o: In function `sys_call_table':
(.data+0x3e8): undefined reference to `sys_pwrite_wrapper'
arch/sh/kernel/built-in.o: In function `sys_call_table':
(.data+0x554): undefined reference to `sys_fadvise64_64_wrapper'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

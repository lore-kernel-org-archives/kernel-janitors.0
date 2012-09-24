From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 24 Sep 2012 01:29:49 +0000
Subject: [next:akpm 339/377] fs/binfmt_elf.c:1378:56: error: unknown type name 'compat_siginfo_t'
Message-Id: <20120924012949.GA9140@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Denys,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
commit: 50abbe878f885ac855d56b30f0bf08fd208dc87d [339/377] coredump: add a new elf note with siginfo of the signal
config: tile-tilegx_defconfig

All related error/warning messages:

In file included from fs/compat_binfmt_elf.c:22:0:
arch/tile/include/asm/sigframe.h:28:18: error: field 'uc' has incomplete type
In file included from fs/compat_binfmt_elf.c:140:0:
fs/binfmt_elf.c:1378:56: error: unknown type name 'compat_siginfo_t'
fs/binfmt_elf.c:1703:2: error: unknown type name 'compat_siginfo_t'
fs/binfmt_elf.c: In function 'fill_note_info':
fs/binfmt_elf.c:1786:2: error: implicit declaration of function 'fill_siginfo_note' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

arch/tile/include/asm/sigframe.h:28:18: error: field 'uc' has incomplete type

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

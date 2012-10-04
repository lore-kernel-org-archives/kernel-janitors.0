From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Oct 2012 06:35:58 +0000
Subject: [uapi:disintegrate-all 39/107] arch/tile/include/asm/ptrace.h:124:14: error: expected ':', ',', ';',
Message-Id: <20121004063558.GA29644@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/dhowells/linux-headers.git disintegrate-all
head:   24eb0a7ff47bc543d88a3366b445c10bff5fa5d6
commit: 2be36cb49bc8003f113cefc878afd8ace2f44d9b [39/107] UAPI: (Scripted) Disintegrate include/linux
config: tile-tilegx_defconfig

All error/warnings:

In file included from include/uapi/linux/ptrace.h:77:0,
                 from include/linux/ptrace.h:4,
                 from arch/tile/include/asm/elf.h:24,
                 from include/linux/elf.h:4,
                 from include/linux/elfcore-compat.h:4,
                 from fs/compat_binfmt_elf.c:20:
arch/tile/include/asm/ptrace.h:124:14: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token

vim +124 arch/tile/include/asm/ptrace.h

867e359b (Chris Metcalf 2010-05-28  118)  * A structure for all single-stepper state.
867e359b (Chris Metcalf 2010-05-28  119)  *
867e359b (Chris Metcalf 2010-05-28  120)  * Also update defines in assembler section if it changes
867e359b (Chris Metcalf 2010-05-28  121)  */
867e359b (Chris Metcalf 2010-05-28  122) struct single_step_state {
867e359b (Chris Metcalf 2010-05-28  123) 	/* the page to which we will write hacked-up bundles */
0707ad30 (Chris Metcalf 2010-06-25 @124) 	void __user *buffer;
867e359b (Chris Metcalf 2010-05-28  125) 
867e359b (Chris Metcalf 2010-05-28  126) 	union {
867e359b (Chris Metcalf 2010-05-28  127) 		int flags;

The code at line 124 was first introduced by commit:
0707ad3 arch/tile: Miscellaneous cleanup changes.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

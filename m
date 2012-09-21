From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 10:56:35 +0000
Subject: [next:akpm 202/376] arch/sh/kernel/ioport.c:14:15: error: conflicting type qualifiers for 'sh_io_por
Message-Id: <20120921105635.GA13728@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andi,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   69921c36f9e0e4e7952fa2583bf2d33713835eaf
commit: 11f7c1c694b94586a232a50eebdd623255d60d72 [202/376] sections: fix section conflicts in arch/sh
config: sh-titan_defconfig

All related error/warning messages:

arch/sh/kernel/ioport.c:14:15: error: conflicting type qualifiers for 'sh_io_port_base'
In file included from include/linux/io.h:22:0,
                 from arch/sh/kernel/ioport.c:12:
arch/sh/include/asm/io.h:137:28: note: previous declaration of 'sh_io_port_base' was here
arch/sh/kernel/ioport.c:15:1: error: conflicting type qualifiers for 'sh_io_port_base'
In file included from include/linux/io.h:22:0,
                 from arch/sh/kernel/ioport.c:12:
arch/sh/include/asm/io.h:137:28: note: previous declaration of 'sh_io_port_base' was here

vim +14 arch/sh/kernel/ioport.c
     8	 * License.  See the file "COPYING" in the main directory of this archive
     9	 * for more details.
    10	 */
    11	#include <linux/module.h>
    12	#include <linux/io.h>
    13	
  > 14	unsigned long sh_io_port_base __read_mostly = -1;
    15	EXPORT_SYMBOL(sh_io_port_base);
    16	
    17	void __iomem *__ioport_map(unsigned long addr, unsigned int size)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

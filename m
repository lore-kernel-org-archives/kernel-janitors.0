From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 10:42:43 +0000
Subject: WARNING: vmlinux.o(.meminit.text+0x1228): Section mismatch in reference from the function .free_area
Message-Id: <20121014104243.GB10836@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Xishi,

FYI, there are new compile warnings show up in

commit: ca57df79d4f64e1a4886606af4289d40636189c5  mm: setup pageblock_order before it's used by sparsemem
config: powerpc-allyesconfig # make ARCH=powerpc allyesconfig

All warnings:

WARNING: vmlinux.o(.meminit.text+0x1228): Section mismatch in reference from the function .free_area_init_core.isra.34() to the function .init.text:.set_pageblock_order()
The function __meminit .free_area_init_core.isra.34() references
a function __init .set_pageblock_order().
If .set_pageblock_order is only used by .free_area_init_core.isra.34 then
annotate .set_pageblock_order with a matching annotation.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

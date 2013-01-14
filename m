From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 14 Jan 2013 16:19:02 +0000
Subject: build regressions 2013-01-14
Message-Id: <50f42ff6.WeKPM4vXzsgZIheJ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
initramfs.c:(.init.text+0x22c1): undefined reference to `__initramfs_size'
initramfs.c:(.init.text+0x228c): undefined reference to `__initramfs_size'
initramfs.c:(.init.text+0x228c): undefined reference to `__initramfs_size'

[warnings]
arch/x86/mm/init_64.c:965:9: warning: 'next' may be used uninitialized in this function [-Wmaybe-uninitialized]
security/integrity/digsig.c:114:2: warning: passing argument 2 of 'mpi_read_from_buffer' from incompatible pointer type [enabled by default]
mm/memory_hotplug.c:1089:29: warning: the address of 'contig_page_data' will always evaluate as 'true' [-Waddress]

[sparse]
include/net/ipv6.h:555:26: sparse: cast to restricted __be32
include/net/ipv6.h:555:63: sparse: restricted __be32 degrades to integer
include/net/ipv6.h:555:24: sparse: incorrect type in assignment (different base types)
net/ipv6/ip6_output.c:406:56: sparse: restricted __be16 degrades to integer
mm/fremap.c:209:45: sparse: implicit cast to nocast type

[smatch]
mm/mlock.c:447 __mm_populate() error: potential NULL dereference 'vma'.
drivers/rtc/rtc-rx4581.c:134 rx4581_get_datetime() warn: unsigned 'err' is never less than zero.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

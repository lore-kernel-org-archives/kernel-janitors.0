From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 13 Nov 2012 16:06:56 +0000
Subject: build regressions 2012-11-13
Message-Id: <50a27020.qtmtr/V0P0og5lR1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/tty/serial/atmel_serial.c:161: error: 'ATMEL_MAX_UART' undeclared here (not in a function)
arch/mips/kernel/traps.c:1822:6: error: token "[" is not valid in preprocessor expressions
arch/mips/kernel/traps.c:1822:6: error: "cpu_data" is not defined [-Werror=undef]
fs/pstore/platform.c:175:3: error: too few arguments to function 'psinfo->write'

[warnings]
drivers/media/usb/gspca/cpia1.c:1630:13: warning: unused variable 'sd' [-Wunused-variable]
arch/mips/kernel/traps.c:1822:6: warning: "cpu_data" is not defined [-Wundef]
fs/pstore/platform.c:175:3: warning: passing argument 6 of 'psinfo->write' makes integer from pointer without a cast [enabled by default]
drivers/media/v4l2-core/videobuf-core.c:402:3: warning: enumeration value 'V4L2_MEMORY_DMABUF' not handled in switch [-Wswitch]
warning: (VIDEOBUF2_CORE && VIDEOBUF2_DMA_CONTIG && VIDEOBUF2_VMALLOC && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
warning: (VIDEOBUF2_CORE && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
warning: (VIDEOBUF2_CORE && VIDEOBUF2_DMA_CONTIG && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
drivers/net/ethernet/mellanox/mlx4/resource_tracker.c:1918:10: warning: 'eq' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
fs/pstore/platform.c:175:67: sparse: incorrect type in argument 6 (different base types)
fs/pstore/platform.c:175:30: sparse: not enough arguments for function write

[smatch]
drivers/staging/media/dt3155v4l/dt3155v4l.c:419 dt3155_open() warn: inconsistent returns mutex:&pd->mux: locked (401,413) unlocked (385,419)
drivers/media/v4l2-core/videobuf2-core.c:1048 __qbuf_dmabuf() warn: function puts 504 bytes on stack

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

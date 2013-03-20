From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 20 Mar 2013 16:51:28 +0000
Subject: build regressions 2013-03-20
Message-Id: <5149e910.cIdoNF21acURZKz0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
security/smack/smackfs.c:2130:29: error: 'SMACK_MAGIC' undeclared (first use in this function)
drivers/staging/zcache/zcache-main.c:303:2: error: request for member 'flags' in something not a structure or union
drivers/staging/zcache/zcache-main.c:303:2: error: request for member 'virtual' in something not a structure or union
make[1]: *** No rule to make target `lib/lz4/lz4hc_compress.o'.
drivers/remoteproc/remoteproc_internal.h:112:19: error: 'const struct rproc_fw_ops' has no member named 'get_rsctab_addr'
drivers/remoteproc/remoteproc_internal.h:113:23: error: 'const struct rproc_fw_ops' has no member named 'get_rsctab_addr'
drivers/remoteproc/remoteproc_internal.h:112:19: error: 'const struct rproc_fw_ops' has no member named 'get_rsctab_addr'
drivers/remoteproc/remoteproc_internal.h:113:23: error: 'const struct rproc_fw_ops' has no member named 'get_rsctab_addr'
drivers/remoteproc/remoteproc_elf_loader.c:326:19: error: 'rproc_elf_get_rsctab_addr' undeclared here (not in a function)
fs/proc/vmcore.c:275:22: error: 'VMCOREINFO_NOTE_NAME' undeclared (first use in this function)
fs/proc/vmcore.c:396:22: error: 'VMCOREINFO_NOTE_NAME' undeclared (first use in this function)

[warnings]
drivers/rtc/rtc-tegra.c:353:33: warning: passing argument 1 of 'devm_rtc_device_register' from incompatible pointer type [enabled by default]
drivers/rtc/rtc-tegra.c:353:33: warning: passing argument 2 of 'devm_rtc_device_register' from incompatible pointer type [enabled by default]
drivers/vhost/vhost.c:878:7: warning: 'addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/zcache/zcache-main.c:303:2: warning: dereferencing 'void *' pointer [enabled by default]
crypto/lz4.c:70:2: warning: passing argument 2 of 'lz4_decompress' from incompatible pointer type [enabled by default]
crypto/lz4hc.c:70:2: warning: passing argument 2 of 'lz4_decompress' from incompatible pointer type [enabled by default]

[sparse]
drivers/video/hyperv_fb.c:644:17: sparse: incorrect type in assignment (different address spaces)
drivers/video/hyperv_fb.c:656:27: sparse: incorrect type in assignment (different address spaces)
drivers/video/hyperv_fb.c:663:17: sparse: incorrect type in argument 1 (different address spaces)
kernel/posix-cpu-timers.c:934:27: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:952:44: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:953:30: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1071:38: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1072:40: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1306:29: sparse: implicit cast from nocast type
crypto/lz4.c:70:36: sparse: incorrect type in argument 2 (different type sizes)
crypto/lz4hc.c:70:36: sparse: incorrect type in argument 2 (different type sizes)
drivers/media/dvb-frontends/mb86a20s.c:34:4: sparse: symbol 'mb86a20s_subchannel' was not declared. Should it be static?
lib/lz4/lz4hc_compress.c:317:5: sparse: symbol 'lz4_compresshcctx' was not declared. Should it be static?
lib/lz4/lz4hc_compress.c:52:15: sparse: memset with byte count of 131072
lib/lz4/lz4hc_compress.c:53:15: sparse: memset with byte count of 131072

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 14 Feb 2013 19:57:04 +0000
Subject: build regressions 2013-02-14
Message-Id: <511d4190.PnNy/OVDY7F6XYP6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/zcache/debug.h:16:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
kernel/mutex.c:374:50: error: macro "__mutex_fastpath_lock_retval" requires 2 arguments, but only 1 given
kernel/mutex.c:374:9: error: '__mutex_fastpath_lock_retval' undeclared (first use in this function)
kernel/mutex.c:389:49: error: macro "__mutex_fastpath_lock_retval" requires 2 arguments, but only 1 given
kernel/mutex.c:389:8: error: '__mutex_fastpath_lock_retval' undeclared (first use in this function)
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
include/linux/highmem.h:128:2: error: implicit declaration of function 'kmap_atomic' [-Werror=implicit-function-declaration]
drivers/tty/serial/suncore.c:55:5: error: conflicting types for 'sunserial_console_match'
drivers/tty/serial/suncore.c:83:1: error: conflicting types for 'sunserial_console_match'
drivers/tty/serial/suncore.c:85:6: error: conflicting types for 'sunserial_console_termios'
arch/x86/xen/smp.c:257:2: error: implicit declaration of function 'smp_store_boot_cpu_info' [-Werror=implicit-function-declaration]
signal.c:(.entry.text+0x1c8): undefined reference to `intel_ipt_emu_cpl_switch'
(.entry.text+0x369): undefined reference to `intel_ipt_emu_cpl_switch'

[warnings]
drivers/staging/zcache/zcache-main.c:363:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:364:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:365:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:366:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:367:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:368:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:369:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:370:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:371:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:372:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:373:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:375:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:376:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:377:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:378:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:380:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:381:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:383:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:384:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:386:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:387:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:389:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:390:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:391:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:392:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:394:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:395:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:396:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:397:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:398:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:400:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:402:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:404:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:406:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:408:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:418:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/zcache-main.c:420:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]
drivers/staging/zcache/debug.c:46:3: warning: passing argument 4 of 'debugfs_create_size_t' from incompatible pointer type [enabled by default]
security/apparmor/file.c:399:2: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/radeon/si.c:440:5: warning: 'mc_req_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/microblaze/pci/pci-common.c:1445:2: warning: passing argument 3 of 'pci_add_resource_offset' makes integer from pointer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:163:7: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:497:7: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:1001:7: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:1004:10: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:1071:7: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/aio.c:1083:26: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/brd.c:245:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/brd.c:256:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/brd.c:276:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/brd.c:288:8: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/brd.c:312:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
crypto/shash.c:284:8: warning: assignment makes pointer from integer without a cast [enabled by default]
crypto/shash.c:423:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
crypto/scatterwalk.c:45:2: warning: return makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/socklib.c:117:9: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/xdr.c:125:8: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/xdr.c:235:7: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/xdr.c:236:9: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/xdr.c:270:7: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sunrpc/xdr.c:314:9: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
crypto/ahash.c:49:13: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/ext2/dir.c:648:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/vmalloc.c:1909:1: warning: initialization makes pointer from integer without a cast [enabled by default]
mm/vmalloc.c:1948:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/memory.c:2462:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/filemap.c:1323:9: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/filemap.c:2050:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/bounce.c:53:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
lib/scatterlist.c:393:15: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/splice.c:741:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/pipe.c:234:3: warning: return makes pointer from integer without a cast [enabled by default]
fs/pipe.c:569:9: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/nfs/dir.c:263:8: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/nfs/dir.c:1886:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:166:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:219:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:228:1: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:267:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:268:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:280:8: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/highmem.h:281:6: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/exec.c:1343:9: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/sunserialcore.h:29:15: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/sunserialcore.h:29:15: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/sunserialcore.h:31:18: warning: 'struct device_node' declared inside parameter list [enabled by default]
Warning(drivers/base/fence.c): no structured comments found
Warning(include/linux/fence.h:54): No description found for parameter 'lock'
Warning(include/linux/fence.h:54): No description found for parameter 'notify'
Warning(include/linux/fence.h:74): No description found for parameter 'fence'
Warning(include/linux/fence.h:84): No description found for parameter 'fence'
Warning(include/linux/fence.h:100): No description found for parameter 'fence'
Warning(include/linux/fence.h:100): No description found for parameter 'ntfy'
Warning(include/linux/fence.h:112): No description found for parameter 'ntfy'
Warning(include/linux/fence.h:161): No description found for parameter 'fence'
Warning(include/linux/fence.h:161): No description found for parameter 'interruptible'
Warning(include/linux/fence.h:171): No description found for parameter 'fence'
Warning(include/linux/fence.h:171): No description found for parameter 'interruptible'
Warning(include/linux/fence.h:216): No description found for parameter 'fence'
Warning(include/linux/fence.h:216): No description found for parameter 'sync'
Warning(include/linux/fence.h:216): No description found for parameter 'sync_off'
Warning(include/linux/fence.h:216): No description found for parameter 'sync_val'
drivers/staging/zcache/zcache-main.c:1597:13: warning: 'cli' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/emulex/benet/be_main.c:2786:3: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/bridge/br_netlink.c:355:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/base/fence.c:22:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c:56:2: warning: 'cnt' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/nouveau/core/subdev/bios/therm.c:63:2: warning: 'cnt' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/ccg/f_fs.c:459:8: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/base/regmap/regmap-debugfs.c:125:18: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
security/apparmor/include/policy.h:329:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/apparmorfs.c:250:58: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/label.c:296:6: sparse: symbol 'aa_label_make_newest' was not declared. Should it be static?
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:250:43: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:250:43: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:250:43: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:250:43: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/include/label.h:229:21: sparse: incompatible types in comparison expression (different address spaces)
security/apparmor/label.c:62:31: sparse: incorrect type in argument 1 (different address spaces)
security/apparmor/label.c:81:26: sparse: incorrect type in assignment (different address spaces)
security/apparmor/label.c:591:5: sparse: symbol 'aa_modename_snprint' was not declared. Should it be static?
drivers/mmc/host/sdhci.c:1998:43: sparse: incorrect type in initializer (incompatible argument 2 (different base types))
drivers/mmc/host/sdhci.c:2593:57: sparse: incorrect type in argument 2 (different base types)
drivers/watchdog/watchdog_core.c:46:6: sparse: symbol 'watchdog_check_min_max_timeout' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nv10_fence.c:69:1: sparse: symbol 'nv10_fence_context_new' was not declared. Should it be static?
drivers/xen/pcpu.c:337:6: sparse: symbol 'xen_pcpu_hotplug_sync' was not declared. Should it be static?
drivers/xen/pcpu.c:347:5: sparse: symbol 'xen_pcpu_id' was not declared. Should it be static?

[smatch]
security/apparmor/policy.c:1128 aa_replace_profiles() error: 'policy' dereferencing possible ERR_PTR()

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 24 Jul 2013 19:01:15 +0000
Subject: build regressions 2013-07-24
Message-Id: <51f0247b.+4YaK4W2pa6pkZ1F%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/init.h:298:27: error: redefinition of '__inittest'
include/linux/init.h:300:6: error: redefinition of 'init_module'
include/linux/init.h:304:27: error: redefinition of '__exittest'
include/linux/init.h:306:7: error: redefinition of 'cleanup_module'
drivers/staging/comedi/drivers/ni_mio_common.c:1857:4: error: implicit declaration of function 'udelay' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_mio_common.c:2102:4: error: implicit declaration of function 'msleep_interruptible' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:36:3: error: implicit declaration of function 'vunmap' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:61:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:81:2: error: implicit declaration of function 'vzalloc' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:83:3: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:112:3: error: implicit declaration of function 'vmap' [-Werror=implicit-function-declaration]
drivers/staging/comedi/comedi_buf.c:112:46: error: 'VM_MAP' undeclared (first use in this function)
drivers/staging/lustre/lustre/obdclass/lu_object.c:1882:10: error: 'SHRINK_STOP' undeclared (first use in this function)
drivers/staging/lustre/lustre/obdclass/lu_object.c:1924:2: error: unknown field 'count_objects' specified in initializer
drivers/staging/lustre/lustre/obdclass/lu_object.c:1925:2: error: unknown field 'scan_objects' specified in initializer
drivers/staging/lustre/lustre/obdclass/lu_object.c:1925:2: error: initializer element is not computable at load time
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1131:45: error: 'SHRINK_STOP' undeclared (first use in this function)
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1410:2: error: unknown field 'count_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1411:2: error: unknown field 'scan_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1411:2: error: initializer element is not computable at load time
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1416:2: error: unknown field 'count_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1417:2: error: unknown field 'scan_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1417:2: error: initializer element is not computable at load time
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:711:2: error: unknown field 'count_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:712:2: error: unknown field 'scan_objects' specified in initializer
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:712:2: error: initializer element is not computable at load time
(.text+0x1bc2ef): undefined reference to `snd_card_create'
(.text+0x1bc378): undefined reference to `snd_ac97_bus'
(.text+0x1bc3b5): undefined reference to `snd_ac97_mixer'
(.text+0x1bc3da): undefined reference to `snd_card_register'
(.text+0x1bc40a): undefined reference to `snd_card_free'
(.text+0x1bc45a): undefined reference to `snd_card_free'
(.text+0xcb0ae): undefined reference to `iio_kfifo_allocate'
(.text+0xcb117): undefined reference to `iio_kfifo_free'
(.text+0xcb14b): undefined reference to `iio_kfifo_free'

[warnings]
drivers/staging/comedi/comedi_buf.c:81:23: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/comedi/comedi_buf.c:83:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1924:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1924:2: warning: (near initialization for 'lu_site_shrinker.shrink') [enabled by default]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1925:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1925:2: warning: (near initialization for 'lu_site_shrinker.seeks') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1410:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1410:2: warning: (near initialization for 'ldlm_pools_srv_shrinker.shrink') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1411:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1411:2: warning: (near initialization for 'ldlm_pools_srv_shrinker.seeks') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1416:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1416:2: warning: (near initialization for 'ldlm_pools_cli_shrinker.shrink') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1417:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:1417:2: warning: (near initialization for 'ldlm_pools_cli_shrinker.seeks') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:711:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:711:2: warning: (near initialization for 'pools_shrinker.shrink') [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:712:2: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:712:2: warning: (near initialization for 'pools_shrinker.seeks') [enabled by default]
kernel/mutex.c:599:1: warning: label 'done' defined but not used [-Wunused-label]

[sparse]
drivers/net/bonding/bond_main.c:741:9: sparse: context imbalance in 'bond_resend_igmp_join_requests' - unexpected unlock
include/linux/dmabuf-sync.h:105:9: sparse: undefined identifier 'ww_mutex_destroy'
include/linux/dmabuf-sync.h:90:9: sparse: undefined identifier 'ww_mutex_init'
drivers/base/dmabuf-sync.c:64:17: sparse: undefined identifier 'ww_mutex_unlock'
drivers/base/dmabuf-sync.c:102:17: sparse: undefined identifier 'ww_acquire_init'
drivers/base/dmabuf-sync.c:127:23: sparse: undefined identifier 'ww_mutex_lock'
drivers/base/dmabuf-sync.c:144:17: sparse: undefined identifier 'ww_acquire_done'
drivers/base/dmabuf-sync.c:184:17: sparse: undefined identifier 'ww_mutex_lock_slow'
drivers/base/dmabuf-sync.c:191:17: sparse: undefined identifier 'ww_acquire_fini'
drivers/base/dmabuf-sync.c:521:9: sparse: using member 'base' in incomplete struct ww_mutex

[coccinelle]
drivers/mfd/palmas-gpadc.c:1057:7-27: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
drivers/mfd/palmas-gpadc.c:255:2-8: preceding lock on line 247
drivers/input/misc/palmas-pwrbutton.c:93:7-27: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT

[cppcheck]
arch/powerpc/include/asm/eeh.h:186: warning: Redundant code: Found a statement that begins with numeric constant
arch/powerpc/include/asm/eeh.h:191: warning: Redundant code: Found a statement that begins with numeric constant
arch/powerpc/include/asm/eeh.h:186: error: Uninitialized variable: __dummy
arch/powerpc/include/asm/eeh.h:191: error: Uninitialized variable: __dummy

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

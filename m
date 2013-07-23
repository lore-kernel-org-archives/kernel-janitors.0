From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 23 Jul 2013 04:57:53 +0000
Subject: build regressions 2013-07-22
Message-Id: <51ee0d51.8gf56X4bNpq8K/2a%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
null_blk.c:(.init.text+0x1d04a): undefined reference to `__udivdi3'
sound/soc/mxs/mxs-saif.c:668:2: error: implicit declaration of function 'clk_register_divider' [-Werror=implicit-function-declaration]
sound/soc/mxs/mxs-saif.c:669:8: error: implicit declaration of function '__clk_get_name' [-Werror=implicit-function-declaration]
sound/soc/mxs/mxs-saif.c:681:2: error: implicit declaration of function 'of_clk_add_provider' [-Werror=implicit-function-declaration]
sound/soc/mxs/mxs-saif.c:681:32: error: 'of_clk_src_simple_get' undeclared (first use in this function)
include/linux/dmabuf-sync.h:90:2: error: implicit declaration of function 'ww_mutex_init' [-Werror=implicit-function-declaration]
include/linux/dmabuf-sync.h:105:2: error: implicit declaration of function 'ww_mutex_destroy' [-Werror=implicit-function-declaration]
include/linux/dmabuf-sync.h:90:2: error: implicit declaration of function 'ww_mutex_init' [-Werror=implicit-function-declaration]
include/linux/dmabuf-sync.h:105:2: error: implicit declaration of function 'ww_mutex_destroy' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:64:3: error: implicit declaration of function 'ww_mutex_unlock' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:102:3: error: implicit declaration of function 'ww_acquire_init' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:127:3: error: implicit declaration of function 'ww_mutex_lock' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:144:3: error: implicit declaration of function 'ww_acquire_done' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:184:3: error: implicit declaration of function 'ww_mutex_lock_slow' [-Werror=implicit-function-declaration]
drivers/base/dmabuf-sync.c:191:3: error: implicit declaration of function 'ww_acquire_fini' [-Werror=implicit-function-declaration]
arch/x86/kernel/kprobes/opt.c:394:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:395:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:396:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:411:3: error: invalid use of undefined type 'struct text_poke_param'
arch/x86/kernel/kprobes/opt.c:411:42: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:423:2: error: implicit declaration of function 'text_poke_smp_batch' [-Werror=implicit-function-declaration]
arch/x86/kernel/kprobes/opt.c:434:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:435:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:436:6: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:451:3: error: invalid use of undefined type 'struct text_poke_param'
arch/x86/kernel/kprobes/opt.c:451:44: error: dereferencing pointer to incomplete type
arch/x86/kernel/kprobes/opt.c:474:2: error: implicit declaration of function 'text_poke_smp' [-Werror=implicit-function-declaration]
arch/x86/kernel/kprobes/opt.c:503:36: error: invalid application of 'sizeof' to incomplete type 'struct text_poke_param'

[warnings]
sound/soc/mxs/mxs-saif.c:668:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/base/dmabuf-sync.c:28:1: warning: data definition has no type or storage class [enabled by default]
drivers/base/dmabuf-sync.c:28:1: warning: type defaults to 'int' in declaration of 'DEFINE_WW_CLASS' [-Wimplicit-int]
drivers/base/dmabuf-sync.c:28:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/gpu/drm/drm_stub.c:370:1: warning: label 'err_mem' defined but not used [-Wunused-label]
net/bluetooth/hidp/core.c:142:2: warning: 'rsize' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
arch/x86/kernel/kprobes/opt.c:394:13: sparse: using member 'addr' in incomplete struct text_poke_param
arch/x86/kernel/kprobes/opt.c:395:13: sparse: using member 'opcode' in incomplete struct text_poke_param
arch/x86/kernel/kprobes/opt.c:396:13: sparse: using member 'len' in incomplete struct text_poke_param
arch/x86/kernel/kprobes/opt.c:423:9: sparse: undefined identifier 'text_poke_smp_batch'
arch/x86/kernel/kprobes/opt.c:474:9: sparse: undefined identifier 'text_poke_smp'

[coccinelle]
sound/soc/codecs/twl6040.c:1104:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

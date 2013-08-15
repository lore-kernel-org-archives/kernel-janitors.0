From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 15 Aug 2013 16:36:35 +0000
Subject: build regressions 2013-08-15
Message-Id: <520d0393.zNw2qKyS2gmMizC4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/skbuff.h:866:2: error: implicit declaration of function 'might_sleep_if' [-Werror=implicit-function-declaration]
lib/strnlen_user.c:48:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
lib/strncpy_from_user.c:41:3: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
lib/bitmap.c:437:5: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
include/asm-generic/termios.h:24:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
include/asm-generic/termios.h:24:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
include/linux/sched.h:2477:20: error: static declaration of 'might_fault' follows non-static declaration
drivers/watchdog/watchdog_dev.c:310:3: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/arm/nwfpe/fpa11_cpdt.c:35:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
ERROR: "snd_dmaengine_pcm_set_config_from_dai_data" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_open_request_chan" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_close_release_chan" [sound/soc/omap/snd-soc-omap.ko] undefined!
(.text+0x40ce19): undefined reference to `btrfs_init_free_space_ctl'
(.text+0x40ce43): undefined reference to `__btrfs_add_free_space'
(.text+0x40ce73): undefined reference to `btrfs_remove_free_space'
(.text+0x40cea3): undefined reference to `test_check_exists'
(.text+0x40ced1): undefined reference to `__btrfs_add_free_space'
(.text+0x40cf04): undefined reference to `btrfs_remove_free_space'
(.text+0x40cf34): undefined reference to `btrfs_remove_free_space'
(.text+0x40cf67): undefined reference to `btrfs_remove_free_space'
(.text+0x40cf97): undefined reference to `test_check_exists'
(.text+0x40cfc4): undefined reference to `test_check_exists'
(.text+0x40cff1): undefined reference to `test_check_exists'
(.text+0x40d00c): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d03a): undefined reference to `test_add_free_space_entry'
(.text+0x40d06a): undefined reference to `btrfs_remove_free_space'
(.text+0x40d09a): undefined reference to `test_check_exists'
(.text+0x40d0cc): undefined reference to `test_add_free_space_entry'
(.text+0x40d0ff): undefined reference to `btrfs_remove_free_space'
(.text+0x40d13a): undefined reference to `test_add_free_space_entry'
(.text+0x40d16d): undefined reference to `btrfs_remove_free_space'
(.text+0x40d195): undefined reference to `test_check_exists'
(.text+0x40d1b0): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d1e1): undefined reference to `test_add_free_space_entry'
(.text+0x40d219): undefined reference to `test_add_free_space_entry'
(.text+0x40d23e): undefined reference to `btrfs_remove_free_space'
(.text+0x40d26e): undefined reference to `test_check_exists'
(.text+0x40d2a0): undefined reference to `test_add_free_space_entry'
(.text+0x40d2d3): undefined reference to `btrfs_remove_free_space'
(.text+0x40d306): undefined reference to `test_check_exists'
(.text+0x40d33b): undefined reference to `test_add_free_space_entry'
(.text+0x40d36e): undefined reference to `btrfs_remove_free_space'
(.text+0x40d3a1): undefined reference to `test_check_exists'
(.text+0x40d3bc): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d3e1): undefined reference to `test_add_free_space_entry'
(.text+0x40d41c): undefined reference to `test_add_free_space_entry'
(.text+0x40d44f): undefined reference to `btrfs_remove_free_space'
(.text+0x40d482): undefined reference to `test_check_exists'
(.text+0x40d49d): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d4c2): undefined reference to `test_add_free_space_entry'
(.text+0x40d4fd): undefined reference to `test_add_free_space_entry'
(.text+0x40d525): undefined reference to `btrfs_remove_free_space'
(.text+0x40d558): undefined reference to `test_check_exists'
(.text+0x40d57b): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d5a0): undefined reference to `test_add_free_space_entry'
(.text+0x40d5d8): undefined reference to `test_add_free_space_entry'
(.text+0x40d608): undefined reference to `btrfs_remove_free_space'
(.text+0x40d62b): undefined reference to `__btrfs_remove_free_space_cache'
(.text+0x40d636): undefined reference to `__btrfs_remove_free_space_cache'
free-space-tests.c:(.text+0x294c04): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x294c6c): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x294ccc): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x294d2c): undefined reference to `test_check_exists'
free-space-tests.c:(.text+0x294d94): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x294df7): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x294e5f): undefined reference to `test_check_exists'
free-space-tests.c:(.text+0x294ec7): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x294f2f): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x294f97): undefined reference to `test_check_exists'
free-space-tests.c:(.text+0x294fe5): undefined reference to `__btrfs_remove_free_space_cache'
free-space-tests.c:(.text+0x295018): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x295087): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x2950ef): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x295157): undefined reference to `test_check_exists'
free-space-tests.c:(.text+0x2951a5): undefined reference to `__btrfs_remove_free_space_cache'
free-space-tests.c:(.text+0x2951d8): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x295247): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x2952af): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x295317): undefined reference to `test_check_exists'
free-space-tests.c:(.text+0x29536d): undefined reference to `__btrfs_remove_free_space_cache'
free-space-tests.c:(.text+0x2953a0): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x29540f): undefined reference to `test_add_free_space_entry'
free-space-tests.c:(.text+0x295477): undefined reference to `btrfs_remove_free_space'
free-space-tests.c:(.text+0x2954cd): undefined reference to `__btrfs_remove_free_space_cache'
mm/memory.c:4207:6: error: redefinition of 'might_fault'
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
arch/mips/include/asm/uaccess.h:961:2: error: implicit declaration of function 'might_fault' [-Werror=implicit-function-declaration]
ERROR: "snd_dmaengine_pcm_pointer_no_residue" undefined!
ERROR: "snd_dmaengine_pcm_set_config_from_dai_data" undefined!
ERROR: "snd_hwparams_to_dma_slave_config" undefined!
ERROR: "snd_dmaengine_pcm_pointer" undefined!
ERROR: "snd_dmaengine_pcm_open" undefined!
ERROR: "snd_dmaengine_pcm_request_channel" undefined!
ERROR: "snd_dmaengine_pcm_close" undefined!
ERROR: "snd_dmaengine_pcm_get_chan" undefined!
ERROR: "snd_dmaengine_pcm_trigger" undefined!
lib/idr.c:424:2: error: implicit declaration of function 'might_sleep_if' [-Werror=implicit-function-declaration]
core.c:(.text+0x2b472): undefined reference to `kmalloc_order_trace'
xt_TPROXY.c:(.init.text+0xfb8): undefined reference to `nf_defrag_ipv6_enable'
lapic.c:(.text+0x26dfe): undefined reference to `kmalloc_order_trace'
fs/btrfs/super.c:1771:2: error: implicit declaration of function 'btrfs_test_free_space_cache' [-Werror=implicit-function-declaration]

[warnings]
include/linux/sched.h:2477:20: warning: conflicting types for 'might_fault' [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1603:9: warning: passing argument 4 of 'make_sgl' makes integer from pointer without a cast [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceres' declared inside parameter list [enabled by default]
fs/nfs/nfs4trace.h:331:17: warning: 'struct cb_sequenceargs' declared inside parameter list [enabled by default]

[sparse]
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:241:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:241:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:241:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
arch/x86/include/asm/uaccess_64.h:241:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got sn:1>*dst @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
arch/x86/include/asm/uaccess_64.h:235:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*src @@    got ef] <asn:1>*src @@
security/apparmor/crypto.c:41:28: sparse: incorrect type in initializer (different base types) @@    expected unsigned int [unsigned] [usertype] le32_version @@    got ed int [unsigned] [usertype] le32_version @@
fs/nfs/callback_proc.c:467:43: sparse: cast from restricted __be32
fs/nfs/callback_proc.c:467:43: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got restrunsigned int [unsigned] [usertype] val @@
fs/nfs/callback_proc.c:467:43: sparse: cast from restricted __be32
fs/nfs/callback_proc.c:467:43: sparse: cast from restricted __be32
fs/nfs/callback_proc.c:467:43: sparse: cast from restricted __be32
fs/nfs/callback_proc.c:467:43: sparse: cast from restricted __be32
fs/btrfs/tests/free-space-tests.c:350:5: sparse: symbol 'btrfs_test_free_space_cache' was not declared. Should it be static?
include/uapi/linux/swab.h:60:16: sparse: undefined identifier '__builtin_bswap32'
include/uapi/linux/swab.h:71:16: sparse: undefined identifier '__builtin_bswap64'
drivers/block/xen-blkback/common.h:208:39: sparse: Expected } at end of struct-union-enum-specifier
drivers/block/xen-blkback/common.h:208:39: sparse: got 1
drivers/block/xen-blkback/common.h:209:1: sparse: Expected ; at the end of type declaration
drivers/block/xen-blkback/blkback.c:1052:52: sparse: Expected member name
drivers/block/xen-blkback/blkback.c:1052:52: sparse: Expected ) in expression
drivers/block/xen-blkback/blkback.c:1052:52: sparse: got 1
drivers/block/xen-blkback/xenbus.c:211:17: sparse: Expected member name
drivers/block/xen-blkback/xenbus.c:211:17: sparse: Expected ) in expression
drivers/block/xen-blkback/xenbus.c:211:17: sparse: got 1
arch/x86/include/asm/insn.h:65:23: sparse: Expected } at end of struct-union-enum-specifier
arch/x86/include/asm/insn.h:65:23: sparse: got 1
arch/x86/include/asm/insn.h:69:1: sparse: Expected ; at the end of type declaration
arch/x86/include/asm/insn.h:99:65: sparse: Expected ) in function declarator
arch/x86/kernel/kprobes/core.c:335:26: sparse: no member 'kaddr' in struct insn
arch/x86/kernel/kprobes/opt.c:224:37: sparse: no member 'next_byte' in struct insn
arch/x86/kernel/kprobes/opt.c:267:21: sparse: no member 'kaddr' in struct insn
arch/x86/lib/insn.c:53:58: sparse: Expected ) in function declarator
arch/x86/lib/insn.c:53:58: sparse: got 1
arch/x86/lib/insn.c:56:13: sparse: Expected ; at end of declaration
arch/x86/lib/insn.c:63:17: sparse: got insn
arch/x86/lib/insn.c:64:1: sparse: Expected ; at the end of type declaration
arch/x86/lib/insn.c:88:37: sparse: got (
arch/x86/lib/insn.c:128:21: sparse: Expected ) in nested declarator

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

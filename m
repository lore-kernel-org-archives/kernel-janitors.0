From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 29 Oct 2012 17:05:51 +0000
Subject: build regressions 2012-10-29
Message-Id: <20121029170551.GA16420@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
init/main.c:163: error: (Each undeclared identifier is reported only once
init/main.c:163: error: for each function it appears in.)
include/linux/atomic.h:17:2: error: implicit declaration of function '__atomic_add_unless' [-Werror=implicit-function-declaration]
include/linux/atomic.h:53:3: error: implicit declaration of function 'atomic_cmpxchg' [-Werror=implicit-function-declaration]
include/linux/atomic.h:100:2: error: implicit declaration of function 'atomic_read' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:155:2: error: implicit declaration of function 'atomic_set' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:162:2: error: implicit declaration of function 'atomic_inc' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:169:2: error: implicit declaration of function 'atomic_dec' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:176:2: error: implicit declaration of function 'atomic_add' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:183:2: error: implicit declaration of function 'atomic_sub' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:190:2: error: implicit declaration of function 'atomic_sub_and_test' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:197:2: error: implicit declaration of function 'atomic_dec_and_test' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:204:2: error: implicit declaration of function 'atomic_inc_and_test' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:211:2: error: implicit declaration of function 'atomic_add_negative' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:218:2: error: implicit declaration of function 'atomic_add_return' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:225:2: error: implicit declaration of function 'atomic_sub_return' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:232:2: error: implicit declaration of function 'atomic_inc_return' [-Werror=implicit-function-declaration]
include/asm-generic/atomic-long.h:239:2: error: implicit declaration of function 'atomic_dec_return' [-Werror=implicit-function-declaration]

[warnings]
drivers/gpu/drm/gma500/psb_intel_sdvo.c:1129:3: warning: 'input1' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/serial/io_edgeport.c:3155:6: warning: unused variable 'i' [-Wunused-variable]

[sparse]
net/ipv4/netfilter/nf_table_nat_ipv4.c:47:35: sparse: incorrect type in assignment (different base types)
net/ipv4/netfilter/nft_reject_ipv4.c:75:53: sparse: incorrect type in argument 3 (different base types)
net/netfilter/nft_compat.c:497:12: sparse: symbol 'nft_compat_module_init' was not declared. Should it be static?
net/netfilter/nft_compat.c:526:6: sparse: symbol 'nft_compat_module_exit' was not declared. Should it be static?

[smatch]
drivers/usb/serial/iuu_phoenix.c:106 iuu_port_probe() info: redundant null check on priv->writebuf calling kfree()
net/ipv6/addrconf.c:557 dev_forward_change() error: we previously assumed 'dev' could be null (see line 541)
net/netfilter/nf_tables_api.c:1195 nf_tables_newrule() warn: 'info' puts 1152 bytes on stack
mm/memcontrol.c:3126 __memcg_create_cache_enqueue() warn: possible memory leak of 'cw'

[coccinelle]
net/ipv4/netfilter/iptable_nat.c:277:1-3: WARNING: PTR_RET can be used
net/ipv6/netfilter/ip6table_nat.c:278:1-3: WARNING: PTR_RET can be used
drivers/staging/dgrp/dgrp_net_ops.c:1061:11-27: ERROR: nd is NULL but dereferenced.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

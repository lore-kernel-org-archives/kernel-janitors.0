From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 10 Nov 2012 17:29:58 +0000
Subject: build regressions 2012-11-10
Message-Id: <509e8f16.d5nYEQodgkFHrYx8%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/ipv6/exthdrs_core.c:188: error: (Each undeclared identifier is reported only once
net/ipv6/exthdrs_core.c:188: error: for each function it appears in.)
net/ipv6/exthdrs_core.c:188:27: error: 'OVS_IP6T_FH_F_SKIP_RH' undeclared (first use in this function)

[warnings]
WARNING: security/built-in.o(.text+0xb43ac): Section mismatch in reference from the function integrity_init_keyring() to the variable .init.data:chosen_lsm
net/sunrpc/svc.c:1045:8: warning: unused variable 'buf' [-Wunused-variable]
WARNING: security/built-in.o(.text+0x2b71c): Section mismatch in reference from the function integrity_inode_free() to the variable .init.data:chosen_lsm

[sparse]
fs/fuse/file.c:1176:43: sparse: cast removes address space of expression
fs/fuse/file.c:1176:43: sparse: incorrect type in initializer (different address spaces)
fs/nfsd/nfs4state.c:948:6: sparse: symbol 'init_session' was not declared. Should it be static?
net/ipv6/exthdrs_core.c:188:48: sparse: undefined identifier 'OVS_IP6T_FH_F_SKIP_RH'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

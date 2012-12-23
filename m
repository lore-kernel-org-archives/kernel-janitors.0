From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 23 Dec 2012 03:29:32 +0000
Subject: build regressions 2012-12-22
Message-Id: <50d67a9c.HLqk7Rova6M3RBe6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/f2fs/acl.c:85:21: error: 'struct posix_acl_entry' has no member named 'e_id'
fs/xfs/xfs_icache.c:1213:6: error: implicit declaration of function 'xfs_get_projid' [-Werror=implicit-function-declaration]
fs/nfsd/nfs4callback.c:655:13: error: incompatible types when assigning to type 'kuid_t' from type 'u32'
fs/nfsd/nfs4callback.c:656:13: error: incompatible types when assigning to type 'kgid_t' from type 'u32'
fs/xfs/xfs_icache.c:1205:21: error: invalid operands to binary != (have 'kuid_t' and 'uid_t')
fs/xfs/xfs_icache.c:1209:21: error: invalid operands to binary != (have 'kgid_t' and 'gid_t')
drivers/rtc/rtc-twl.c:601:2: error: request for member 'shutdown' in something not a structure or union

[sparse]
drivers/rtc/rtc-twl.c:601:9: sparse: expected structure or union
fs/nfsd/nfs4callback.c:655:27: sparse: incorrect type in assignment (invalid types)
fs/xfs/xfs_icache.c:1205:28: sparse: incompatible types for operation (!=)
fs/f2fs/acl.c:85:42: sparse: no member 'e_id' in struct posix_acl_entry
fs/xfs/xfs_icache.c:1213:13: sparse: undefined identifier 'xfs_get_projid'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

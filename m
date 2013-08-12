From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 12 Aug 2013 16:49:10 +0000
Subject: build regressions 2013-08-12
Message-Id: <52091206.lMHkp0wBr4qo+nRV%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
file.c:(.text+0x10b438): undefined reference to `__tracepoint_nfs4_lock_expired'
file.c:(.text+0x10b538): undefined reference to `__tracepoint_nfs4_lock_reclaim'
file.c:(.text+0x10b824): undefined reference to `__tracepoint_nfs4_readlink'
file.c:(.text+0x10bff0): undefined reference to `__tracepoint_nfs4_set_acl'
file.c:(.text+0x10c1b0): undefined reference to `__tracepoint_nfs4_get_acl'
file.c:(.text+0x10c284): undefined reference to `__tracepoint_nfs4_rename'
file.c:(.text+0x10c34c): undefined reference to `__tracepoint_nfs4_remove'
file.c:(.text+0x10c440): undefined reference to `__tracepoint_nfs4_readdir'
file.c:(.text+0x10c510): undefined reference to `__tracepoint_nfs4_link'
file.c:(.text+0x10c728): undefined reference to `__tracepoint_nfs4_access'
file.c:(.text+0x10d414): undefined reference to `__tracepoint_nfs4_open_expired'
file.c:(.text+0x10d5dc): undefined reference to `__tracepoint_nfs4_open_reclaim'
file.c:(.text+0x10dc84): undefined reference to `__tracepoint_nfs4_set_lock'
file.c:(.text+0x10dc90): undefined reference to `__tracepoint_nfs4_get_lock'
file.c:(.text+0x10de34): undefined reference to `__tracepoint_nfs4_mkdir'
file.c:(.text+0x10df68): undefined reference to `__tracepoint_nfs4_symlink'
file.c:(.text+0x10e114): undefined reference to `__tracepoint_nfs4_mknod'
file.c:(.text+0x10e280): undefined reference to `__tracepoint_nfs4_setattr'
file.c:(.text+0x10e9c0): undefined reference to `__tracepoint_nfs4_open_file'
file.c:(.text+0x10f3f0): undefined reference to `__tracepoint_nfs4_delegreturn'
file.c:(.text+0x10f614): undefined reference to `__tracepoint_nfs4_get_fs_locations'
file.c:(.text+0x10f984): undefined reference to `__tracepoint_nfs4_lookup'
file.c:(.text+0x10fc0c): undefined reference to `__tracepoint_nfs4_secinfo'
nfs4proc.c:(.text+0x1590d9): undefined reference to `__tracepoint_nfs4_get_security_label'
nfs4proc.c:(.text+0x15ce85): undefined reference to `__tracepoint_nfs4_readlink'
nfs4proc.c:(.text+0x15d2ac): undefined reference to `__tracepoint_nfs4_rename'
nfs4proc.c:(.text+0x15d374): undefined reference to `__tracepoint_nfs4_remove'
nfs4proc.c:(.text+0x15d4cd): undefined reference to `__tracepoint_nfs4_setattr'
nfs4proc.c:(.text+0x15d6b6): undefined reference to `__tracepoint_nfs4_readdir'
nfs4proc.c:(.text+0x15d784): undefined reference to `__tracepoint_nfs4_link'
nfs4proc.c:(.text+0x15d926): undefined reference to `__tracepoint_nfs4_access'
nfs4proc.c:(.text+0x15da0d): undefined reference to `__tracepoint_nfs4_set_acl'
nfs4proc.c:(.text+0x15db93): undefined reference to `__tracepoint_nfs4_get_acl'
nfs4proc.c:(.text+0x15e47c): undefined reference to `__tracepoint_nfs4_mknod'
nfs4proc.c:(.text+0x15e5b8): undefined reference to `__tracepoint_nfs4_mkdir'
nfs4proc.c:(.text+0x15e70b): undefined reference to `__tracepoint_nfs4_symlink'
nfs4proc.c:(.text+0x15eb98): undefined reference to `__tracepoint_nfs4_open_reclaim'
nfs4proc.c:(.text+0x15ed10): undefined reference to `__tracepoint_nfs4_open_expired'
nfs4proc.c:(.text+0x15f516): undefined reference to `__tracepoint_nfs4_open_file'
nfs4proc.c:(.text+0x15fce0): undefined reference to `__tracepoint_nfs4_lock_expired'
nfs4proc.c:(.text+0x15fe9c): undefined reference to `__tracepoint_nfs4_lock_reclaim'
nfs4proc.c:(.text+0x16041a): undefined reference to `__tracepoint_nfs4_get_lock'
nfs4proc.c:(.text+0x160437): undefined reference to `__tracepoint_nfs4_set_lock'
(.text+0x1614c5): undefined reference to `__tracepoint_nfs4_delegreturn'
(.text+0x1616e7): undefined reference to `__tracepoint_nfs4_get_fs_locations'
nfs4proc.c:(.text+0x161a21): undefined reference to `__tracepoint_nfs4_lookup'
(.text+0x161cb1): undefined reference to `__tracepoint_nfs4_secinfo'
fs/built-in.o:(__jump_table+0x80c): undefined reference to `__tracepoint_nfs4_get_security_label'
fs/built-in.o:(__jump_table+0x818): undefined reference to `__tracepoint_nfs4_readlink'
fs/built-in.o:(__jump_table+0x824): undefined reference to `__tracepoint_nfs4_rename'
fs/built-in.o:(__jump_table+0x830): undefined reference to `__tracepoint_nfs4_remove'
fs/built-in.o:(__jump_table+0x83c): undefined reference to `__tracepoint_nfs4_setattr'
fs/built-in.o:(__jump_table+0x848): undefined reference to `__tracepoint_nfs4_readdir'
fs/built-in.o:(__jump_table+0x854): undefined reference to `__tracepoint_nfs4_link'
fs/built-in.o:(__jump_table+0x860): undefined reference to `__tracepoint_nfs4_access'
fs/built-in.o:(__jump_table+0x86c): undefined reference to `__tracepoint_nfs4_set_acl'
fs/built-in.o:(__jump_table+0x878): undefined reference to `__tracepoint_nfs4_get_acl'
fs/built-in.o:(__jump_table+0x884): undefined reference to `__tracepoint_nfs4_mknod'
fs/built-in.o:(__jump_table+0x890): undefined reference to `__tracepoint_nfs4_mkdir'
fs/built-in.o:(__jump_table+0x89c): undefined reference to `__tracepoint_nfs4_symlink'
fs/built-in.o:(__jump_table+0x8a8): undefined reference to `__tracepoint_nfs4_open_reclaim'
fs/built-in.o:(__jump_table+0x8b4): undefined reference to `__tracepoint_nfs4_open_expired'
fs/built-in.o:(__jump_table+0x8c0): undefined reference to `__tracepoint_nfs4_open_file'
fs/built-in.o:(__jump_table+0x8cc): undefined reference to `__tracepoint_nfs4_lock_expired'
fs/built-in.o:(__jump_table+0x8d8): undefined reference to `__tracepoint_nfs4_lock_reclaim'
fs/built-in.o:(__jump_table+0x8e4): undefined reference to `__tracepoint_nfs4_get_lock'
fs/built-in.o:(__jump_table+0x8f0): undefined reference to `__tracepoint_nfs4_set_lock'
fs/built-in.o:(__jump_table+0x8fc): undefined reference to `__tracepoint_nfs4_delegreturn'
fs/built-in.o:(__jump_table+0x908): undefined reference to `__tracepoint_nfs4_get_fs_locations'
fs/built-in.o:(__jump_table+0x914): undefined reference to `__tracepoint_nfs4_lookup'
fs/built-in.o:(__jump_table+0x920): undefined reference to `__tracepoint_nfs4_secinfo'
ERROR: "ramster_foreign_eph_pages" [drivers/staging/zcache/zcache.ko] undefined!
ERROR: "ramster_foreign_pers_pages" [drivers/staging/zcache/zcache.ko] undefined!
ERROR: "__tracepoint_nfs4_rename" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_setattr" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_get_lock" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_open_file" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_get_acl" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_lookup" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_secinfo" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_access" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_lock_expired" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_readlink" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_open_reclaim" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_link" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_mknod" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_set_acl" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_remove" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_readdir" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_set_lock" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_mkdir" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_get_fs_locations" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_delegreturn" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_lock_reclaim" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_symlink" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_open_expired" [fs/nfs/nfsv4.ko] undefined!
fs/built-in.o:(.toc+0x0): undefined reference to `__tracepoint_nfs4_readlink'
fs/built-in.o:(.toc+0x8): undefined reference to `__tracepoint_nfs4_lock_expired'
fs/built-in.o:(.toc+0x10): undefined reference to `__tracepoint_nfs4_lock_reclaim'
fs/built-in.o:(.toc+0x18): undefined reference to `__tracepoint_nfs4_rename'
fs/built-in.o:(.toc+0x20): undefined reference to `__tracepoint_nfs4_remove'
fs/built-in.o:(.toc+0x28): undefined reference to `__tracepoint_nfs4_readdir'
fs/built-in.o:(.toc+0x30): undefined reference to `__tracepoint_nfs4_link'
fs/built-in.o:(.toc+0x38): undefined reference to `__tracepoint_nfs4_access'
fs/built-in.o:(.toc+0x40): undefined reference to `__tracepoint_nfs4_get_acl'
fs/built-in.o:(.toc+0x48): undefined reference to `__tracepoint_nfs4_set_acl'
fs/built-in.o:(.toc+0x50): undefined reference to `__tracepoint_nfs4_get_lock'
fs/built-in.o:(.toc+0x58): undefined reference to `__tracepoint_nfs4_set_lock'
fs/built-in.o:(.toc+0x60): undefined reference to `__tracepoint_nfs4_mknod'
fs/built-in.o:(.toc+0x68): undefined reference to `__tracepoint_nfs4_mkdir'
fs/built-in.o:(.toc+0x70): undefined reference to `__tracepoint_nfs4_symlink'
fs/built-in.o:(.toc+0x78): undefined reference to `__tracepoint_nfs4_setattr'
fs/built-in.o:(.toc+0x80): undefined reference to `__tracepoint_nfs4_open_file'
fs/built-in.o:(.toc+0x88): undefined reference to `__tracepoint_nfs4_open_reclaim'
fs/built-in.o:(.toc+0x90): undefined reference to `__tracepoint_nfs4_open_expired'
fs/built-in.o:(.toc+0x98): undefined reference to `__tracepoint_nfs4_delegreturn'
fs/built-in.o:(.toc+0xa0): undefined reference to `__tracepoint_nfs4_get_fs_locations'
fs/built-in.o:(.toc+0xa8): undefined reference to `__tracepoint_nfs4_lookup'
fs/built-in.o:(.toc+0xb0): undefined reference to `__tracepoint_nfs4_secinfo'
fs/nfs/nfs4proc.c:349:2: error: implicit declaration of function 'trace_handle_sync_exception' [-Werror=implicit-function-declaration]
ERROR: "__tracepoint_nfs4_rename" undefined!
ERROR: "__tracepoint_nfs4_setattr" undefined!
ERROR: "__tracepoint_nfs4_get_lock" undefined!
ERROR: "__tracepoint_nfs4_open_file" undefined!
ERROR: "__tracepoint_nfs4_get_acl" undefined!
ERROR: "__tracepoint_nfs4_lookup" undefined!
ERROR: "__tracepoint_nfs4_secinfo" undefined!
ERROR: "__tracepoint_nfs4_access" undefined!
ERROR: "__tracepoint_nfs4_lock_expired" undefined!
ERROR: "__tracepoint_nfs4_readlink" undefined!
ERROR: "__tracepoint_nfs4_open_reclaim" undefined!
ERROR: "__tracepoint_nfs4_link" undefined!
ERROR: "__tracepoint_nfs4_mknod" undefined!
ERROR: "__tracepoint_nfs4_set_acl" undefined!
ERROR: "__tracepoint_nfs4_remove" undefined!
ERROR: "__tracepoint_nfs4_readdir" undefined!
ERROR: "__tracepoint_nfs4_set_lock" undefined!
ERROR: "__tracepoint_nfs4_mkdir" undefined!
ERROR: "__tracepoint_nfs4_get_security_label" undefined!
ERROR: "__tracepoint_nfs4_get_fs_locations" undefined!
ERROR: "__tracepoint_nfs4_delegreturn" undefined!
ERROR: "__tracepoint_nfs4_lock_reclaim" undefined!
ERROR: "__tracepoint_nfs4_symlink" undefined!
ERROR: "__tracepoint_nfs4_open_expired" undefined!
ERROR: "__tracepoint_nfs4_get_security_label" [fs/nfs/nfsv4.ko] undefined!
include/linux/compiler.h:321:20: error: call to '__compiletime_assert_1559' declared with attribute error: BUILD_BUG_ON failed: RADIX_TREE_PRELOAD_NR > 1UL << (2 * RADIX_TREE_MAP_SHIFT)

[sparse]
fs/cifs/smb2ops.c:601:1: sparse: symbol 'smb2_query_symlink' was not declared. Should it be static?
include/linux/spinlock.h:340:9: sparse: context imbalance in 'nouveau_event_put' - different lock contexts for basic block
include/linux/spinlock.h:340:9: sparse: context imbalance in 'nouveau_event_get' - different lock contexts for basic block
include/linux/spinlock.h:340:9: sparse: context imbalance in 'nouveau_event_trigger' - different lock contexts for basic block
fs/nfs/nfs4proc.c:349:9: sparse: undefined identifier 'trace_handle_sync_exception'

[coccinelle]
fs/nfs/nfs4super.c:324:3-9: WARNING: PTR_RET can be used
fs/nfs/nfs4super.c:251:3-9: WARNING: PTR_RET can be used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

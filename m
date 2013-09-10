From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 10 Sep 2013 19:42:50 +0000
Subject: build regressions 2013-09-10
Message-Id: <522f763a.BmEHXXNCZR9+e3b4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/f2fs/inode.c:63: error: incompatible types in assignment
fs/f2fs/inode.c:64: error: incompatible types in assignment
fs/f2fs/inode.c:162: error: incompatible type for argument 1 of '__fswab32'
fs/f2fs/inode.c:163: error: incompatible type for argument 1 of '__fswab32'
fs/f2fs/inode.c:63:15: error: incompatible types when assigning to type 'kuid_t' from type 'unsigned int'
fs/f2fs/inode.c:64:15: error: incompatible types when assigning to type 'kgid_t' from type 'unsigned int'

[warnings]
Warning(fs/dcache.c:102): No description found for parameter 'lock'
Warning(fs/dcache.c:102): No description found for parameter 'seq'
Warning(fs/dcache.c:117): No description found for parameter 'lock'
Warning(fs/dcache.c:117): No description found for parameter 'seq'
Warning(fs/dcache.c:2701): No description found for parameter 'buffer'
Warning(fs/dcache.c:2701): No description found for parameter 'buflen'
Warning(fs/dcache.c:2701): No description found for parameter 'name'
WARNING: arch/x86/built-in.o(.text+0x6cbd3): Section mismatch in reference from the function xen_init_lock_cpu() to the variable .init.data:xen_pvspin
WARNING: arch/x86/built-in.o(.text+0x6cd13): Section mismatch in reference from the function xen_uninit_lock_cpu() to the variable .init.data:xen_pvspin

[sparse]
fs/f2fs/inode.c:63:22: sparse: incorrect type in assignment (invalid types) @@    expected struct kuid_t [usertype] i_uid @@    got unsigned istruct kuid_t [usertype] i_uid @@
fs/f2fs/inode.c:64:22: sparse: incorrect type in assignment (invalid types) @@    expected struct kgid_t [usertype] i_gid @@    got unsigned istruct kgid_t [usertype] i_gid @@
fs/f2fs/inode.c:162:21: sparse: cast from non-scalar
fs/f2fs/inode.c:163:21: sparse: cast from non-scalar
fs/f2fs/acl.c:129:39: sparse: cast from unknown type
fs/f2fs/acl.c:91:42: sparse: no member 'e_id' in struct posix_acl_entry

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 03 Dec 2012 16:06:57 +0000
Subject: build regressions 2012-12-03
Message-Id: <50bcce21.FAecdOBBOFpgm523%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x10b24): multiple definition of `walk_page_buffers'
fs/ext4/built-in.o:(.text+0x72b3): first defined here
drivers/ata/pata_of_platform.c:93:13: error: 'ata_platform_remove_one' undeclared here (not in a function)
fs/ext4/xattr.h:422:12: error: two or more data types in declaration specifiers
mm/memory.c:3499:3: error: implicit declaration of function 'set_pmd_at' [-Werror=implicit-function-declaration]
mm/mprotect.c:136:4: error: implicit declaration of function 'set_pmd_at' [-Werror=implicit-function-declaration]

[warnings]
fs/ext4/namei.c:3168:20: warning: 'parent_de' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: vmlinux.o(.text+0x485208): Section mismatch in reference from the function twlreg_probe() to the variable .devinit.rodata:ids

[sparse]
fs/ext4/inline.c:1025:6: sparse: symbol 'ext4_get_inline_xattr_pos' was not declared. Should it be static?
fs/ext4/xattr.c:999:5: sparse: symbol 'ext4_xattr_ibody_set' was not declared. Should it be static?

[smatch]
drivers/gpu/drm/qxl/qxl_ioctl.c:245 qxl_update_area_ioctl() error: potential NULL dereference 'qobj'.
mm/memory.c:3537 do_pmd_numa_page() warn: inconsistent returns spin_lock:ptl: locked (3505) unlocked (3537)
mm/memory.c:3537 do_pmd_numa_page() warn: inconsistent returns spin_lock:__ptl: locked (3537) unlocked (3505)
mm/mempolicy.c:134 get_task_policy() error: we previously assumed 'pol' could be null (see line 128)
mm/memory.c:3606 do_pmd_numa_page() error: double lock 'spin_lock:__ptl'
mm/memory.c:3608 do_pmd_numa_page() error: double unlock 'spin_lock:ptl'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

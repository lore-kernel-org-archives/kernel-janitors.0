From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 10 Feb 2013 18:46:20 +0000
Subject: build regressions 2013-02-10
Message-Id: <5117eafc./9YuuJI4nL+TJm1b%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/blackfin/kernel/process.c:83:8: error: 'idle' undeclared (first use in this function)
arch/blackfin/kernel/process.c:88:4: error: implicit declaration of function 'idle' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/bugs.c:89:20: error: 'struct cpuinfo_x86' has no member named 'hlt_works_ok'
arch/microblaze/kernel/process.c:100:8: error: 'idle' undeclared (first use in this function)
arch/microblaze/kernel/process.c:106:4: error: implicit declaration of function 'idle' [-Werror=implicit-function-declaration]
arch/sparc/include/asm/processor.h:10: Error: Unknown opcode: `extern'

[warnings]
security/apparmor/net.c:121: warning: comparison is always false due to limited range of data type
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS)
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS)
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS)
security/apparmor/lsm.c:779:2: warning: initialization from incompatible pointer type [enabled by default]
security/apparmor/lsm.c:779:2: warning: (near initialization for 'apparmor_ops.sb_mount') [enabled by default]
arch/x86/kernel/smpboot.c:1370:22: warning: unused variable 'c' [-Wunused-variable]

[sparse]
security/apparmor/apparmorfs.c:405:30: sparse: symbol 'aa_fs_profiles_fops' was not declared. Should it be static?
security/apparmor/apparmorfs.c:213:17: sparse: context imbalance in '__next_namespace' - unexpected unlock
security/apparmor/apparmorfs.c:361:17: sparse: context imbalance in 'p_stop' - different lock contexts for basic block
security/apparmor/lsm.c:779:41: sparse: incorrect type in initializer (incompatible argument 1 (different modifiers))
security/apparmor/mount.c:236:25: sparse: duplicate const
fs/ext4/namei.c:2268:17: sparse: Using plain integer as NULL pointer
fs/ext4/namei.c:2303:17: sparse: Using plain integer as NULL pointer
fs/ext4/namei.c:2418:17: sparse: Using plain integer as NULL pointer
fs/ext4/namei.c:2881:17: sparse: Using plain integer as NULL pointer

[smatch]
drivers/gpio/gpiolib.c:873 gpiod_export_link() error: we previously assumed 'desc' could be null (see line 852)
drivers/gpio/gpiolib.c:922 gpiod_sysfs_set_active_low() error: we previously assumed 'desc' could be null (see line 902)
drivers/gpio/gpiolib.c:970 gpiod_unexport() error: we previously assumed 'desc' could be null (see line 945)
security/apparmor/apparmorfs.c:224 __next_namespace() warn: inconsistent returns read_lock:&next->lock: locked (207) unlocked (216,219,224)
fs/ext4/extents_status.c:920 ext4_es_convert_unwritten_extents() warn: variable dereferenced before check 'inode' (see line 825)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

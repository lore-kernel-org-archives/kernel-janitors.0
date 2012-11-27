From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 27 Nov 2012 16:53:23 +0000
Subject: build regressions 2012-11-27
Message-Id: <50b4f003.XE7aaoC/PA8lu+Ld%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/include/asm/vsyscall.h:47:37: error: '__PER_CPU_SEG' undeclared (first use in this function)
./arch/x86/kvm/trace.h:764:392: error: 'VCLOCK_NONE' undeclared (first use in this function)
./arch/x86/kvm/trace.h:764:415: error: 'VCLOCK_TSC' undeclared (first use in this function)
./arch/x86/kvm/trace.h:764:436: error: 'VCLOCK_HPET' undeclared (first use in this function)
arch/x86/kvm/x86.c:931:48: error: request for member 'vclock_mode' in something not a structure or union
drivers/media/v4l2-core/videobuf2-dma-contig.c:743:16: error: 'vb2_dc_get_dmabuf' undeclared here (not in a function)
arch/x86/kvm/x86.c:931:38: error: 'struct clocksource' has no member named 'archdata'
arch/x86/kvm/x86.c:4930:33: error: 'VCLOCK_TSC' undeclared (first use in this function)
ERROR: "allnodes" undefined!
arch/powerpc/kvm/powerpc.c:442:6: error: conflicting types for 'kvm_arch_vcpu_postcreate'
arch/s390/kvm/kvm-s390.c:358:6: error: conflicting types for 'kvm_arch_vcpu_postcreate'
mm/huge_memory.c:2675:20: error: redefinition of 'mm'
fs/nfs/blocklayout/blocklayout.c:1061:46: error: dereferencing pointer to incomplete type
arch/x86/kernel/pvclock.c:183:24: error: 'PVCLOCK_FIXMAP_END' undeclared (first use in this function)
arch/x86/kernel/pvclock.c:183:43: error: 'PVCLOCK_FIXMAP_BEGIN' undeclared (first use in this function)
arch/x86/include/asm/kvm_host.h:567:2: error: unknown type name 'cycle_t'
fs/notify/inotify/inotify_user.c:333:17: error: 'inotify_show_fdinfo' undeclared here (not in a function)
fs/notify/fanotify/fanotify_user.c:436:17: error: 'fanotify_show_fdinfo' undeclared here (not in a function)

[warnings]
arch/x86/kvm/x86.c:931:27: warning: assignment makes integer from pointer without a cast [enabled by default]
arch/x86/kvm/x86.c:1261:42: warning: comparison between pointer and integer [enabled by default]
drivers/w1/masters/w1-gpio.c:50:28: warning: 'w1_gpio_dt_ids' defined but not used [-Wunused-variable]
drivers/staging/gdm72xx/gdm_usb.c:319:23: warning: unused variable 'flags2' [-Wunused-variable]
arch/powerpc/kvm/powerpc.c:444:2: warning: 'return' with a value, in function returning void [enabled by default]
arch/s390/kvm/kvm-s390.c:360:2: warning: 'return' with a value, in function returning void [enabled by default]
WARNING: drivers/w1/masters/w1-gpio.o(.data+0x190): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:w1_gpio_probe()
fs/f2fs/node.c:175:3: warning: 'ne.block_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/node.c:176:3: warning: 'ne.ino' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/node.c:177:3: warning: 'ne.version' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/kvm/x86.c:1325:6: warning: passing argument 2 of 'kvm_get_time_and_clockread' from incompatible pointer type [enabled by default]

[sparse]
arch/x86/kernel/paravirt.c:480:23: sparse: incorrect type in initializer (incompatible argument 1 (different type sizes))
arch/x86/kernel/pvclock.c:148:5: sparse: symbol 'pvclock_task_migrate' was not declared. Should it be static?
fs/xfs/xfs_log.c:1709:32: sparse: incorrect type in assignment (different base types)
fs/xfs/xfs_log.c:1568:29: sparse: incorrect type in return expression (different base types)
fs/xfs/xfs_log_recover.c:3239:13: sparse: restricted __be32 degrades to integer
fs/xfs/xfs_log_recover.c:3239:25: sparse: restricted __le32 degrades to integer
fs/xfs/xfs_log_recover.c:3243:41: sparse: cast to restricted __be32
fs/xfs/xfs_log_recover.c:3243:41: sparse: cast from restricted __le32
net/ipv4/ip_vti.c:334:12: sparse: context imbalance in 'vti_rcv' - different lock contexts for basic block
fs/notify/fdinfo.c:53:87: sparse: Using plain integer as NULL pointer
fs/f2fs/checkpoint.c:271:29: sparse: restricted __le32 degrades to integer
fs/f2fs/f2fs.h:591:22: sparse: cast to restricted __le64
fs/f2fs/f2fs.h:591:22: sparse: cast from restricted __le32
fs/f2fs/checkpoint.c:290:36: sparse: invalid assignment: &fs/f2fs/node.c:1448:25: sparse: incorrect type in assignment (different base types)
fs/f2fs/f2fs.h:581:43: sparse: incorrect type in initializer (different base types)
drivers/staging/vt6656/iwctl.c:1792:9: sparse: Initializer entry defined twice
./arch/x86/kvm/trace.h:764:1: sparse: undefined identifier 'VCLOCK_NONE'
./arch/x86/kvm/trace.h:764:1: sparse: undefined identifier 'VCLOCK_TSC'
./arch/x86/kvm/trace.h:764:1: sparse: undefined identifier 'VCLOCK_HPET'
arch/x86/kvm/x86.c:931:52: sparse: no member 'archdata' in struct clocksource
arch/x86/kvm/x86.c:1112:57: sparse: undefined identifier 'VCLOCK_TSC'
drivers/media/v4l2-core/videobuf2-dma-contig.c:743:27: sparse: undefined identifier 'vb2_dc_get_dmabuf'

[smatch]
drivers/i2c/busses/i2c-cbus.c:341 cbus_i2c_probe() warn: possible memory leak of 'chost'
drivers/input/misc/retu-pwrbutton.c:107 retu_pwrbutton_remove() error: don't call input_free_device() after input_unregister_device()

[coccinelle]
drivers/video/omap2/dss/dsi.c:134:50-67: duplicated argument to & or |
drivers/video/omap2/dss/core.c:185:1-3: WARNING: PTR_RET can be used
drivers/scsi/csiostor/csio_scsi.c:1407:2-17: code aligned with following code on line 1410
drivers/scsi/csiostor/csio_mb.c:1631:46-52: ERROR: application of sizeof to pointer
drivers/scsi/csiostor/csio_init.c:64:0-13: WARNING opportunity for simple_open, see also structure on line 113

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

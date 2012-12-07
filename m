From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 07 Dec 2012 16:27:58 +0000
Subject: build regressions 2012-12-07
Message-Id: <50c2190e.tLATBT+93eYZwm7s%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
dma-default.c:(.text+0xb310): undefined reference to `coherentio'
dma-default.c:(.text+0xb958): undefined reference to `hw_coherentio'
ERROR: "backlight_device_unregister" [drivers/platform/x86/ideapad-laptop.ko] undefined!
ERROR: "backlight_device_register" [drivers/platform/x86/ideapad-laptop.ko] undefined!

[warnings]
mm/memory.c:74:3: warning: #warning Large NUMA config, growing page-frame for last_cpu+pid. [-Wcpp]
net/sunrpc/svcsock.c:1083:4: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'u32' [-Wformat]
fs/btrfs/inode.c:1328:23: warning: 'disk_num_bytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/inode.c:1332:31: warning: 'extent_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/tree-log.c:3228:40: warning: 'extent_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/brcm80211/brcmsmac/channel.c:674:15: warning: unused variable 'ret' [-Wunused-variable]

[sparse]
drivers/spi/spi.c:1554:37: sparse: incompatible types in comparison expression (different signedness)
arch/x86/kernel/crash.c:49:32: sparse: incompatible types in comparison expression (different address spaces)
arch/x86/kvm/vmx.c:7444:9: sparse: cannot dereference this type
fs/btrfs/tree-log.c:3375:20: sparse: context imbalance in 'log_one_extent' - unexpected unlock
net/tipc/port.c:1047:9: sparse: context imbalance in 'tipc_connect' - unexpected unlock
net/tipc/port.c:1085:25: sparse: context imbalance in '__tipc_connect' - unexpected unlock
mm/memory.c:74:3: sparse: Large NUMA config, growing page-frame for last_cpu+pid.
drivers/gpu/drm/nouveau/core/subdev/therm/fannil.c:34:1: sparse: symbol 'nouveau_fannil_set' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/therm/fantog.c:85:1: sparse: symbol 'nouveau_fantog_set' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:84:1: sparse: symbol 'nv40_fan_pwm_ctrl' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/subdev/bus/nv04.c:33:1: sparse: symbol 'nv04_bus_intr' was not declared. Should it be static?
net/wireless/reg.c:953:35: sparse: incorrect type in argument 1 (different address spaces)
net/sunrpc/svcsock.c:955:25: sparse: cast from restricted __be32

[smatch]
fs/btrfs/ctree.c:5566 btrfs_next_leaf_write() warn: variable dereferenced before check 'b' (see line 5599)
fs/btrfs/tree-log.c:3375 log_one_extent() error: double unlock 'spin_lock:&log->log_extents_lock[index]'
drivers/gpu/drm/nouveau/core/subdev/therm/fanpwm.c:98 nouveau_fanpwm_create() error: potential null dereference 'priv'.  (kzalloc returns null)
drivers/gpu/drm/nouveau/core/subdev/therm/fantog.c:102 nouveau_fantog_create() error: potential null dereference 'priv'.  (kzalloc returns null)

[coccinelle]
fs/btrfs/file.c:1521:1-7: preceding lock on line 1418

[cppcheck]
lib/asn1_decoder.c:199: style: The scope of the variable 'tmp' can be reduced
lib/asn1_decoder.c:363: style: Checking if unsigned variable 'csp' is less than zero.
lib/asn1_decoder.c:421: style: Checking if unsigned variable 'jsp' is less than zero.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 03 Aug 2013 14:06:31 +0000
Subject: build regressions 2013-08-02
Message-Id: <51fd0e67.7CSdq9MHCq7cDCNH%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/f2fs/namei.c:194: error: unknown field 'len' specified in initializer
fs/f2fs/super.c:369: error: invalid type argument of '->'
fs/f2fs/inode.c:63:15: error: incompatible types when assigning to type 'kuid_t' from type '__le32'
fs/f2fs/inode.c:64:15: error: incompatible types when assigning to type 'kgid_t' from type '__le32'
fs/f2fs/inode.c:161:2: error: aggregate value used where an integer was expected
fs/f2fs/inode.c:162:2: error: aggregate value used where an integer was expected

[warnings]
fs/f2fs/namei.c:194: warning: missing braces around initializer
fs/f2fs/namei.c:194: warning: (near initialization for 'dotdot.<anonymous>')
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
Warning(include/net/cfg80211.h:2407): No description found for parameter 'channel_switch'
drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:786:7: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
drivers/usb/gadget/g_ffs.c:76:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/g_ffs.c:76:1: warning: type defaults to 'int' in declaration of 'USB_ETHERNET_MODULE_PARAMETERS' [-Wimplicit-int]
drivers/usb/gadget/g_ffs.c:76:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
drivers/gpu/drm/i915/i915_drv.h:2084:42: warning: 'ddi_translations_dp' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/max8998.c:178:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/infiniband/core/cma.c:489:23: warning: 'port' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/target/mlx4_fc/mfc.c:57:5: sparse: symbol 'fctgt_dbg_lvl' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:87:5: sparse: symbol 'max_cmd_per_lun' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:97:21: sparse: symbol 'fip_ctlrs' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/mr.c:302:5: sparse: symbol 'mlx4_mr_reserve_range' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/mr.c:317:6: sparse: symbol 'mlx4_mr_release_range' was not declared. Should it be static?

[coccinelle]
drivers/hid/uhid.c:390:1-7: Replace memcpy with struct assignment
mm/memcontrol.c:1508:4-5: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Apr 2013 16:07:08 +0000
Subject: build regressions 2013-04-04
Message-Id: <515da52c.evILtFOO0IJwtrYD%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0xd0f4): multiple definition of `rtl_hal_pwrseqcmdparsing'
drivers/net/wireless/rtlwifi/rtl8723ae/built-in.o:(.text+0x10de4): first defined here
(.text+0xc6bf): multiple definition of `rtl92c_phy_ap_calibrate'
drivers/net/wireless/rtlwifi/rtl8192c/built-in.o:(.text+0x4378): first defined here
drivers/net/wireless/iwlwifi/mvm/mac80211.c:565:42: error: 'struct ieee80211_vif' has no member named 'debugfs_dir'
drivers/net/wireless/iwlwifi/mvm/mac80211.c:644:39: error: 'struct ieee80211_vif' has no member named 'debugfs_dir'
drivers/virtio/virtio.c:227:22: error: 'const struct virtio_config_ops' has no member named 'get8'
drivers/virtio/virtio.c:263:15: error: 'const struct virtio_config_ops' has no member named 'set8'
ERROR: "virtio_pci_vring_interrupt" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_config_changed" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_interrupt" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_set_vq_affinity" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_synchronize_vectors" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_find_vqs" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_del_vqs" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "hci_send_cmd" [drivers/bluetooth/btusb.ko] undefined!
ERROR: "virtio_pci_restore" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_freeze" [drivers/virtio/virtio_pci.ko] undefined!

[warnings]
drivers/i2c/busses/i2c-gpio.c:239:11: warning: 'scl_pin' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/i2c/busses/i2c-gpio.c:147:6: warning: 'sda_pin' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/target/iscsi/iscsi_target.c:3589:2: warning: 'hdr' is used uninitialized in this function [-Wuninitialized]
fs/ext4/extents.c:3299:21: warning: 'abut_ex' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: arch/ia64/kernel/err_inject.o(.exit.text+0x191): Section mismatch in reference from the function cleanup_module() to the variable .cpuinit.data:err_inject_cpu_notifier
drivers/net/wireless/rtlwifi/rtl8188ee/trx.h:553:6: warning: "__LITTLE_ENDIAN" is not defined [-Wundef]
drivers/net/wireless/rtlwifi/rtl8188ee/trx.h:577:5: warning: "__LITTLE_ENDIAN" is not defined [-Wundef]
drivers/target/iscsi/iscsi_target.c:3564:28: warning: 'hdr' may be used uninitialized in this function [-Wuninitialized]
warning: .data..per_cpu not found - this is probably an error
warning: .data..per_cpu not found - this is probably an error

[sparse]
drivers/scsi/hptiop.c:149:51: sparse: dereference of noderef expression
net/ipv4/udp.c:1550:9: sparse: context imbalance in 'udp_get_first' - wrong count at exit
net/ipv4/udp.c:1563:17: sparse: context imbalance in 'udp_get_next' - unexpected unlock

[smatch]
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:1779 _rtl88ee_read_adapter_info() error: __builtin_memcpy() '&rtlefuse->efuse_map[0][0]' too small (256 vs 512)
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:383 chnl_step_by_step() error: potential NULL dereference 'currentcmd'.
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:387 _rtl88e_fill_h2c_command() error: __builtin_memcpy() '(boxext)' too small (2 vs 4)
drivers/block/mtip32xx/mtip32xx.c:2728 show_device_status() warn: variable dereferenced before check 'dd' (see line 2727)
drivers/block/mtip32xx/mtip32xx.c:2758 show_device_status() warn: variable dereferenced before check 'dd' (see line 2757)
drivers/target/iscsi/iscsi_target.c:3589 iscsit_send_reject() error: potentially dereferencing uninitialized 'hdr'.
drivers/net/ethernet/intel/igb/igb_main.c:7015 igb_set_spd_dplx() warn: was && intended here instead of ||?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

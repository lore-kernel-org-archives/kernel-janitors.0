From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 11 Feb 2013 16:34:44 +0000
Subject: build regressions 2013-02-11
Message-Id: <51191da4.88JyNmb2TJCw10L0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/char/scet.c:255:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_probe'
drivers/char/scet.c:298:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'scet_remove'
drivers/char/scet.c:319:11: error: 'scet_probe' undeclared here (not in a function)
drivers/char/scet.c:320:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/char/scet.c:320:24: error: 'scet_remove' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1555:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_remove'
drivers/usb/host/ohs900-hcd.c:1572:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'ohs900h_probe'
drivers/usb/host/ohs900-hcd.c:1788:11: error: 'ohs900h_probe' undeclared here (not in a function)
drivers/usb/host/ohs900-hcd.c:1789:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/usb/host/ohs900-hcd.c:1789:24: error: 'ohs900h_remove' undeclared here (not in a function)
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:57: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:59: error: expected ';' before '{' token
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:615:57: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:615:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:615:59: error: expected ';' before '{' token
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1037:57: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1037:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1037:59: error: expected ';' before '{' token
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1080:47: error: macro "hlist_for_each_entry" passed 4 arguments, but takes just 3
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1080:3: error: 'hlist_for_each_entry' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1080:49: error: expected ';' before '{' token
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:53: error: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:5: error: 'hlist_for_each_entry_rcu' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:55: error: expected ';' before '{' token
net/mac80211/vht.c:155:15: error: 'IEEE80211_VHT_OPMODE_RX_NSS_TYPE_BF' undeclared (first use in this function)
net/mac80211/vht.c:158:17: error: 'IEEE80211_VHT_OPMODE_RX_NSS_MASK' undeclared (first use in this function)
net/mac80211/vht.c:159:10: error: 'IEEE80211_VHT_OPMODE_RX_NSS_SHIFT' undeclared (first use in this function)
net/mac80211/vht.c:167:19: error: 'IEEE80211_VHT_OPMODE_CHANWIDTH_MASK' undeclared (first use in this function)
net/mac80211/vht.c:168:7: error: 'IEEE80211_VHT_OPMODE_CHANWIDTH_20MHZ' undeclared (first use in this function)
net/mac80211/vht.c:171:7: error: 'IEEE80211_VHT_OPMODE_CHANWIDTH_40MHZ' undeclared (first use in this function)
net/mac80211/vht.c:174:7: error: 'IEEE80211_VHT_OPMODE_CHANWIDTH_80MHZ' undeclared (first use in this function)
net/mac80211/vht.c:177:7: error: 'IEEE80211_VHT_OPMODE_CHANWIDTH_160MHZ' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1781:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1781:15: error: 'SUSPEND_POWER_DOWN' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1784:6: error: 'state' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1784:15: error: 'PM_SUSPEND_MEM' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1789:6: error: 'struct platform_device' has no member named 'power'
drivers/usb/host/ohs900-hcd.c:1798:6: error: 'phase' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1798:15: error: 'RESUME_POWER_ON' undeclared (first use in this function)
drivers/usb/host/ohs900-hcd.c:1804:46: error: 'struct usb_hcd' has no member named 'can_wakeup'
drivers/input/serio/opencores_ps2.c:113:2: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:119:2: error: implicit declaration of function 'platform_get_irq' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:125:7: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:142:10: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:146:2: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:154:35: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:155:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:157:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:161:2: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:178:9: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:194:15: error: variable 'ocps2_driver' has initializer but incomplete type
drivers/input/serio/opencores_ps2.c:195:2: error: unknown field 'probe' specified in initializer
drivers/input/serio/opencores_ps2.c:196:2: error: unknown field 'remove' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: unknown field 'driver' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: extra brace group at end of initializer
drivers/input/serio/opencores_ps2.c:206:2: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:211:2: error: implicit declaration of function 'platform_driver_unregister' [-Werror=implicit-function-declaration]
drivers/spi/spi_opencores.c:22:25: fatal error: asm/cpuinfo.h: No such file or directory
drivers/gpu/drm/qxl/qxl_cmd.c:303:4: error: label 'out' used but not defined

[warnings]
drivers/usb/host/ohs900-hcd.c:1517:25: warning: 'ohs900h_hc_driver' defined but not used [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_cmd.c:442:7: warning: unused variable 'res' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_ttm.c:157:6: warning: unused variable 'count_loops' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_ttm.c:154:21: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_ttm.c:443:7: warning: unused variable 'i' [-Wunused-variable]
WARNING: vmlinux.o(.text+0x1873fe0): Section mismatch in reference from the function cx18_alsa_load() to the function .init.text:snd_cx18_pcm_create()
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:576:26: warning: unused variable 'tmp' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:576:22: warning: unused variable 'n' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:575:26: warning: unused variable 'entry' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:567:6: warning: unused variable 'qpn' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:612:7: warning: unused variable 'prev_mac_u64' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:611:26: warning: unused variable 'tmp' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:611:22: warning: unused variable 'n' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:610:26: warning: unused variable 'entry' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:609:16: warning: unused variable 'mac_hash' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:604:6: warning: unused variable 'err' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1024:6: warning: unused variable 'err' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1023:6: warning: unused variable 'mac' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1021:25: warning: unused variable 'tmp' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1021:21: warning: unused variable 'n' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1020:25: warning: unused variable 'entry' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_rx.c:620:24: warning: unused variable 'n' [-Wunused-variable]
drivers/net/ethernet/mellanox/mlx4/en_rx.c:619:28: warning: unused variable 'entry' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_ttm.c:437:3: warning: format '%d' expects argument of type 'int', but argument 8 has type 'size_t' [-Wformat]
drivers/usb/host/ohs900-hcd.c:236:20: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/host/ohs900-hcd.c:264:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/host/ohs900-hcd.c:1778:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1796:9: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1825:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/usb/host/ohs900-hcd.c:1825:2: warning: (near initialization for 'ohs900h_driver.suspend') [enabled by default]
drivers/char/scet.c:145:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/char/scet.c:169:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/input/serio/opencores_ps2.c:101:31: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:101:31: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/input/serio/opencores_ps2.c:113:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:176:32: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:178:31: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
include/uapi/linux/sem.h:45:7: warning: union cannot be made transparent [enabled by default]
drivers/gpu/drm/qxl/qxl_cmd.c:305:1: warning: label 'out' defined but not used [-Wunused-label]
WARNING: drivers/media/pci/ivtv/ivtv-alsa.o(.text+0x1fb): Section mismatch in reference from the function ivtv_alsa_load() to the function .init.text:snd_ivtv_pcm_create()

[sparse]
include/uapi/linux/sem.h:51:19: sparse: attribute 'transparent_union': unknown attribute
include/uapi/linux/sem.h:51:19: sparse: attribute 'transparent_union': unknown attribute
include/uapi/linux/sem.h:51:19: sparse: attribute 'transparent_union': unknown attribute
include/uapi/linux/sem.h:51:19: sparse: attribute 'transparent_union': unknown attribute
include/uapi/linux/sem.h:51:19: sparse: attribute 'transparent_union': unknown attribute
drivers/char/scet.c:261:9: sparse: Trying to use reserved word 'do' as identifier
drivers/char/scet.c:261:9: sparse: Trying to use reserved word 'if' as identifier
drivers/char/scet.c:266:9: sparse: Trying to use reserved word 'if' as identifier
drivers/char/scet.c:267:17: sparse: Trying to use reserved word 'if' as identifier
drivers/char/scet.c:269:17: sparse: Trying to use reserved word 'goto' as identifier
drivers/char/scet.c:274:17: sparse: Trying to use reserved word 'if' as identifier
drivers/char/scet.c:276:17: sparse: Trying to use reserved word 'goto' as identifier
drivers/char/scet.c:281:9: sparse: Trying to use reserved word 'if' as identifier
drivers/char/scet.c:283:17: sparse: Trying to use reserved word 'goto' as identifier
drivers/char/scet.c:289:9: sparse: Trying to use reserved word 'do' as identifier
drivers/char/scet.c:289:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Trying to use reserved word 'do' as identifier
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1565:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1569:9: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1592:9: sparse: Trying to use reserved word 'do' as identifier
drivers/usb/host/ohs900-hcd.c:1592:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1594:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1601:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1602:17: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1603:17: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1607:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1611:17: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1615:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1620:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1626:17: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1631:17: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1634:25: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1639:17: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1641:25: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1646:17: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1648:25: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/host/ohs900-hcd.c:1656:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/host/ohs900-hcd.c:1663:9: sparse: Trying to use reserved word 'do' as identifier
drivers/usb/host/ohs900-hcd.c:1663:9: sparse: too many errors
fs/ext4/extents.c:4796:36: sparse: restricted __le16 degrades to integer
fs/ext4/extents.c:4801:21: sparse: incorrect type in assignment (different base types)
drivers/xen/grant-table.c:1146:28: sparse: bad constant expression
drivers/xen/grant-table.c:1147:28: sparse: bad constant expression
drivers/hv/hv_balloon.c:526:15: sparse: symbol 'compute_balloon_floor' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:17: sparse: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:615:17: sparse: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1037:17: sparse: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:1080:17: sparse: macro "hlist_for_each_entry" passed 4 arguments, but takes just 3
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:593:33: sparse: break/continue not in iterator scope
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:607:9: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:632:33: sparse: Trying to use reserved word 'return' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:646:9: sparse: Trying to use reserved word 'for' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:659:9: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:664:9: sparse: Trying to use reserved word 'return' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:669:37: sparse: Trying to use reserved word 'struct' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:675:9: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:679:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:694:9: sparse: Trying to use reserved word 'for' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:694:9: sparse: Trying to use reserved word 'typeof' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:694:9: sparse: Trying to use reserved word 'typeof' as identifier
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:697:9: sparse: too many errors
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:33: sparse: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
drivers/net/ethernet/mellanox/mlx4/en_rx.c:647:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:656:33: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:658:41: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:664:41: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:667:41: sparse: Trying to use reserved word 'struct' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:672:41: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:685:41: sparse: Trying to use reserved word 'goto' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:700:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:702:25: sparse: Trying to use reserved word 'goto' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:707:25: sparse: Trying to use reserved word 'goto' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:714:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:717:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:731:17: sparse: Trying to use reserved word 'if' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:742:9: sparse: Trying to use reserved word 'return' as identifier
drivers/net/ethernet/mellanox/mlx4/en_rx.c:748:33: sparse: too many errors
drivers/usb/host/ohs900-hcd.c:1555:22: sparse: Expected ; at end of declaration
drivers/usb/host/ohs900-hcd.c:1555:22: sparse: got ohs900h_remove
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: got {
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Expected ) in function declarator
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: got (
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Expected ; at the end of type declaration
drivers/usb/host/ohs900-hcd.c:1566:17: sparse: got iounmap
drivers/char/scet.c:255:22: sparse: Expected ; at end of declaration
drivers/char/scet.c:255:22: sparse: got scet_probe
drivers/char/scet.c:261:9: sparse: got {
drivers/char/scet.c:261:9: sparse: Expected ) in function declarator
drivers/char/scet.c:261:9: sparse: got (
drivers/char/scet.c:261:9: sparse: Expected ; at the end of type declaration
drivers/char/scet.c:269:22: sparse: got out
drivers/char/scet.c:294:4: sparse: got :
drivers/char/scet.c:263:29: sparse: undefined identifier 'pdev'
drivers/char/scet.c:265:9: sparse: symbol 'r' redeclared with different type (originally declared at drivers/char/scet.c:259) - different base types
drivers/char/scet.c:319:18: sparse: undefined identifier 'scet_probe'
drivers/char/scet.c:320:19: sparse: undefined identifier '__devexit_p'
drivers/char/scet.c:324:38: sparse: undefined identifier 'scet_match'
drivers/input/serio/opencores_ps2.c:113:21: sparse: undefined identifier 'platform_get_resource'
drivers/input/serio/opencores_ps2.c:119:24: sparse: undefined identifier 'platform_get_irq'
drivers/input/serio/opencores_ps2.c:125:14: sparse: using member 'name' in incomplete struct platform_device
drivers/input/serio/opencores_ps2.c:146:9: sparse: using member 'dev' in incomplete struct platform_device
drivers/input/serio/opencores_ps2.c:161:9: sparse: undefined identifier 'platform_set_drvdata'
drivers/input/serio/opencores_ps2.c:178:38: sparse: undefined identifier 'platform_get_drvdata'
drivers/input/serio/opencores_ps2.c:195:10: sparse: unknown field name in initializer
drivers/input/serio/opencores_ps2.c:206:16: sparse: undefined identifier 'platform_driver_register'
drivers/input/serio/opencores_ps2.c:211:9: sparse: undefined identifier 'platform_driver_unregister'
drivers/spi/spi_opencores.c:22:11: sparse: unable to open 'asm/cpuinfo.h'
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:83: sparse: Expected ; at end of statement
drivers/net/ethernet/mellanox/mlx4/en_rx.c:628:83: sparse: got {
drivers/net/ethernet/mellanox/mlx4/en_rx.c:643:24: sparse: Expected ; at end of declaration
drivers/net/ethernet/mellanox/mlx4/en_rx.c:647:21: sparse: Expected ) in function declarator
drivers/net/ethernet/mellanox/mlx4/en_rx.c:647:21: sparse: got (
drivers/net/ethernet/mellanox/mlx4/en_rx.c:667:41: sparse: Expected ) in nested declarator
drivers/net/ethernet/mellanox/mlx4/en_rx.c:667:41: sparse: got skb_shared_info
drivers/net/ethernet/mellanox/mlx4/en_rx.c:677:41: sparse: Expected ; at the end of type declaration
drivers/net/ethernet/mellanox/mlx4/en_rx.c:685:46: sparse: got next
drivers/net/ethernet/mellanox/mlx4/en_rx.c:724:5: sparse: got :
drivers/net/ethernet/mellanox/mlx4/en_rx.c:742:16: sparse: got polled
drivers/net/ethernet/mellanox/mlx4/en_rx.c:748:33: sparse: got mlx4_en_cq
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:73: sparse: Expected ; at end of statement
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:582:73: sparse: got {
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:595:17: sparse: Expected ; at the end of type declaration
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:607:16: sparse: Expected ) in function declarator
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:615:73: sparse: Expected ; at end of declaration
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:632:40: sparse: got err
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:669:37: sparse: Expected ) in nested declarator
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:669:37: sparse: got mlx4_en_priv
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:680:25: sparse: got en_print
drivers/net/ethernet/mellanox/mlx4/en_netdev.c:694:9: sparse: got )

[smatch]
drivers/misc/mei/bus.c:161 mei_add_device() error: dereferencing freed memory 'client'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

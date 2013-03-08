From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 08 Mar 2013 16:18:36 +0000
Subject: build regressions 2013-03-08
Message-Id: <513a0f5c.kQ0smJf9xdGOLO+b%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/hid/hid-logitech-dj.c:437:2: error: implicit declaration of function 'usbhid_submit_report' [-Werror=implicit-function-declaration]
net/netlabel/netlabel_unlabeled.c:1324:16: error: 'iter_addr6' undeclared (first use in this function)
drivers/net/ethernet/davicom/wemac.c:900:2: error: implicit declaration of function 'of_get_mac_address' [-Werror=implicit-function-declaration]
net/nfc/llcp/llcp.c:242:69: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/nfc/llcp/llcp.c:242:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
net/nfc/llcp/llcp.c:242:71: error: expected ';' before '{' token
net/nfc/llcp/llcp.c:1284:39: error: macro "hlist_for_each_entry" passed 4 arguments, but takes just 3
net/nfc/llcp/llcp.c:1283:4: error: 'hlist_for_each_entry' undeclared (first use in this function)
net/nfc/llcp/llcp.c:1284:41: error: expected ';' before '{' token
net/nfc/llcp/commands.c:195:51: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/nfc/llcp/commands.c:195:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
net/nfc/llcp/commands.c:195:53: error: expected ';' before '{' token
net/nfc/llcp/commands.c:550:55: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/nfc/llcp/commands.c:550:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
net/nfc/llcp/commands.c:550:57: error: expected ';' before '{' token
net/nfc/llcp/commands.c:580:57: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/nfc/llcp/commands.c:580:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
net/nfc/llcp/commands.c:580:59: error: expected ';' before '{' token
fs/9p/vfs_inode.c:903:2: error: too few arguments to function 'finish_open'
fs/9p/vfs_inode_dotl.c:360:2: error: too few arguments to function 'finish_open'
fs/ceph/file.c:272:3: error: too few arguments to function 'finish_open'
kernel/trace/trace_branch.c:55:9: error: 'struct trace_array' has no member named 'data'
kernel/trace/trace_branch.c:55:9: error: 'struct trace_array' has no member named 'data'
kernel/trace/trace_branch.c:55:9: error: 'struct trace_array' has no member named 'data'
kernel/trace/trace_branch.c:60:13: error: 'struct trace_array' has no member named 'buffer'
fs/fuse/dir.c:480:2: error: too few arguments to function 'finish_open'

[warnings]
net/netlabel/netlabel_unlabeled.c:1193:6: warning: unused variable 'skip_addr6' [-Wunused-variable]
net/netlabel/netlabel_unlabeled.c:1277:6: warning: unused variable 'skip_addr6' [-Wunused-variable]
sound/pci/hda/hda_eld.c:58:14: warning: 'eld_connection_type_names' defined but not used [-Wunused-variable]
sound/pci/hda/hda_eld.c:96:14: warning: 'cea_audio_coding_type_names' defined but not used [-Wunused-variable]
kernel/trace/trace_selftest.c:1161:2: warning: passing argument 1 of 'trace_test_buffer' from incompatible pointer type [enabled by default]
drivers/staging/zcache/zcache-main.c:1836:1: warning: return from incompatible pointer type [enabled by default]
drivers/staging/zcache/zcache-main.c:1837:1: warning: return from incompatible pointer type [enabled by default]
drivers/staging/zcache/zcache-main.c:1841:1: warning: return from incompatible pointer type [enabled by default]
drivers/usb/host/xhci-ring.c:3476:16: warning: 'ep_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/9p/vfs_inode.c:903:2: warning: passing argument 3 of 'finish_open' from incompatible pointer type [enabled by default]
fs/9p/vfs_inode.c:903:2: warning: passing argument 4 of 'finish_open' from incompatible pointer type [enabled by default]
fs/9p/vfs_inode_dotl.c:360:2: warning: passing argument 3 of 'finish_open' from incompatible pointer type [enabled by default]
fs/9p/vfs_inode_dotl.c:360:2: warning: passing argument 4 of 'finish_open' from incompatible pointer type [enabled by default]
fs/ceph/file.c:272:3: warning: passing argument 3 of 'finish_open' from incompatible pointer type [enabled by default]
fs/ceph/file.c:272:3: warning: passing argument 4 of 'finish_open' from incompatible pointer type [enabled by default]
fs/fuse/dir.c:480:2: warning: passing argument 3 of 'finish_open' from incompatible pointer type [enabled by default]
fs/fuse/dir.c:480:2: warning: passing argument 4 of 'finish_open' from incompatible pointer type [enabled by default]
net/nfc/llcp/commands.c:193:27: warning: unused variable 'n' [-Wunused-variable]
net/nfc/llcp/commands.c:193:21: warning: unused variable 'pos' [-Wunused-variable]
net/nfc/llcp/commands.c:192:27: warning: unused variable 'sdp' [-Wunused-variable]
net/nfc/llcp/commands.c:543:27: warning: unused variable 'n' [-Wunused-variable]
net/nfc/llcp/commands.c:543:21: warning: unused variable 'pos' [-Wunused-variable]
net/nfc/llcp/commands.c:542:27: warning: unused variable 'sdp' [-Wunused-variable]
net/nfc/llcp/commands.c:567:27: warning: unused variable 'n' [-Wunused-variable]
net/nfc/llcp/commands.c:567:21: warning: unused variable 'pos' [-Wunused-variable]
net/nfc/llcp/commands.c:566:27: warning: unused variable 'sdreq' [-Wunused-variable]
net/nfc/llcp/llcp.c:234:27: warning: unused variable 'sdp' [-Wunused-variable]
net/nfc/llcp/llcp.c:233:27: warning: unused variable 'n' [-Wunused-variable]
net/nfc/llcp/llcp.c:233:21: warning: unused variable 'pos' [-Wunused-variable]
net/nfc/llcp/llcp.c:1195:21: warning: unused variable 'pos' [-Wunused-variable]
drivers/scsi/storvsc_drv.c:840:2: warning: 'process_err_fn' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/mm/numa.c:619:1: warning: label 'out' defined but not used [-Wunused-label]

[sparse]
fs/ceph/file.c:272:49: sparse: incorrect type in argument 3 (different base types)
fs/ceph/file.c:272:60: sparse: incorrect type in argument 4 (different base types)
fs/ceph/file.c:272:34: sparse: not enough arguments for function finish_open
net/bluetooth/hci_event.c:2503:38: sparse: incorrect type in argument 2 (different base types)
net/bluetooth/hci_event.c:2598:36: sparse: incorrect type in argument 2 (different base types)

[smatch]
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00167-ga06363d"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00065-g69fbb7e"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00054-ga61968a"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-02945-ge8e05e8"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00081-g2598bfb"' too small (25 vs 32)
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00302-g282fbf8"' too small (25 vs 32)
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00184-g333e971"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00060-g84c3045"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00038-g3abb37d"' too small (25 vs 32)
lib/lz4/lz4_decompress.c:138 lz4_uncompress() error: potential NULL dereference 'ref'.
lib/lz4/lz4_decompress.c:263 lz4_uncompress_unknownoutputsize() error: potential NULL dereference 'ref'.
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-mm1-00315-g391ef7f"' too small (29 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00331-g72d92c5"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00196-g47b3bc9"' too small (25 vs 32)
drivers/net/team/team.c:1760 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00210-g93f63e8"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00101-g02421e6"' too small (25 vs 32)
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00179-gdcb5757"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00104-g655968d"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00229-g18ad64e"' too small (25 vs 32)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

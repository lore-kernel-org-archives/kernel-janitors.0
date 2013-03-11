From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 11 Mar 2013 17:21:51 +0000
Subject: build regressions 2013-03-11
Message-Id: <513e12af.RNN5/Gm5pgz5LVWC%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/musb/musb_core.c:1971:56: error: 'musb_attr_group' undeclared (first use in this function)
ERROR: "crc32_be" [drivers/media/pci/saa7134/saa6752hs.ko] undefined!
ERROR: "DRIVERRELEASE_DIDD" [drivers/isdn/hardware/eicon/divadidd.ko] undefined!
fs/xfs/xfs_log_cil.c:94:3: error: continue statement not within a loop
fs/xfs/xfs_log_cil.c:174:12: error: 'ip' undeclared (first use in this function)

[warnings]
fs/xfs/xfs_inode_item.c:673:2: warning: initialization from incompatible pointer type [enabled by default]
fs/xfs/xfs_inode_item.c:673:2: warning: (near initialization for 'xfs_inode_item_ops.iop_prepare') [enabled by default]
net/mac80211/iface.c:930:6: warning: suggest parentheses around '&&' within '||' [-Wparentheses]

[smatch]
kernel/trace/trace_output.c:49 trace_print_bputs_msg_only() error: potentially dereferencing uninitialized 'field'.
kernel/trace/trace_output.c:1274 trace_bputs_print() error: potentially dereferencing uninitialized 'field'.
kernel/trace/trace_output.c:1299 trace_bputs_raw() error: potentially dereferencing uninitialized 'field'.
kernel/trace/trace_entries.h:247 ____ftrace_check_bputs() error: potential NULL dereference '__entry'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 01:20:35 +0000
Subject: [nfc:nfc-next 17/20] ERROR: "llc_set_station_handler" [net/llc/llc2.ko] undefined!
Message-Id: <20120914012035.GA9420@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Eric,

tree:   git://git.infradead.org/users/vcgomes/linux-nfc.git nfc-next
head:   73fecc5ce0bba7aa0cc8719529964b55e00c00bc
commit: 3255a18a4e9fa5d4c69cb7f104aac51e425ffd6e [17/20] NFC: Add an LLC Core layer to HCI
config: x86_64-allmodconfig

ERROR: "llc_set_station_handler" [net/llc/llc2.ko] undefined!
ERROR: "llc_sap_list" [net/llc/llc2.ko] undefined!
ERROR: "llc_mac_hdr_init" [net/llc/llc2.ko] undefined!
ERROR: "llc_remove_pack" [net/llc/llc2.ko] undefined!
ERROR: "llc_sap_find" [net/llc/llc2.ko] undefined!
ERROR: "llc_add_pack" [net/llc/llc2.ko] undefined!
ERROR: "llc_sap_open" [net/llc/llc2.ko] undefined!
ERROR: "llc_sap_close" [net/llc/llc2.ko] undefined!
ERROR: "llc_build_and_send_ui_pkt" [net/llc/llc2.ko] undefined!



---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

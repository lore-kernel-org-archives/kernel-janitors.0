From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 21 May 2013 05:29:46 +0000
Subject: build regressions 2013-05-20
Message-Id: <519b064a.fgi3vtH5ejg6US/Z%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/block/blockconsole.c:154: error: implicit declaration of function 'cmpxchg64'
smsusb.c:(.text+0xc0467): undefined reference to `smscore_getbuffer'
smsusb.c:(.text+0xc04b5): undefined reference to `smsendian_handle_message_header'
smsusb.c:(.text+0xc04e6): undefined reference to `smscore_onresponse'
smsusb.c:(.text+0xc057c): undefined reference to `smscore_putbuffer'
smsusb.c:(.text+0xc06b9): undefined reference to `smscore_unregister_device'
smsusb.c:(.text+0xc0708): undefined reference to `smsendian_handle_message_header'
smsusb.c:(.text+0xc07ec): undefined reference to `sms_get_board'
smsusb.c:(.text+0xc086a): undefined reference to `smscore_register_device'
smsusb.c:(.text+0xc0882): undefined reference to `smscore_set_board_id'
smsusb.c:(.text+0xc08bb): undefined reference to `smscore_start_device'
smsusb.c:(.text+0xc097c): undefined reference to `sms_board_load_modules'
smsusb.c:(.text+0xc09fa): undefined reference to `smscore_registry_getmode'
smsusb.c:(.text+0xc0a0c): undefined reference to `sms_get_board'
smssdio.c:(.text+0xc6bac): undefined reference to `smscore_putbuffer'
smssdio.c:(.text+0xc6bb4): undefined reference to `smscore_unregister_device'
smssdio.c:(.text+0xc6c72): undefined reference to `sms_get_board'
smssdio.c:(.text+0xc6ca3): undefined reference to `smscore_register_device'
smssdio.c:(.text+0xc6cb4): undefined reference to `smscore_set_board_id'
smssdio.c:(.text+0xc6d02): undefined reference to `smscore_unregister_device'
smssdio.c:(.text+0xc6d2d): undefined reference to `smscore_start_device'
smssdio.c:(.text+0xc6e13): undefined reference to `smscore_onresponse'
smssdio.c:(.text+0xc6e64): undefined reference to `smscore_getbuffer'
smssdio.c:(.text+0xc6ed2): undefined reference to `smscore_putbuffer'
ngene-cards.c:(.text+0xe7d3c): undefined reference to `lgdt330x_attach'
ngene-cards.c:(.text+0xe7d59): undefined reference to `mt2131_attach'
smsusb.c:(.text+0xc5678): undefined reference to `smscore_translate_msg'
smsusb.c:(.text+0xc588e): undefined reference to `smscore_translate_msg'
smsusb.c:(.text+0xc5616): undefined reference to `smsendian_handle_rx_message'
smsusb.c:(.text+0xc5caa): undefined reference to `smsendian_handle_tx_message'
smssdio.c:(.text+0xcc05d): undefined reference to `smsendian_handle_rx_message'
smssdio.c:(.text+0xcc179): undefined reference to `smsendian_handle_tx_message'
ngene-cards.c:(.text+0xc56ab): undefined reference to `lnbh24_attach'
ngene-cards.c:(.text+0xc5727): undefined reference to `tda18271c2dd_attach'
(.init.text+0x3c98): undefined reference to `modsign_certificate_list_end'
(.init.text+0x3c9c): undefined reference to `modsign_certificate_list_end'
(.init.text+0x3ca4): undefined reference to `modsign_certificate_list'
(.init.text+0x3ca8): undefined reference to `modsign_certificate_list'
/bin/bash: lz4c: command not found

[warnings]
Warning(fs/dcache.c:893): No description found for parameter 'nid'
Warning(fs/dcache.c:893): Excess function parameter 'nodes_to_walk' description in 'prune_dcache_sb'
warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY) selects PROC_PAGE_MONITOR which has unmet direct dependencies (PROC_FS && MMU)
warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY) selects PROC_PAGE_MONITOR which has unmet direct dependencies (PROC_FS && MMU)
warning: (HWPOISON_INJECT && MEM_SOFT_DIRTY) selects PROC_PAGE_MONITOR which has unmet direct dependencies (PROC_FS && MMU)

[coccinelle]
lib/crc-t10dif.c:42:1-3: WARNING: PTR_RET can be used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

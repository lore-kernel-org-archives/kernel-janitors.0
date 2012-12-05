From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 05 Dec 2012 18:48:40 +0000
Subject: build regressions 2012-12-05
Message-Id: <50bf9708.CaCVBKl9iAj+td2Z%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/core/hub.c:4708:35: error: 'struct usb_device' has no member named 'children'
fs/ext4/dir.o:dir.c:(.text+0x25c): first defined here
file.c:(.text+0x894): multiple definition of `ext4_find_inline_entry'
net/ipv6/addrconf.c:503:11: error: 'struct ipv6_devconf' has no member named 'mc_forwarding'
fs/nfs/callback_proc.c:579:8: error: 'struct nfs4_slot_table' has no member named 'target_max_slots'
ialloc.c:(.text+0x9a0): multiple definition of `ext4_xattr_ibody_get'
fs/ext4/file.o:file.c:(.text+0x1af0): first defined here

[warnings]
fs/ext4/xattr.h:423: warning: 'ext4_convert_inline_data' defined but not used
WARNING: drivers/net/ethernet/broadcom/tg3.o(.text+0x1fe93): Section mismatch in reference from the function tg3_test_dma() to the variable .devinit.rodata:tg3_dma_wait_state_chipsets
fs/nfsd/nfssvc.c:306:2: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat]
WARNING: drivers/net/ethernet/broadcom/tg3.o(.text+0x16006): Section mismatch in reference from the function tg3_get_invariants() to the variable .devinit.rodata:tg3_write_reorder_chipsets
WARNING: drivers/net/ethernet/broadcom/tg3.o(.text+0x231db): Section mismatch in reference from the function tg3_init_one() to the variable .devinit.rodata:tg3_dma_wait_state_chipsets
WARNING: drivers/net/ethernet/dlink/sundance.o(.text+0x2e87): Section mismatch in reference from the function sundance_probe1() to the variable .devinit.rodata:sundance_pci_tbl
WARNING: drivers/net/ethernet/dec/tulip/tulip.o(.text+0x6f9b): Section mismatch in reference from the function tulip_init_one() to the variable .devinit.rodata:early_486_chipsets

[sparse]
drivers/net/ethernet/broadcom/tg3.c:5670:55: sparse: constant 0x7fffffffffffffff is so big it is long long
drivers/usb/core/hub.c:4708:63: sparse: no member 'children' in struct usb_device

[smatch]
net/mac80211/wpa.c:172 ieee80211_rx_h_michael_mic_verify() warn: variable dereferenced before check 'rx->key' (see line 164)
fs/buffer.c:2938 guard_bh_eod() warn: bitwise AND condition is false here

[coccinelle]
fs/nfsd/nfs4state.c:872:56-66: ERROR: function nfsd4_fc_set_highest_slotid_locked called on line 2097 inside lock on line 2075 but uses GFP_KERNEL
security/integrity/ima/ima_main.c:209:34-39: ERROR: iint is NULL but dereferenced.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

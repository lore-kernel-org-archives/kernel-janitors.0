From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 28 Jul 2012 10:24:43 +0000
Subject: [vhost:vhost-net-next 61/99] drivers/net/can/janz-ican3.c:964:7: warning: unused variable 'ret'
Message-Id: <20120728102443.GB10759@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ira,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost-net-next
head:   163049aefdc04323a2d17ec9f2862027b43b0502
commit: 83702f69272e4591a91a27eb58eade1bcd361dae [61/99] can: janz-ican3: fix support for CAN_RAW_RECV_OWN_MSGS

All error/warnings:

drivers/net/can/janz-ican3.c: In function 'ican3_handle_cevtind':
drivers/net/can/janz-ican3.c:964:7: warning: unused variable 'ret' [-Wunused-variable]

vim +964 drivers/net/can/janz-ican3.c
   961		 * skb allocation when it will just be freed immediately.
   962		 */
   963		if (isrc = CEVTIND_BEI) {
 > 964			int ret;
   965			dev_dbg(mod->dev, "bus error interrupt\n");
   966	
   967			/* TX error */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

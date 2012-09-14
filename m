From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 02:20:24 +0000
Subject: [nfc:nfc-next 19/20] net/nfc/hci/llc_shdlc.c:830:28: sparse: non-ANSI function declaration of functi
Message-Id: <20120914022024.GA10467@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Eric,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/nfc-3.0.git nfc-next
head:   73fecc5ce0bba7aa0cc8719529964b55e00c00bc
commit: f36d3d026c8c53522e4875ce74054c9b9f87b99b [19/20] NFC: Add an shdlc llc module to llc core

All sparse warnings:

+ net/nfc/hci/llc_shdlc.c:830:28: sparse: non-ANSI function declaration of function 'nfc_llc_shdlc_register'

vim +830 net/nfc/hci/llc_shdlc.c
   820	
   821	static struct nfc_llc_ops llc_shdlc_ops = {
   822		.init = llc_shdlc_init,
   823		.deinit = llc_shdlc_deinit,
   824		.start = llc_shdlc_start,
   825		.stop = llc_shdlc_stop,
   826		.rcv_from_drv = llc_shdlc_rcv_from_drv,
   827		.xmit_from_hci = llc_shdlc_xmit_from_hci,
   828	};
   829	
 > 830	int nfc_llc_shdlc_register()
   831	{
   832		return nfc_llc_register(LLC_SHDLC_NAME, &llc_shdlc_ops);
   833	}
   834	EXPORT_SYMBOL(nfc_llc_shdlc_register);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

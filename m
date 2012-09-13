From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Sep 2012 23:49:02 +0000
Subject: ehci-dbg.c:656 fill_periodic_buffer() warn: variable dereferenced before check 'p.qh' (see line 599)
Message-Id: <20120913234902.GB6340@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Richard,

FYI, there are new smatch warnings show up in

commit 3807e26d69b9ad3864fe03224ebebc9610d5802e
Author:     Alek Du <alek.du@intel.com>
AuthorDate: Tue Jul 14 07:23:29 2009 +0800

drivers/usb/chipidea/../host/ehci-dbg.c:656 fill_periodic_buffer() warn: variable dereferenced before check 'p.qh' (see line 599)

vim +656 drivers/usb/chipidea/../host/ehci-dbg.c
   596 
   597                         switch (hc32_to_cpu(ehci, tag)) {
   598                         case Q_TYPE_QH:
   599                                 hw = p.qh->hw;
...
 > 656					if (p.qh) {
   657						tag = Q_NEXT_TYPE(ehci, hw->hw_next);
   658						p = p.qh->qh_next;
   659					}
   660					break;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

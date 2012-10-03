From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 01:12:32 +0000
Subject: [wireless-next:for-davem 13/261] drivers/net/ethernet/broadcom/tg3.c:7783:40: sparse: Using plain in
Message-Id: <20121003011232.GA8750@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Michael,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git for-davem
head:   e4d680c706284ca0413a84bd2a28fda76b360904
commit: 49a359e31762f798f3abef00c7d6b807a644eadf [13/261] tg3: Introduce separate functions to allocate/free RX/TX rings.

  drivers/net/ethernet/broadcom/tg3.c:787:5: sparse: symbol 'tg3_ape_scratchpad_read' was not declared. Should it be static?
+ drivers/net/ethernet/broadcom/tg3.c:7783:40: sparse: Using plain integer as NULL pointer
  drivers/net/ethernet/broadcom/tg3.c:10209:38: sparse: bad constant expression

vim +7783 drivers/net/ethernet/broadcom/tg3.c

49a359e3 drivers/net/ethernet/broadcom/tg3.c (Michael Chan   2012-09-28  7782) 		if (tg3_flag(tp, ENABLE_RSS)) {
49a359e3 drivers/net/ethernet/broadcom/tg3.c (Michael Chan   2012-09-28 @7783) 			u16 *prodptr = 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

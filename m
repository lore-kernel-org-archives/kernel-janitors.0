From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 05:50:30 +0000
Subject: [wireless-next:for-davem 115/299] drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:419 t4_memory_rw() warn
Message-Id: <20120929055030.GB24004@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vipul Pandya <vipul@chelsio.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Jay Hernandez <jay@chelsio.com>

Hi Vipul,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git for-davem
head:   c487606f835a93a725bac1aefd536be98f22474d
commit: 5afc8b84eb7b29e4646d6e8ca7e6d7196031d6f7 [115/299] cxgb4: Add functions to read memory via PCIE memory window

+ drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:419 t4_memory_rw() warn: 'data' puts 2048 bytes on stack
  drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:499 get_vpd_params() warn: 'vpd' puts 512 bytes on stack
  drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:518 get_vpd_params() info: why not propagate 'i' from pci_vpd_find_tag() instead of -22?

vim +419 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c

5afc8b84 (Vipul Pandya 2012-09-26  408) 	/*
5afc8b84 (Vipul Pandya 2012-09-26  409) 	 * The underlaying EDC/MC read routines read MEMWIN0_APERTURE bytes
5afc8b84 (Vipul Pandya 2012-09-26  410) 	 * at a time so we need to round down the start and round up the end.
5afc8b84 (Vipul Pandya 2012-09-26  411) 	 * We'll start copying out of the first line at (addr - start) a word
5afc8b84 (Vipul Pandya 2012-09-26  412) 	 * at a time.
5afc8b84 (Vipul Pandya 2012-09-26  413) 	 */
5afc8b84 (Vipul Pandya 2012-09-26  414) 	start = addr & ~(MEMWIN0_APERTURE-1);
5afc8b84 (Vipul Pandya 2012-09-26  415) 	end = (addr + len + MEMWIN0_APERTURE-1) & ~(MEMWIN0_APERTURE-1);
5afc8b84 (Vipul Pandya 2012-09-26  416) 	offset = (addr - start)/sizeof(__be32);
5afc8b84 (Vipul Pandya 2012-09-26  417) 
5afc8b84 (Vipul Pandya 2012-09-26  418) 	for (pos = start; pos < end; pos += MEMWIN0_APERTURE, offset = 0) {
5afc8b84 (Vipul Pandya 2012-09-26 @419) 		__be32 data[MEMWIN0_APERTURE/sizeof(__be32)];
5afc8b84 (Vipul Pandya 2012-09-26  420) 
5afc8b84 (Vipul Pandya 2012-09-26  421) 		/*
5afc8b84 (Vipul Pandya 2012-09-26  422) 		 * If we're writing, copy the data from the caller's memory
5afc8b84 (Vipul Pandya 2012-09-26  423) 		 * buffer
5afc8b84 (Vipul Pandya 2012-09-26  424) 		 */
5afc8b84 (Vipul Pandya 2012-09-26  425) 		if (!dir) {
5afc8b84 (Vipul Pandya 2012-09-26  426) 			/*
5afc8b84 (Vipul Pandya 2012-09-26  427) 			 * If we're doing a partial write, then we need to do

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 09:58:50 +0000
Subject: drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
Message-Id: <20121002095850.GA29935@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Josh,

FYI, kernel build failed on

commit: 1c7b874d33b463f7150b1ab4617f000af9b327fd  mtd: at91: atmel_nand: add Programmable Multibit ECC controller support
config: avr32-atstk1006_defconfig

All error/warnings:

drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'

vim +639 drivers/mtd/nand/atmel_nand.c

1c7b874d (Josh Wu 2012-06-29  633) 	uint32_t val;
1c7b874d (Josh Wu 2012-06-29  634) 	int16_t *smu = host->pmecc_smu;
1c7b874d (Josh Wu 2012-06-29  635) 
1c7b874d (Josh Wu 2012-06-29  636) 	pmerrloc_writel(host->pmerrloc_base, ELDIS, PMERRLOC_DISABLE);
1c7b874d (Josh Wu 2012-06-29  637) 
1c7b874d (Josh Wu 2012-06-29  638) 	for (i = 0; i <= host->pmecc_lmu[cap + 1] >> 1; i++) {
1c7b874d (Josh Wu 2012-06-29 @639) 		pmerrloc_writel_sigma_relaxed(host->pmerrloc_base, i,
1c7b874d (Josh Wu 2012-06-29  640) 				      smu[(cap + 1) * num + i]);
1c7b874d (Josh Wu 2012-06-29  641) 		err_nbr++;
1c7b874d (Josh Wu 2012-06-29  642) 	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

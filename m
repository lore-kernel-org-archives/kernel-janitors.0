From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 00:20:39 +0000
Subject: arch/powerpc/mm/hugetlbpage.c:317:4: error: passing argument 7 of 'parse_args' from incompatible poi
Message-Id: <20120929002039.GA6508@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andy,

FYI, kernel build failed on

commit: 84925a91b2fb2b0ee48736fac94e08ece70f4169  UBUNTU: SAUCE: add option to hand off all kernel parameters to init
config: powerpc-corenet64_smp_defconfig

All error/warnings:

arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
arch/powerpc/mm/hugetlbpage.c:317:4: error: passing argument 7 of 'parse_args' from incompatible pointer type [-Werror]
include/linux/moduleparam.h:317:12: note: expected 'int (*)(char *, char *, const char *, int)' but argument is of type 'int (*)(char *, char *, const char *)'
cc1: all warnings being treated as errors

vim +317 arch/powerpc/mm/hugetlbpage.c

41151e77 (Becky Bruce 2011-06-28  311) 	static __initdata char cmdline[COMMAND_LINE_SIZE];
41151e77 (Becky Bruce 2011-06-28  312) 	phys_addr_t size, base;
41151e77 (Becky Bruce 2011-06-28  313) 	int i;
41151e77 (Becky Bruce 2011-06-28  314) 
41151e77 (Becky Bruce 2011-06-28  315) 	strlcpy(cmdline, boot_command_line, COMMAND_LINE_SIZE);
026cee00 (Pawel Moll  2012-03-26  316) 	parse_args("hugetlb gpages", cmdline, NULL, 0, 0, 0,
026cee00 (Pawel Moll  2012-03-26 @317) 			&do_gpage_early_setup);
41151e77 (Becky Bruce 2011-06-28  318) 
41151e77 (Becky Bruce 2011-06-28  319) 	/*
41151e77 (Becky Bruce 2011-06-28  320) 	 * Walk gpage list in reverse, allocating larger page sizes first.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 04:15:59 +0000
Subject: [ubi:linux-next 34/34] drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
Message-Id: <20121009041559.GA14884@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Richard,

FYI, there are new sparse warnings show up in

tree:   git://git.infradead.org/linux-ubi.git linux-next
head:   76ac66e469f084d41742ba08923de76fbdc7dce3
commit: 76ac66e469f084d41742ba08923de76fbdc7dce3 [34/34] UBI: Wire-up fastmap

+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:411:24: sparse: cast to restricted __be32
+ drivers/mtd/ubi/fastmap.c:571:23: sparse: incorrect type in assignment (different base types)
  drivers/mtd/ubi/fastmap.c:571:23:    expected unsigned long long [unsigned] max_sqnum
  drivers/mtd/ubi/fastmap.c:571:23:    got restricted __be64 [usertype] sqnum
+ drivers/mtd/ubi/fastmap.c:804:34: sparse: incorrect type in argument 3 (different base types)
  drivers/mtd/ubi/fastmap.c:804:34:    expected int *pebs
  drivers/mtd/ubi/fastmap.c:804:34:    got restricted __be32 *<noident>
  drivers/mtd/ubi/fastmap.c:809:34: sparse: incorrect type in argument 3 (different base types)
  drivers/mtd/ubi/fastmap.c:809:34:    expected int *pebs
  drivers/mtd/ubi/fastmap.c:809:34:    got restricted __be32 *<noident>
  drivers/mtd/ubi/fastmap.c:994:17: sparse: incorrect type in assignment (different base types)
  drivers/mtd/ubi/fastmap.c:994:17:    expected restricted __be32 [usertype] tmp_crc
  drivers/mtd/ubi/fastmap.c:994:17:    got unsigned int
  drivers/mtd/ubi/fastmap.c:996:13: sparse: incorrect type in assignment (different base types)
  drivers/mtd/ubi/fastmap.c:996:13:    expected restricted __be32 [usertype] crc
  drivers/mtd/ubi/fastmap.c:996:13:    got unsigned int
  drivers/mtd/ubi/fastmap.c:1004:22: sparse: incorrect type in assignment (different base types)
  drivers/mtd/ubi/fastmap.c:1004:22:    expected restricted __be64 [usertype] sqnum
  drivers/mtd/ubi/fastmap.c:1004:22:    got unsigned long long [unsigned] [assigned] sqnum

vim +411 drivers/mtd/ubi/fastmap.c

dbb7d2a8 Richard Weinberger 2012-09-26  395  
dbb7d2a8 Richard Weinberger 2012-09-26  396  	vh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
dbb7d2a8 Richard Weinberger 2012-09-26  397  	if (!vh) {
dbb7d2a8 Richard Weinberger 2012-09-26  398  		kfree(ech);
dbb7d2a8 Richard Weinberger 2012-09-26  399  		return -ENOMEM;
dbb7d2a8 Richard Weinberger 2012-09-26  400  	}
dbb7d2a8 Richard Weinberger 2012-09-26  401  
dbb7d2a8 Richard Weinberger 2012-09-26  402  	dbg_bld("scanning fastmap pool: size = %i", pool_size);
dbb7d2a8 Richard Weinberger 2012-09-26  403  
dbb7d2a8 Richard Weinberger 2012-09-26  404  	/*
dbb7d2a8 Richard Weinberger 2012-09-26  405  	 * Now scan all PEBs in the pool to find changes which have been made
dbb7d2a8 Richard Weinberger 2012-09-26  406  	 * after the creation of the fastmap
dbb7d2a8 Richard Weinberger 2012-09-26  407  	 */
dbb7d2a8 Richard Weinberger 2012-09-26  408  	for (i = 0; i < pool_size; i++) {
dbb7d2a8 Richard Weinberger 2012-09-26  409  		int scrub = 0;
dbb7d2a8 Richard Weinberger 2012-09-26  410  
dbb7d2a8 Richard Weinberger 2012-09-26 @411  		pnum = be32_to_cpu(pebs[i]);
dbb7d2a8 Richard Weinberger 2012-09-26  412  
dbb7d2a8 Richard Weinberger 2012-09-26  413  		if (ubi_io_is_bad(ubi, pnum)) {
dbb7d2a8 Richard Weinberger 2012-09-26  414  			ubi_err("bad PEB in fastmap pool!");
dbb7d2a8 Richard Weinberger 2012-09-26  415  			ret = UBI_BAD_FASTMAP;
dbb7d2a8 Richard Weinberger 2012-09-26  416  			goto out;
dbb7d2a8 Richard Weinberger 2012-09-26  417  		}
dbb7d2a8 Richard Weinberger 2012-09-26  418  
dbb7d2a8 Richard Weinberger 2012-09-26  419  		err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);

The code at line 411 was first introduced by commit:
dbb7d2a UBI: Add fastmap core


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 10:32:20 +0000
Subject: [net:master 6/6] drivers/net/ethernet/broadcom/tg3.c:11696:21: sparse: cast to restricted __le32
Message-Id: <20121003103220.GB10769@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Michael,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   864499449f256e32815575a9b860267ebefa6d70
commit: 864499449f256e32815575a9b860267ebefa6d70 [6/6] tg3: Fix sparse warnings.

It's interesting that the patch actually eliminated all known sparse
warnings on that file. Perhaps that enables sparse to progress more
so as to find more types of problems? :)

+ drivers/net/ethernet/broadcom/tg3.c:11696:21: sparse: cast to restricted __le32
+ drivers/net/ethernet/broadcom/tg3.c:11696:21: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/tg3.c:11701:21: sparse: cast to restricted __le32
  drivers/net/ethernet/broadcom/tg3.c:11701:21: sparse: cast from restricted __be32
+ drivers/net/ethernet/broadcom/tg3.c:15312:63: sparse: incorrect type in argument 3 (different base types)
  drivers/net/ethernet/broadcom/tg3.c:15312:63:    expected restricted __be32 [usertype] *val
  drivers/net/ethernet/broadcom/tg3.c:15312:63:    got unsigned int *<noident>
  drivers/net/ethernet/broadcom/tg3.c:15313:63: sparse: incorrect type in argument 3 (different base types)
  drivers/net/ethernet/broadcom/tg3.c:15313:63:    expected restricted __be32 [usertype] *val
  drivers/net/ethernet/broadcom/tg3.c:15313:63:    got unsigned int *<noident>

vim +11696 drivers/net/ethernet/broadcom/tg3.c

b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11680) 		for (i = 0; i < NVRAM_SELFBOOT_DATA_SIZE; i++) {
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11681) 			u8 hw8 = hweight8(data[i]);
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11682) 
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11683) 			if ((hw8 & 0x1) && parity[i])
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11684) 				goto out;
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11685) 			else if (!(hw8 & 0x1) && !parity[i])
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11686) 				goto out;
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11687) 		}
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11688) 		err = 0;
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11689) 		goto out;
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11690) 	}
b16250e3 drivers/net/tg3.c (Michael Chan 2006-09-27  11691) 
01c3a392 drivers/net/tg3.c (Matt Carlson 2011-03-09  11692) 	err = -EIO;
01c3a392 drivers/net/tg3.c (Matt Carlson 2011-03-09  11693) 
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11694) 	/* Bootstrap checksum at offset 0x10 */
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11695) 	csum = calc_crc((unsigned char *) buf, 0x10);
01c3a392 drivers/net/tg3.c (Matt Carlson 2011-03-09 @11696) 	if (csum != le32_to_cpu(buf[0x10/4]))
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11697) 		goto out;
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11698) 
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11699) 	/* Manufacturing block starts at offset 0x74, checksum at 0xfc */
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11700) 	csum = calc_crc((unsigned char *) &buf[0x74/4], 0x88);
01c3a392 drivers/net/tg3.c (Matt Carlson 2011-03-09  11701) 	if (csum != le32_to_cpu(buf[0xfc/4]))
a9dc529d drivers/net/tg3.c (Matt Carlson 2009-02-25  11702) 		goto out;
566f86ad drivers/net/tg3.c (Michael Chan 2005-05-29  11703) 
c3e94500 drivers/net/tg3.c (Matt Carlson 2011-04-13  11704) 	kfree(buf);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

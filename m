From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Oct 2012 00:54:10 +0000
Subject: [regmap:topic/range 8/8] drivers/base/regmap/regmap.c:866:4: warning: format '%d' expects argument o
Message-Id: <20121005005410.GA5964@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mark,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git topic/range
head:   123cd1b283e51c9d40d69e883ec495d7785df713
commit: 123cd1b283e51c9d40d69e883ec495d7785df713 [8/8] regmap: Split raw writes that cross window boundaries
config: x86_64-allyesconfig

All warnings:

drivers/base/regmap/regmap.c: In function '_regmap_raw_write':
drivers/base/regmap/regmap.c:866:4: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]

vim +866 drivers/base/regmap/regmap.c

41fa8b4c (Mark Brown      2012-10-04  858) 	range = _regmap_range_lookup(map, reg);
41fa8b4c (Mark Brown      2012-10-04  859) 	if (range) {
123cd1b2 (Mark Brown      2012-10-04  860) 		int val_num = val_len / map->format.val_bytes;
123cd1b2 (Mark Brown      2012-10-04  861) 		int win_offset = (reg - range->range_min) % range->window_len;
123cd1b2 (Mark Brown      2012-10-04  862) 		int win_residue = range->window_len - win_offset;
123cd1b2 (Mark Brown      2012-10-04  863) 
123cd1b2 (Mark Brown      2012-10-04  864) 		/* If the write goes beyond the end of the window split it */
123cd1b2 (Mark Brown      2012-10-04  865) 		while (val_num > win_residue) {
123cd1b2 (Mark Brown      2012-10-04 @866) 			dev_dbg(map->dev, "Writing window %d/%d\n",
123cd1b2 (Mark Brown      2012-10-04  867) 				win_residue, val_len);
123cd1b2 (Mark Brown      2012-10-04  868) 			ret = _regmap_raw_write(map, reg, val, win_residue);
123cd1b2 (Mark Brown      2012-10-04  869) 			if (ret != 0)
123cd1b2 (Mark Brown      2012-10-04  870) 				return ret;
123cd1b2 (Mark Brown      2012-10-04  871) 
123cd1b2 (Mark Brown      2012-10-04  872) 			val += win_residue;
123cd1b2 (Mark Brown      2012-10-04  873) 			val_len -= win_residue;
123cd1b2 (Mark Brown      2012-10-04  874) 			val_num = val_len / map->format.val_bytes;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

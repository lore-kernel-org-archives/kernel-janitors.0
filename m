From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 24 Nov 2012 22:36:42 +0000
Subject: build regressions 2012-11-24
Message-Id: <50b14bfa.unpWct9rpcdNfjVx%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
drivers/staging/slicoss/slicoss.c:3653:3: warning: array subscript is above array bounds [-Warray-bounds]

[sparse]
drivers/net/phy/micrel.c:133:5: sparse: symbol 'ksz8873mll_read_status' was not declared. Should it be static?

[smatch]
drivers/media/i2c/soc_camera/mt9v022.c:876 mt9v022_probe() warn: variable dereferenced before check 'icl' (see line 873)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 09 Dec 2012 19:50:35 +0000
Subject: build regressions 2012-12-09
Message-Id: <50c4eb8b.rZ5/bypUice4e3+L%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "arizona_out_vi_ramp" [sound/soc/codecs/snd-soc-wm5110.ko] undefined!
ERROR: "arizona_in_vi_ramp" [sound/soc/codecs/snd-soc-wm5110.ko] undefined!
ERROR: "arizona_out_vd_ramp" [sound/soc/codecs/snd-soc-wm5110.ko] undefined!
ERROR: "arizona_in_vd_ramp" [sound/soc/codecs/snd-soc-wm5110.ko] undefined!

[sparse]
net/bridge/br_mdb.c:79:35: sparse: incompatible types in comparison expression (different address spaces)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

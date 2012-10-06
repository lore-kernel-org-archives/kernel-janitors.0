From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 06 Oct 2012 16:54:30 +0000
Subject: [asoc:topic/cs4271 37/37] include/sound/cs4271.h:22:31: sparse: dubious one-bit signed bitfield
Message-Id: <20121006165430.GA19636@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Daniel,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git topic/cs4271
head:   d24f7344f8f3e6853d128d43b13424b6734d8211
commit: d24f7344f8f3e6853d128d43b13424b6734d8211 [37/37] ASoC: cs4271: add support for AMUTEB=BMUTEC feature

+ include/sound/cs4271.h:22:31: sparse: dubious one-bit signed bitfield

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation

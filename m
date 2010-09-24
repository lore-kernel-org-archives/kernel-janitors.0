From: matt mooney <mfm@muteddisk.com>
Date: Fri, 24 Sep 2010 19:17:27 +0000
Subject: [PATCH 17/24] power: change to new flag variable
Message-Id: <0472f95473283ce75285e458b22b86ff791d7a42.1285355033.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
 <9968d4260be8850200cc9c7dfe08addf611468b4.1285355033.git.mfm@muteddisk.com>
 <036514b5dd23c5af14303519d79d60d79adccbee.1285355033.git.mfm@muteddisk.com>
 <ffbd189ef2d414ea7c87ffe2b40fce87877dc014.1285355033.git.mfm@muteddisk.com>
 <b3e2061e1e6703f7b84c0484030e07de6000546a.1285355033.git.mfm@muteddisk.com>
 <70fe6b462b3ee22922698a12d62d650cf029033a.1285355033.git.mfm@muteddisk.com>
 <40a2d76d013ad025d08a411992af10f6bbef0a13.1285355033.git.mfm@muteddisk.com>
 <b484ccf548e1700e09ac7f731289503bf3e7b3bf.1285355033.git.mfm@muteddisk.com>
 <2c0fbcaafb18007c5c83823cb33e35120fe15091.1285355033.git.mfm@muteddisk.com>
 <ec9520aca140f253d8bad33cf35b8e668e7e9c9c.1285355033.git.mfm@muteddisk.com>
 <8cea68a58c5ddba79fc96e93fa0b23681e6a7ffe.1285355033.git.mfm@muteddisk.com>
 <e93a3f1af26d2b0fc798b4c15401b3422ae6e2bd.1285355033.git.mfm@muteddisk.com>
 <c2f1ef5590660ae574e9bdaf7136213741081404.1285355033.git.mfm@muteddisk.com>
 <efe88633e146de3e173afea14f777c41c37e5db2.1285355033.git.mfm@muteddisk.com>
 <facbf79cadc81f9043e89160b7b3b8a90926aba1.1285355033.git.mfm@muteddisk.com>
 <f8ffc630c8a56ebd5da0aa2227d63fecc21d4ee7.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <f8ffc630c8a56ebd5da0aa2227d63fecc21d4ee7.1285355033.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/power/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 10143aa..a0cffe0 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -8,9 +8,7 @@ ifeq ($(CONFIG_LEDS_TRIGGERS),y)
 power_supply-objs += power_supply_leds.o
 endif
 
-ifeq ($(CONFIG_POWER_SUPPLY_DEBUG),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+ccflags-$(CONFIG_POWER_SUPPLY_DEBUG) := -DDEBUG
 
 obj-$(CONFIG_POWER_SUPPLY)	+= power_supply.o
 
-- 
1.7.2.1


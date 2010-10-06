From: matt mooney <mfm@muteddisk.com>
Date: Wed, 06 Oct 2010 07:46:27 +0000
Subject: [PATCH] power: makefile cleanup
Message-Id: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y; remove if-statements and replace
with lists using the kbuild idiom.

None of the dependencies are modified.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/power/Makefile |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 10143aa..430243e 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -1,16 +1,8 @@
-power_supply-objs := power_supply_core.o
+ccflags-$(CONFIG_POWER_SUPPLY_DEBUG) := -DDEBUG
 
-ifeq ($(CONFIG_SYSFS),y)
-power_supply-objs += power_supply_sysfs.o
-endif
-
-ifeq ($(CONFIG_LEDS_TRIGGERS),y)
-power_supply-objs += power_supply_leds.o
-endif
-
-ifeq ($(CONFIG_POWER_SUPPLY_DEBUG),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+power_supply-y				:= power_supply_core.o
+power_supply-$(CONFIG_SYSFS)		+= power_supply_sysfs.o
+power_supply-$(CONFIG_LEDS_TRIGGERS)	+= power_supply_leds.o
 
 obj-$(CONFIG_POWER_SUPPLY)	+= power_supply.o
 
-- 
1.7.2.3


From: Julia Lawall <julia@diku.dk>
Date: Tue, 13 Nov 2007 21:32:10 +0000
Subject: [PATCH 1/4] drivers/i2c: Drop redundant includes of moduleparam.h
Message-Id: <Pine.LNX.4.64.0711132231080.18337@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: khali@linux-fr.org
Cc: i2c@lm-sensors.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Send to:
khali@linux-fr.org,
i2c@lm-sensors.org,
linux-kernel@vger.kernel.org,
kernel-janitors@vger.kernel.org

Subject: [PATCH 1/4] drivers/i2c: Drop redundant includes of moduleparam.h


------------------------------------------------------

From: Julia Lawall <julia@diku.dk>

Drop #include <linux/moduleparam.h> in files that also include #include
<linux/module.h>.  module.h includes moduleparam.h already.

The semantic patch implementing this change is as follows:

@ includesmodule @
@@

#include <linux/module.h>

@ depends on includesmodule @
@@

- #include <linux/moduleparam.h>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p -b -B a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
--- a/drivers/i2c/algos/i2c-algo-pca.c 2007-10-22 11:25:06.000000000 +0200
+++ b/drivers/i2c/algos/i2c-algo-pca.c 2007-11-13 17:49:31.000000000 +0100
@@ -19,7 +19,6 @@

  #include <linux/kernel.h>
  #include <linux/module.h>
-#include <linux/moduleparam.h>
  #include <linux/delay.h>
  #include <linux/slab.h>
  #include <linux/init.h>
diff -u -p -b -B a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
--- a/drivers/i2c/busses/i2c-piix4.c 2007-09-09 08:31:35.000000000 +0200
+++ b/drivers/i2c/busses/i2c-piix4.c 2007-11-13 17:49:33.000000000 +0100
@@ -30,7 +30,6 @@
  */

  #include <linux/module.h>
-#include <linux/moduleparam.h>
  #include <linux/pci.h>
  #include <linux/kernel.h>
  #include <linux/delay.h>
diff -u -p -b -B a/drivers/i2c/busses/i2c-pca-isa.c b/drivers/i2c/busses/i2c-pca-isa.c
--- a/drivers/i2c/busses/i2c-pca-isa.c 2007-06-02 22:32:11.000000000 +0200
+++ b/drivers/i2c/busses/i2c-pca-isa.c 2007-11-13 17:49:34.000000000 +0100
@@ -20,7 +20,6 @@
  #include <linux/kernel.h>
  #include <linux/ioport.h>
  #include <linux/module.h>
-#include <linux/moduleparam.h>
  #include <linux/delay.h>
  #include <linux/slab.h>
  #include <linux/init.h>

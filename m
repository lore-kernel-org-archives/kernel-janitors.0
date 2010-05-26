From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 10:46:39 +0000
Subject: [patch] hotplug/shpchp_hpc: add parenthesis in SLOT_REG_RSVDZ_MASK
Message-Id: <20100526104639.GA16631@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The SLOT_REG_RSVDZ_MASK macro is normally used like this:
	slot_reg &= ~SLOT_REG_RSVDZ_MASK;
The ~ operator has higher precedence than the | operator from inside the
macro, so it needs parenthesis.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hpc.c
index 5f5e8d2..d3985e7 100644
--- a/drivers/pci/hotplug/shpchp_hpc.c
+++ b/drivers/pci/hotplug/shpchp_hpc.c
@@ -113,7 +113,7 @@
 #define CON_PFAULT_INTR_MASK	(1 << 28)
 #define MRL_CHANGE_SERR_MASK	(1 << 29)
 #define CON_PFAULT_SERR_MASK	(1 << 30)
-#define SLOT_REG_RSVDZ_MASK	(1 << 15) | (7 << 21)
+#define SLOT_REG_RSVDZ_MASK	((1 << 15) | (7 << 21))
 
 /*
  * SHPC Command Code definitnions

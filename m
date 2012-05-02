From: Tomas Melin <tomas.melin@iki.fi>
Date: Wed, 02 May 2012 16:14:34 +0000
Subject: [PATCH 1/2] Staging: Comedi adv_pci1710 : Corrected over 80 column warnings
Message-Id: <1335975274-5933-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Various comments and code lines longer than 80 chars fixed in file adv_pci1710.c.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   27 ++++++++++++-------------
 1 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 8318c82..dd40fd3 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -982,14 +982,13 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(1, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
+		err);
 		return 1;
 	}
 
-	/* step 2: make sure trigger sources are unique and mutually compatible */
-
+	/* step 2: make sure trigger srcs are unique and mutually compatible */
 	if (cmd->start_src != TRIG_NOW && cmd->start_src != TRIG_EXT) {
 		cmd->start_src = TRIG_NOW;
 		err++;
@@ -1015,9 +1014,9 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(2, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
+		err);
 		return 2;
 	}
 
@@ -1065,9 +1064,9 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(3, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
+		err);
 		return 3;
 	}
 
@@ -1085,9 +1084,9 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 	}
 
 	if (err) {
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=4\n",
-		     err);
+		DPRINTK(
+		"adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=4\n",
+		err);
 		return 4;
 	}
 
-- 
1.7.5.4


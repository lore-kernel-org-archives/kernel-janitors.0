From: Tomas Melin <tomas.melin@iki.fi>
Date: Thu, 03 May 2012 15:27:36 +0000
Subject: [PATCH] Staging: Comedi adv_pci1710 : Corrected DPRINTK formatting
Message-Id: <1336058856-5203-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Corrected formatting for several DPRINT messages.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   20 ++++++++------------
 1 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 8318c82..1256321 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -982,9 +982,8 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(1, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
-		     err);
+		DPRINTK("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=1\n",
+			err);
 		return 1;
 	}
 
@@ -1015,9 +1014,8 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(2, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
-		     err);
+		DPRINTK("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=2\n",
+			err);
 		return 2;
 	}
 
@@ -1065,9 +1063,8 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 #ifdef PCI171X_EXTDEBUG
 		pci171x_cmdtest_out(3, cmd);
 #endif
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
-		     err);
+		DPRINTK("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=3\n",
+			err);
 		return 3;
 	}
 
@@ -1085,9 +1082,8 @@ static int pci171x_ai_cmdtest(struct comedi_device *dev,
 	}
 
 	if (err) {
-		DPRINTK
-		    ("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=4\n",
-		     err);
+		DPRINTK("adv_pci1710 EDBG: BGN: pci171x_ai_cmdtest(...) err=%d ret=4\n",
+			err);
 		return 4;
 	}
 
-- 
1.7.5.4


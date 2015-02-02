From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Feb 2015 18:25:48 +0000
Subject: [PATCH] EDAC: Deletion of unnecessary checks before the function call "pci_dev_put"
Message-Id: <54CFC12C.9010002@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Arvind R." <arvino55@gmail.com>, Borislav Petkov <bp@alien8.de>, Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Tim Small <tim@buttersideup.com>, linux-edac@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Feb 2015 18:26:34 +0100

The pci_dev_put() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/edac/i82443bxgx_edac.c | 4 +---
 drivers/edac/i82860_edac.c     | 9 ++-------
 drivers/edac/i82875p_edac.c    | 4 +---
 drivers/edac/i82975x_edac.c    | 4 +---
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/i82443bxgx_edac.c b/drivers/edac/i82443bxgx_edac.c
index b4705d9..38d6406 100644
--- a/drivers/edac/i82443bxgx_edac.c
+++ b/drivers/edac/i82443bxgx_edac.c
@@ -445,9 +445,7 @@ fail1:
 	pci_unregister_driver(&i82443bxgx_edacmc_driver);
 
 fail0:
-	if (mci_pdev != NULL)
-		pci_dev_put(mci_pdev);
-
+	pci_dev_put(mci_pdev);
 	return pci_rc;
 }
 
diff --git a/drivers/edac/i82860_edac.c b/drivers/edac/i82860_edac.c
index 4382343..ee1078c 100644
--- a/drivers/edac/i82860_edac.c
+++ b/drivers/edac/i82860_edac.c
@@ -343,20 +343,15 @@ fail1:
 	pci_unregister_driver(&i82860_driver);
 
 fail0:
-	if (mci_pdev != NULL)
-		pci_dev_put(mci_pdev);
-
+	pci_dev_put(mci_pdev);
 	return pci_rc;
 }
 
 static void __exit i82860_exit(void)
 {
 	edac_dbg(3, "\n");
-
 	pci_unregister_driver(&i82860_driver);
-
-	if (mci_pdev != NULL)
-		pci_dev_put(mci_pdev);
+	pci_dev_put(mci_pdev);
 }
 
 module_init(i82860_init);
diff --git a/drivers/edac/i82875p_edac.c b/drivers/edac/i82875p_edac.c
index 64b6832..c26a513 100644
--- a/drivers/edac/i82875p_edac.c
+++ b/drivers/edac/i82875p_edac.c
@@ -576,9 +576,7 @@ fail1:
 	pci_unregister_driver(&i82875p_driver);
 
 fail0:
-	if (mci_pdev != NULL)
-		pci_dev_put(mci_pdev);
-
+	pci_dev_put(mci_pdev);
 	return pci_rc;
 }
 
diff --git a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
index 10b1052..35ab66c 100644
--- a/drivers/edac/i82975x_edac.c
+++ b/drivers/edac/i82975x_edac.c
@@ -685,9 +685,7 @@ fail1:
 	pci_unregister_driver(&i82975x_driver);
 
 fail0:
-	if (mci_pdev != NULL)
-		pci_dev_put(mci_pdev);
-
+	pci_dev_put(mci_pdev);
 	return pci_rc;
 }
 
-- 
2.2.2


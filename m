From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Mon, 21 Dec 2009 04:38:26 +0000
Subject: drivers/edac/ move a kfree() to after last use
Message-Id: <1261370306.11354.52.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dougthompson@xmission.com, borislav.petkov@amd.com
Cc: bluesmoke-devel@lists.sourceforge.net


Move a kfree() below the last use of the memory

Coverity CID: 13142

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index df5b684..15b8b3c 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2925,10 +2925,10 @@ static void __devexit
amd64_remove_one_instance(struct pci_dev *pdev)
 
 	amd64_free_mc_sibling_devices(pvt);
 
-	kfree(pvt);
 	mci->pvt_info = NULL;
 
 	mci_lookup[pvt->mc_node_id] = NULL;
+	kfree(pvt);
 
 	/* unregister from EDAC MCE */
 	amd_report_gart_errors(false);



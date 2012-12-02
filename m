From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 02 Dec 2012 10:43:13 +0000
Subject: [patch] [media] mantis: cleanup NULL checking in mantis_ca_exit()
Message-Id: <20121202104313.GC16078@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complainst that the call to mantis_evmgr_exit() dereferences "ca"
but then we check it for NULL on the next line.  I've moved the NULL
check forward to avoid that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
There aren't any callers for this function.  It is commented out in
mantis_dvb_exit().

diff --git a/drivers/media/pci/mantis/mantis_ca.c b/drivers/media/pci/mantis/mantis_ca.c
index 3d70469..60c6c2f 100644
--- a/drivers/media/pci/mantis/mantis_ca.c
+++ b/drivers/media/pci/mantis/mantis_ca.c
@@ -198,11 +198,12 @@ void mantis_ca_exit(struct mantis_pci *mantis)
 	struct mantis_ca *ca = mantis->mantis_ca;
 
 	dprintk(MANTIS_DEBUG, 1, "Mantis CA exit");
+	if (!ca)
+		return;
 
 	mantis_evmgr_exit(ca);
 	dprintk(MANTIS_ERROR, 1, "Unregistering EN50221 device");
-	if (ca)
-		dvb_ca_en50221_release(&ca->en50221);
+	dvb_ca_en50221_release(&ca->en50221);
 
 	kfree(ca);
 }

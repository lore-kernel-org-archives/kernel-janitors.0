From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:58:56 +0000
Subject: [KJ] [Patch 3/5] BUG_ON() Conversion in
Message-Id: <1138730336.13327.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8441542916615381=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8441542916615381==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/s390/block/dasd_erp.c.orig	2006-01-31 16:26:50.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/s390/block/dasd_erp.c	2006-01-31 16:27:08.000000000 +0100
@@ -33,9 +33,8 @@ dasd_alloc_erp_request(char *magic, int 
 	int size;
 
 	/* Sanity checks */
-	if ( magic == NULL || datasize > PAGE_SIZE ||
-	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE)
-		BUG();
+	BUG_ON( magic == NULL || datasize > PAGE_SIZE ||
+	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE);
 
 	size = (sizeof(struct dasd_ccw_req) + 7L) & -8L;
 	if (cplength > 0)
@@ -126,8 +125,7 @@ dasd_default_erp_postaction(struct dasd_
 	struct dasd_device *device;
 	int success;
 
-	if (cqr->refers == NULL || cqr->function == NULL)
-		BUG();
+	BUG_ON(cqr->refers == NULL || cqr->function == NULL);
 
 	device = cqr->device;
 	success = cqr->status == DASD_CQR_DONE;



--===============8441542916615381==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8441542916615381==--

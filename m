From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:58:40 +0000
Subject: [KJ] [Patch 1/5] BUG_ON() Conversion in drivers/s390/block/dasd.c
Message-Id: <1138730321.13327.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18243288473057806=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18243288473057806==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/s390/block/dasd.c.orig	2006-01-31 16:24:53.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/s390/block/dasd.c	2006-01-31 16:25:36.000000000 +0100
@@ -517,9 +517,8 @@ dasd_kmalloc_request(char *magic, int cp
 	struct dasd_ccw_req *cqr;
 
 	/* Sanity checks */
-	if ( magic == NULL || datasize > PAGE_SIZE ||
-	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE)
-		BUG();
+	BUG_ON( magic == NULL || datasize > PAGE_SIZE ||
+	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE);
 
 	cqr = kmalloc(sizeof(struct dasd_ccw_req), GFP_ATOMIC);
 	if (cqr == NULL)
@@ -562,9 +561,8 @@ dasd_smalloc_request(char *magic, int cp
 	int size;
 
 	/* Sanity checks */
-	if ( magic == NULL || datasize > PAGE_SIZE ||
-	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE)
-		BUG();
+	BUG_ON( magic == NULL || datasize > PAGE_SIZE ||
+	     (cplength*sizeof(struct ccw1)) > PAGE_SIZE);
 
 	size = (sizeof(struct dasd_ccw_req) + 7L) & -8L;
 	if (cplength > 0)



--===============18243288473057806==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18243288473057806==--

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2012 06:55:25 +0000
Subject: [patch] Staging: vt6655-6: shift wrap in hostap_set_encryption()
Message-Id: <20121011065525.GB31607@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

abySeq is an unsigned char so shifting more than 31 bits will lead to a
shift wrapping bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  I don't have a way to test the
implications...  Sorry.

diff --git a/drivers/staging/vt6656/hostap.c b/drivers/staging/vt6656/hostap.c
index 0a73d40..26a7d0e 100644
--- a/drivers/staging/vt6656/hostap.c
+++ b/drivers/staging/vt6656/hostap.c
@@ -542,9 +542,9 @@ static int hostap_set_encryption(PSDevice pDevice,
 
 	if (param->u.crypt.seq) {
 	    memcpy(&abySeq, param->u.crypt.seq, 8);
-		for (ii = 0 ; ii < 8 ; ii++) {
-	         KeyRSC |= (abySeq[ii] << (ii * 8));
-		}
+		for (ii = 0 ; ii < 8 ; ii++)
+			KeyRSC |= (unsigned long)abySeq[ii] << (ii * 8);
+
 		dwKeyIndex |= 1 << 29;
 		pMgmt->sNodeDBTable[iNodeIndex].KeyRSC = KeyRSC;
 	}
diff --git a/drivers/staging/vt6655/hostap.c b/drivers/staging/vt6655/hostap.c
index 67b1b88..5f13890 100644
--- a/drivers/staging/vt6655/hostap.c
+++ b/drivers/staging/vt6655/hostap.c
@@ -596,9 +596,9 @@ static int hostap_set_encryption(PSDevice pDevice,
 
 	if (param->u.crypt.seq) {
 	    memcpy(&abySeq, param->u.crypt.seq, 8);
-		for (ii = 0 ; ii < 8 ; ii++) {
-	         KeyRSC |= (abySeq[ii] << (ii * 8));
-		}
+		for (ii = 0 ; ii < 8 ; ii++)
+			KeyRSC |= (unsigned long)abySeq[ii] << (ii * 8);
+
 		dwKeyIndex |= 1 << 29;
 		pMgmt->sNodeDBTable[iNodeIndex].KeyRSC = KeyRSC;
 	}

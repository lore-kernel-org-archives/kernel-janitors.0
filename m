From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2012 06:54:05 +0000
Subject: [patch] Staging: vt6655-6: shift wrap buf in s_vFillTxKey()
Message-Id: <20121011065405.GA31607@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

byKeyIndex is an unsigned char between 0 and 0xf.  If it is any value
higher than 1, then we will hit an integer wrap issue here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index 3390838..a54c0c1 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -355,7 +355,7 @@ s_vFillTxKey (
         }
         // Append IV after Mac Header
         *pdwIV &= WEP_IV_MASK;//00000000 11111111 11111111 11111111
-        *pdwIV |= (pDevice->byKeyIndex << 30);
+        *pdwIV |= (unsigned long)pDevice->byKeyIndex << 30;
         *pdwIV = cpu_to_le32(*pdwIV);
         pDevice->dwIVCounter++;
         if (pDevice->dwIVCounter > WEP_IV_MASK) {
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 4972e57..875ee44 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -242,7 +242,7 @@ s_vFillTxKey (
         }
         // Append IV after Mac Header
         *pdwIV &= WEP_IV_MASK;//00000000 11111111 11111111 11111111
-        *pdwIV |= (byKeyIndex << 30);
+        *pdwIV |= (unsigned long)byKeyIndex << 30;
         *pdwIV = cpu_to_le32(*pdwIV);
         pDevice->dwIVCounter++;
         if (pDevice->dwIVCounter > WEP_IV_MASK) {

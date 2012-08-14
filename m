From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 07:04:45 +0000
Subject: [patch] Staging: xgifb: fix bitwise vs logical bug
Message-Id: <20120814070445.GF4791@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a static checker fix and not something I can test.  The intent
of the code here is to set some bit flags.  For a logical OR the ">> 1"
shift wouldn't make a difference.  So it should be using a bitwise OR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/xgifb/vb_init.c b/drivers/staging/xgifb/vb_init.c
index 80dba6a..fdb7d1a 100644
--- a/drivers/staging/xgifb/vb_init.c
+++ b/drivers/staging/xgifb/vb_init.c
@@ -1269,7 +1269,7 @@ static unsigned char GetXG27FPBits(struct vb_device_info *pVBInfo)
 	if (temp <= 2)
 		temp &= 0x03;
 	else
-		temp = ((temp & 0x04) >> 1) || ((~temp) & 0x01);
+		temp = ((temp & 0x04) >> 1) | ((~temp) & 0x01);
 
 	xgifb_reg_set(pVBInfo->P3d4, 0x4A, CR4A);
 

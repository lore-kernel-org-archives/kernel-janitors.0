From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 29 Jul 2010 15:55:38 +0000
Subject: [PATCH] char: ip2: check put_user() result
Message-Id: <1280418938-5833-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "Michael H. Warfield" <mhw@wittsend.com>, Greg Kroah-Hartman <gregkh@suse.de>, Rakib Mullick <rakib.mullick@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

put_user()/copy_to_user() may fail, if so return -EFAULT.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/ip2/ip2main.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 07f3ea3..3f70a05 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -2813,9 +2813,9 @@ DumpTraceBuffer ( char __user *pData, int count )
 		return -EIO;
 	}
 	rc = put_user(tracewrap, pIndex );
-	rc = put_user(TRACEMAX, ++pIndex );
-	rc = put_user(tracestrip, ++pIndex );
-	rc = put_user(tracestuff, ++pIndex );
+	rc |= put_user(TRACEMAX, ++pIndex);
+	rc |= put_user(tracestrip, ++pIndex);
+	rc |= put_user(tracestuff, ++pIndex);
 	pData += sizeof(int) * 6;
 	count -= sizeof(int) * 6;
 
@@ -2828,7 +2828,7 @@ DumpTraceBuffer ( char __user *pData, int count )
 	}
 	chunk = TRACEMAX - tracestrip;
 	if ( dumpcount > chunk ) {
-		rc = copy_to_user(pData, &tracebuf[tracestrip],
+		rc |= copy_to_user(pData, &tracebuf[tracestrip],
 			      chunk * sizeof(tracebuf[0]) );
 		pData += chunk * sizeof(tracebuf[0]);
 		tracestrip = 0;
@@ -2836,15 +2836,15 @@ DumpTraceBuffer ( char __user *pData, int count )
 	} else {
 		chunk = dumpcount;
 	}
-	rc = copy_to_user(pData, &tracebuf[tracestrip],
+	rc |= copy_to_user(pData, &tracebuf[tracestrip],
 		      chunk * sizeof(tracebuf[0]) );
 	tracestrip += chunk;
 	tracewrap = 0;
 
-	rc = put_user(tracestrip, ++pIndex );
-	rc = put_user(tracestuff, ++pIndex );
+	rc |= put_user(tracestrip, ++pIndex);
+	rc |= put_user(tracestuff, ++pIndex);
 
-	return dumpcount;
+	return rc ? -EFAULT : dumpcount;
 #else
 	return 0;
 #endif
-- 
1.7.0.4


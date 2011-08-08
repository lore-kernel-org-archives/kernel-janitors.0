From: Julia Lawall <julia@diku.dk>
Date: Mon, 08 Aug 2011 11:17:58 +0000
Subject: [PATCH 4/9] drivers/staging/bcm/nvm.c: add missing kfree
Message-Id: <1312802283-9107-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Buff is only used as a temporary buffer within the function, so it should
be freed before leaving the function in an error case.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@exists@
local idexpression x;
statement S,S1;
expression E;
identifier fl;
expression *ptr != NULL;
@@

x = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x = NULL
x->fl
...>
(
if (x = NULL) S1
|
if (...) { ... when != x
               when forall
(
 return \(0\|<+...x...+>\|ptr\);
|
* return ...;
)
}
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/bcm/nvm.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/bcm/nvm.c b/drivers/staging/bcm/nvm.c
index 4da5b7b..3de0daf 100644
--- a/drivers/staging/bcm/nvm.c
+++ b/drivers/staging/bcm/nvm.c
@@ -4013,7 +4013,8 @@ INT BcmCopyISO(PMINI_ADAPTER Adapter, FLASH2X_COPY_SECTION sCopySectStrut)
 		if(uiTotalDataToCopy < ISOLength)
 		{
 			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"error as Source ISO Section does not have valid signature");
-			return STATUS_FAILURE;
+			Status = STATUS_FAILURE;
+			goto out;
 		}
 
 		uiTotalDataToCopy =(Adapter->psFlash2xCSInfo->OffsetISOImage2Part1End) -
@@ -4026,7 +4027,8 @@ INT BcmCopyISO(PMINI_ADAPTER Adapter, FLASH2X_COPY_SECTION sCopySectStrut)
 		if(uiTotalDataToCopy < ISOLength)
 		{
 			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"error as Dest ISO Section does not have enough section size");
-			return STATUS_FAILURE;
+			Status = STATUS_FAILURE;
+			goto out;
 		}
 
 		uiTotalDataToCopy = ISOLength;
@@ -4143,7 +4145,8 @@ INT BcmCopyISO(PMINI_ADAPTER Adapter, FLASH2X_COPY_SECTION sCopySectStrut)
 		if(uiTotalDataToCopy < ISOLength)
 		{
 			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"error as Source ISO Section does not have valid signature");
-			return STATUS_FAILURE;
+			Status = STATUS_FAILURE;
+			goto out;
 		}
 
 		uiTotalDataToCopy =(Adapter->psFlash2xCSInfo->OffsetISOImage1Part1End) -
@@ -4156,7 +4159,8 @@ INT BcmCopyISO(PMINI_ADAPTER Adapter, FLASH2X_COPY_SECTION sCopySectStrut)
 		if(uiTotalDataToCopy < ISOLength)
 		{
 			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"error as Dest ISO Section does not have enough section size");
-			return STATUS_FAILURE;
+			Status = STATUS_FAILURE;
+			goto out;
 		}
 
 		uiTotalDataToCopy = ISOLength;
@@ -4257,6 +4261,7 @@ INT BcmCopyISO(PMINI_ADAPTER Adapter, FLASH2X_COPY_SECTION sCopySectStrut)
 
 	}
 
+out:
 	kfree(Buff);
 
 	return Status;


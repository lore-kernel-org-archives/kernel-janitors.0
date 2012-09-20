From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Sep 2012 08:43:54 +0000
Subject: [patch] Staging: ced1401: fix a couple off by one checks
Message-Id: <20120920084354.GA12551@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

nArea is used as an offset into the ->rTransDef[] array which has
MAX_TRANSAREAS elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ced1401/ced_ioc.c b/drivers/staging/ced1401/ced_ioc.c
index 693c454..c9492ed 100644
--- a/drivers/staging/ced1401/ced_ioc.c
+++ b/drivers/staging/ced1401/ced_ioc.c
@@ -837,7 +837,7 @@ int SetEvent(DEVICE_EXTENSION * pdx, TRANSFEREVENT __user * pTE)
 int WaitEvent(DEVICE_EXTENSION * pdx, int nArea, int msTimeOut)
 {
 	int iReturn;
-	if ((unsigned)nArea > MAX_TRANSAREAS)
+	if ((unsigned)nArea >= MAX_TRANSAREAS)
 		return U14ERR_BADAREA;
 	else {
 		int iWait;
@@ -884,7 +884,7 @@ int WaitEvent(DEVICE_EXTENSION * pdx, int nArea, int msTimeOut)
 int TestEvent(DEVICE_EXTENSION * pdx, int nArea)
 {
 	int iReturn;
-	if ((unsigned)nArea > MAX_TRANSAREAS)
+	if ((unsigned)nArea >= MAX_TRANSAREAS)
 		iReturn = U14ERR_BADAREA;
 	else {
 		TRANSAREA *pTA = &pdx->rTransDef[nArea];

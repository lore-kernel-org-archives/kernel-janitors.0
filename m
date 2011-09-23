From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:23:22 +0000
Subject: [patch] Staging: vt6655-6: potential info leak in private_ioctl()
Message-Id: <20110923062322.GH4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

In this path, the .uLinkRate member doesn't get initialized so I've
set it to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6655/ioctl.c b/drivers/staging/vt6655/ioctl.c
index 8cf88c3..43964a5 100644
--- a/drivers/staging/vt6655/ioctl.c
+++ b/drivers/staging/vt6655/ioctl.c
@@ -296,6 +296,7 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq) {
         }
         else {
             sLinkStatus.bLink = false;
+	    sLinkStatus.uLinkRate = 0;
         }
         if (copy_to_user(pReq->data, &sLinkStatus, sizeof(SCmdLinkStatus))) {
 			result = -EFAULT;
diff --git a/drivers/staging/vt6656/ioctl.c b/drivers/staging/vt6656/ioctl.c
index cfe9c95..1cb9a7d 100644
--- a/drivers/staging/vt6656/ioctl.c
+++ b/drivers/staging/vt6656/ioctl.c
@@ -291,6 +291,7 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq) {
         }
         else {
             sLinkStatus.bLink = FALSE;
+	    sLinkStatus.uLinkRate = 0;
         }
         if (copy_to_user(pReq->data, &sLinkStatus, sizeof(SCmdLinkStatus))) {
 			result = -EFAULT;

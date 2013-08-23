From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 08:40:59 +0000
Subject: [patch 2/2] watchdog: ts72xx_wdt: locking bug in ioctl
Message-Id: <20130823084059.GE31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

Calling the WDIOC_GETSTATUS & WDIOC_GETBOOTSTATUS and twice will cause a
interruptible deadlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
index 9125b0f..3ddd527 100644
--- a/drivers/watchdog/ts72xx_wdt.c
+++ b/drivers/watchdog/ts72xx_wdt.c
@@ -311,7 +311,8 @@ static long ts72xx_wdt_ioctl(struct file *file, unsigned int cmd,
 
 	case WDIOC_GETSTATUS:
 	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
+		error = put_user(0, p);
+		break;
 
 	case WDIOC_KEEPALIVE:
 		ts72xx_wdt_kick(wdt);

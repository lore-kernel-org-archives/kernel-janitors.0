From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Nov 2015 09:56:31 +0000
Subject: [patch] watchdog: w83977f_wdt: underflow in wdt_set_timeout()
Message-Id: <20151106095631.GA18557@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

"t" is controlled by the user.  If "t" is a very large integer then it
could lead to a negative "tmrval".  We cap the upper bound of "tmrval"
but, in the current code, we allow negatives.  This is a bug and it
causes a static checker warning.  Let's make "tmrval" unsigned to avoid
this problem.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
index 91bf55a..20e2bba 100644
--- a/drivers/watchdog/w83977f_wdt.c
+++ b/drivers/watchdog/w83977f_wdt.c
@@ -224,7 +224,7 @@ static int wdt_keepalive(void)
 
 static int wdt_set_timeout(int t)
 {
-	int tmrval;
+	unsigned int tmrval;
 
 	/*
 	 * Convert seconds to watchdog counter time units, rounding up.

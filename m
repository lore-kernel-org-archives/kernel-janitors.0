From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 08:03:08 +0000
Subject: [patch] isdn/hisax: hex vs decimal typo in prfeatureind()
Message-Id: <20140206080308.GB26661@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static checker fix, but judging from the context then I think
hexidecimal 0x80 is intended here instead of decimal 80.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/isdn/hisax/q931.c b/drivers/isdn/hisax/q931.c
index af1b020a81f1..b420f8bd862e 100644
--- a/drivers/isdn/hisax/q931.c
+++ b/drivers/isdn/hisax/q931.c
@@ -810,7 +810,7 @@ prfeatureind(char *dest, u_char *p)
 	dp += sprintf(dp, "    octet 3  ");
 	dp += prbits(dp, *p, 8, 8);
 	*dp++ = '\n';
-	if (!(*p++ & 80)) {
+	if (!(*p++ & 0x80)) {
 		dp += sprintf(dp, "    octet 4  ");
 		dp += prbits(dp, *p++, 8, 8);
 		*dp++ = '\n';

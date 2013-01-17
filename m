From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Jan 2013 07:44:05 +0000
Subject: [patch] isdn/gigaset: off by one check leading to oops
Message-Id: <20130117074405.GA26270@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hansjoerg Lipp <hjlipp@web.de>
Cc: Tilman Schmidt <tilman@imap.cc>, Karsten Keil <isdn@linux-pingi.de>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If l = 12 then later we subtract 12 leaving zero.  We do a zero size
allocation, so "dbgline" points to the ZERO_SIZE_PTR.  It leads to an
oops when we set the NUL terminator:
	dbgline[3 * l - 1] = '\0';

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.

diff --git a/drivers/isdn/gigaset/capi.c b/drivers/isdn/gigaset/capi.c
index 68452b7..0d34325 100644
--- a/drivers/isdn/gigaset/capi.c
+++ b/drivers/isdn/gigaset/capi.c
@@ -239,7 +239,7 @@ static inline void dump_rawmsg(enum debuglevel level, const char *tag,
 		return;
 
 	l = CAPIMSG_LEN(data);
-	if (l < 12) {
+	if (l <= 12) {
 		gig_dbg(level, "%s: ??? LEN=%04d", tag, l);
 		return;
 	}

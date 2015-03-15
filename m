From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 10:48:03 +0000
Subject: [patch] isdn: icn: use strlcpy() when parsing setup options
Message-Id: <20150315104803.GA20691@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If you pass an invalid string here then you probably deserve the memory
corruption, but it annoys static analysis tools so lets fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/icn/icn.c b/drivers/isdn/icn/icn.c
index 6a7447c..358a574 100644
--- a/drivers/isdn/icn/icn.c
+++ b/drivers/isdn/icn/icn.c
@@ -1609,7 +1609,7 @@ icn_setup(char *line)
 	if (ints[0] > 1)
 		membase = (unsigned long)ints[2];
 	if (str && *str) {
-		strcpy(sid, str);
+		strlcpy(sid, str, sizeof(sid));
 		icn_id = sid;
 		if ((p = strchr(sid, ','))) {
 			*p++ = 0;

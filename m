From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Dec 2013 13:56:23 +0000
Subject: [patch v2] isdn: use strlcpy() instead strcpy()
Message-Id: <20131216094626.GC13831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I don't think the in-kernel drivers ever hit this strcpy() so this
doesn't change how the code works.  But strlcpy() is safer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fix typo in changelog

diff --git a/drivers/isdn/sc/event.c b/drivers/isdn/sc/event.c
index 717003a3bdf4..833d96c2cf92 100644
--- a/drivers/isdn/sc/event.c
+++ b/drivers/isdn/sc/event.c
@@ -57,7 +57,7 @@ int indicate_status(int card, int event, ulong Channel, char *Data)
 			memcpy(&cmd.parm.setup, Data, sizeof(cmd.parm.setup));
 			break;
 		default:
-			strcpy(cmd.parm.num, Data);
+			strlcpy(cmd.parm.num, Data, sizeof(cmd.parm.num));
 		}
 	}
 
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:58:06 +0000
Subject: [patch] isdn: icn: NULL dereference printing error message
Message-Id: <20131107075806.GO21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, isdn4linux@listserv.isdn4linux.de, kernel-janitors@vger.kernel.org

"card2" is NULL here so I have changed it to use "id2" instead of
"card2->interface.id".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/icn/icn.c b/drivers/isdn/icn/icn.c
index e74df7c..53d487f 100644
--- a/drivers/isdn/icn/icn.c
+++ b/drivers/isdn/icn/icn.c
@@ -1580,8 +1580,7 @@ icn_addcard(int port, char *id1, char *id2)
 	}
 	if (!(card2 = icn_initcard(port, id2))) {
 		printk(KERN_INFO
-		       "icn: (%s) half ICN-4B, port 0x%x added\n",
-		       card2->interface.id, port);
+		       "icn: (%s) half ICN-4B, port 0x%x added\n", id2, port);
 		return 0;
 	}
 	card->doubleS0 = 1;

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 10:04:38 +0000
Subject: [patch] tokenring: remove unneeded NULL checks
Message-Id: <20100819100438.GC6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

"fw_entry" is always non-NULL at this point and anyway
release_firmware() handles NULL parameters.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/tokenring/tms380tr.c b/drivers/net/tokenring/tms380tr.c
index 435ef7d..08182fd 100644
--- a/drivers/net/tokenring/tms380tr.c
+++ b/drivers/net/tokenring/tms380tr.c
@@ -1321,14 +1321,12 @@ static int tms380tr_reset_adapter(struct net_device *dev)
 
 			/* Clear CPHALT and start BUD */
 			SIFWRITEW(c, SIFACL);
-			if (fw_entry)
-				release_firmware(fw_entry);
+			release_firmware(fw_entry);
 			return (1);
 		}
 	} while(count = 0);
 
-	if (fw_entry)
-		release_firmware(fw_entry);
+	release_firmware(fw_entry);
 	printk(KERN_INFO "%s: Adapter Download Failed\n", dev->name);
 	return (-1);
 }

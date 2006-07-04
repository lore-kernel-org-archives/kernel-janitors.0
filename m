From: Richard <h.vanberkum@chello.nl>
Date: Tue, 04 Jul 2006 11:24:02 +0000
Subject: [KJ] [PATCH 2] drivers/char/mxser.c: check return value of
Message-Id: <44AA6F95.1010300@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl>

--- janitor-2.6/drivers/char/mxser.c	2006-07-01 11:54:45.895077096 +0200
+++ mytree/drivers/char/mxser.c	2006-07-04 15:29:51.039526600 +0200
@@ -3127,8 +3139,17 @@ static int mxser_get_ISA_conf(int cap, s
 		hwconf->ports = 8;
 	else
 		hwconf->ports = 4;
-	request_region(hwconf->ioaddr[0], 8 * hwconf->ports, "mxser(IO)");
-	request_region(hwconf->vector, 1, "mxser(vector)");
+	if (!(request_region(hwconf->ioaddr[0], 8 * hwconf->ports, "mxser(IO)"))) {
+		printk(KERN_ERR "mxser: I/O ports already in use\n");
+		return -EIO;
+	}
+	
+	if (!(request_region(hwconf->vector, 1, "mxser(vector)"))) {
+		printk(KERN_ERR "mxser: I/O ports already in use\n");
+		release_region(hwconf->ioaddr[0], 8 * hwconf->ports);
+		return -EIO;
+	}
+				
 	return hwconf->ports;
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2015 12:46:29 +0000
Subject: [patch] staging: unisys: fix some debugfs output
Message-Id: <20150312124629.GA26397@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

When we removed the ERRDEV() macro we made a small mistake so now it
doesn't print the "Virtual PCI devices" section header.

Fixes: 0aca78449b58 ('staging: unisys: remove ERRDEV macros')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/unisys/virtpci/virtpci.c b/drivers/staging/unisys/virtpci/virtpci.c
index 43b5736..cfefdab 100644
--- a/drivers/staging/unisys/virtpci/virtpci.c
+++ b/drivers/staging/unisys/virtpci/virtpci.c
@@ -1289,8 +1289,8 @@ static ssize_t info_debugfs_read(struct file *file, char __user *buf,
 	printparam.str_pos = &str_pos;
 	printparam.buf = vbuf;
 	printparam.len = &len;
-	if (bus_for_each_dev(&virtpci_bus_type, NULL,
-			     (void *)&printparam, print_vbus))
+	bus_for_each_dev(&virtpci_bus_type, NULL, (void *)&printparam,
+			 print_vbus);
 
 	str_pos += scnprintf(vbuf + str_pos, len - str_pos,
 			"\n Virtual PCI devices\n");

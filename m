From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Dec 2010 12:40:09 +0000
Subject: [patch] isdn: return -EFAULT if copy_from_user() fails
Message-Id: <20101210124009.GC10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be returning -EFAULT here.

Mostly this patch is to silence a smatch warning.  The upper levels
of this driver turn all non-zero return values from isar_load_firmware()
into 1.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/hisax/isar.c b/drivers/isdn/hisax/isar.c
index 2e72227..9cd4829 100644
--- a/drivers/isdn/hisax/isar.c
+++ b/drivers/isdn/hisax/isar.c
@@ -212,9 +212,9 @@ isar_load_firmware(struct IsdnCardState *cs, u_char __user *buf)
 	cs->debug &= ~(L1_DEB_HSCX | L1_DEB_HSCX_FIFO);
 #endif
 	
-	if ((ret = copy_from_user(&size, p, sizeof(int)))) {
+	if (copy_from_user(&size, p, sizeof(int))) {
 		printk(KERN_ERR"isar_load_firmware copy_from_user ret %d\n", ret);
-		return ret;
+		return -EFAULT;
 	}
 	p += sizeof(int);
 	printk(KERN_DEBUG"isar_load_firmware size: %d\n", size);

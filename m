From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:47:39 +0000
Subject: [patch] batman: cleanup: change test for end of array
Message-Id: <20100328114738.GR5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code here is testing to see if "i" is passed the end of the array.
The original code works probably, but it's not the cleanest way.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/batman-adv/device.c b/drivers/staging/batman-adv/device.c
index e7f4421..d09e8cd 100644
--- a/drivers/staging/batman-adv/device.c
+++ b/drivers/staging/batman-adv/device.c
@@ -109,8 +109,8 @@ int bat_device_open(struct inode *inode, struct file *file)
 		}
 	}
 
-	if (device_client_hash[i] != device_client) {
-		printk(KERN_ERR "batman-adv:Error - can't add another packet client: maximum number of clients reached \n");
+	if (i = 256) {
+		printk(KERN_ERR "batman-adv:Error - can't add another packet client: maximum number of clients reached\n");
 		kfree(device_client);
 		return -EXFULL;
 	}

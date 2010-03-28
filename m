From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 13:13:35 +0000
Subject: [patch v2] batman: cleanup: change test for end of array
Message-Id: <20100328131335.GY5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code here is testing to see if "i" is passed the end of the array.
The original code works probably, but it's not the cleanest way.

Andrew Lunn suggested that I also remove all the hard coded references
to 256 so I have done that as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/batman-adv/device.c b/drivers/staging/batman-adv/device.c
index e7f4421..afcf7eb 100644
--- a/drivers/staging/batman-adv/device.c
+++ b/drivers/staging/batman-adv/device.c
@@ -43,10 +43,7 @@ static struct device_client *device_client_hash[256];
 
 void bat_device_init(void)
 {
-	int i;
-
-	for (i = 0; i < 256; i++)
-		device_client_hash[i] = NULL;
+	memset(&device_client_hash, 0, sizeof(device_client_hash));
 }
 
 int bat_device_setup(void)
@@ -102,15 +99,15 @@ int bat_device_open(struct inode *inode, struct file *file)
 	if (!device_client)
 		return -ENOMEM;
 
-	for (i = 0; i < 256; i++) {
+	for (i = 0; i < ARRAY_SIZE(device_client_hash); i++) {
 		if (!device_client_hash[i]) {
 			device_client_hash[i] = device_client;
 			break;
 		}
 	}
 
-	if (device_client_hash[i] != device_client) {
-		printk(KERN_ERR "batman-adv:Error - can't add another packet client: maximum number of clients reached \n");
+	if (i = ARRAY_SIZE(device_client_hash)) {
+		printk(KERN_ERR "batman-adv:Error - can't add another packet client: maximum number of clients reached\n");
 		kfree(device_client);
 		return -EXFULL;
 	}

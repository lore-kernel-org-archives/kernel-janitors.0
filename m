From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 22:10:42 +0000
Subject: [patch] hostap: fixup strlen() math
Message-Id: <20100710221042.GA14911@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jouni Malinen <j@w1.fi>
Cc: "John W. Linville" <linville@tuxdriver.com>, Martin Decky <martin@decky.cz>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In hostap_add_interface() we do:
	sprintf(dev->name, "%s%s", prefix, name);

dev->name has IFNAMSIZ (16) characters.
prefix is local->dev->name.
name is "wds%d"

strlen() returns the number of characters in the string not counting the
NULL so if we have a string with 11 characters we get "12345678901wds%d"
which is 16 characters and a NULL so we're past the end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/hostap/hostap_main.c b/drivers/net/wireless/hostap/hostap_main.c
index eb57d1e..f1bc258 100644
--- a/drivers/net/wireless/hostap/hostap_main.c
+++ b/drivers/net/wireless/hostap/hostap_main.c
@@ -186,7 +186,7 @@ int prism2_wds_add(local_info_t *local, u8 *remote_addr,
 		return -ENOBUFS;
 
 	/* verify that there is room for wds# postfix in the interface name */
-	if (strlen(local->dev->name) > IFNAMSIZ - 5) {
+	if (strlen(local->dev->name) >= IFNAMSIZ - 5) {
 		printk(KERN_DEBUG "'%s' too long base device name\n",
 		       local->dev->name);
 		return -EINVAL;

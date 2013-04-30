From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:57:05 +0000
Subject: [patch] atmel: printing bogus information
Message-Id: <20130430075704.GH7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kelley <simon@thekelleys.org.uk>, David Howells <dhowells@redhat.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There was an extra ';' character added to the end of the if statement
which means that it always prints that the /proc entry wasn't created
even though it was.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/atmel.c b/drivers/net/wireless/atmel.c
index 23a3498..2876b90 100644
--- a/drivers/net/wireless/atmel.c
+++ b/drivers/net/wireless/atmel.c
@@ -1624,7 +1624,7 @@ struct net_device *init_atmel_card(unsigned short irq, unsigned long port,
 
 	netif_carrier_off(dev);
 
-	if (!proc_create_data("driver/atmel", 0, NULL, &atmel_proc_fops, priv));
+	if (!proc_create_data("driver/atmel", 0, NULL, &atmel_proc_fops, priv))
 		printk(KERN_WARNING "atmel: unable to create /proc entry.\n");
 
 	printk(KERN_INFO "%s: Atmel at76c50x. Version %d.%d. MAC %pM\n",

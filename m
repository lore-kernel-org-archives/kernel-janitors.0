From: matt mooney <mfm@muteddisk.com>
Date: Fri, 06 May 2011 10:47:42 +0000
Subject: [PATCH 02/16] staging: usbip: stub_main.c: coding style cleanup
Message-Id: <a0714cc3fdbacd7b8234e92d81151c10d373ad56.1304676742.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1304676742.git.mfm@muteddisk.com>
In-Reply-To: <cover.1304676742.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix alignment for consistency and remove extraneous lines.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index 076a7e5..4ba00bb 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -34,7 +34,6 @@ struct kmem_cache *stub_priv_cache;
 
 /* Define sysfs entries for the usbip driver */
 
-
 /*
  * busid_tables defines matching busids that usbip can grab. A user can change
  * dynamically what device is locally used and what device is exported to a
@@ -44,7 +43,6 @@ struct kmem_cache *stub_priv_cache;
 static struct bus_id_priv busid_table[MAX_BUSID];
 static spinlock_t busid_table_lock;
 
-
 int match_busid(const char *busid)
 {
 	int i;
@@ -148,11 +146,11 @@ int del_match_busid(char *busid)
 
 	return -1;
 }
+
 static void init_busid_table(void)
 {
 	int i;
 
-
 	for (i = 0; i < MAX_BUSID; i++) {
 		memset(busid_table[i].name, 0, BUSID_SIZE);
 		busid_table[i].status = STUB_BUSID_OTHER;
@@ -160,11 +158,12 @@ static void init_busid_table(void)
 		busid_table[i].sdev = NULL;
 		busid_table[i].shutdown_busid = 0;
 	}
+
 	spin_lock_init(&busid_table_lock);
 }
 
 static ssize_t store_match_busid(struct device_driver *dev, const char *buf,
-		size_t count)
+				 size_t count)
 {
 	int len;
 	char busid[BUSID_SIZE];
@@ -181,7 +180,6 @@ static ssize_t store_match_busid(struct device_driver *dev, const char *buf,
 
 	strncpy(busid, buf + 4, BUSID_SIZE);
 
-
 	if (!strncmp(buf, "add ", 4)) {
 		if (add_match_busid(busid) < 0)
 			return -ENOMEM;
@@ -199,11 +197,8 @@ static ssize_t store_match_busid(struct device_driver *dev, const char *buf,
 	} else
 		return -EINVAL;
 }
-
 static DRIVER_ATTR(match_busid, S_IRUSR|S_IWUSR, show_match_busid,
-							store_match_busid);
-
-
+		   store_match_busid);
 
 /*-------------------------------------------------------------------------*/
 
@@ -265,14 +260,12 @@ void stub_device_cleanup_urbs(struct stub_device *sdev)
 		kmem_cache_free(stub_priv_cache, priv);
 
 		kfree(urb->transfer_buffer);
-
 		kfree(urb->setup_packet);
 
 		usb_free_urb(urb);
 	}
 }
 
-
 /*-------------------------------------------------------------------------*/
 
 static int __init usb_stub_init(void)
@@ -296,8 +289,8 @@ static int __init usb_stub_init(void)
 		goto error_usb_register;
 	}
 
-	printk(KERN_INFO KBUILD_MODNAME ":"
-	       DRIVER_DESC ":" DRIVER_VERSION "\n");
+	printk(KERN_INFO KBUILD_MODNAME ":" DRIVER_DESC ":" DRIVER_VERSION
+	       "\n");
 
 	init_busid_table();
 
-- 
1.7.5.1


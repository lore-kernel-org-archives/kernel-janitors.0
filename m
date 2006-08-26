From: ville palo <ville.palo@vi64pa.net>
Date: Sat, 26 Aug 2006 08:40:49 +0000
Subject: [KJ] [PATCH] Check setup_proc_entry function return values
Message-Id: <1156581649.3511.5.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Added return value checking for create_proc_entry functions.
This also prevents possible use of NULL pointers.

Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index a4dd139..e0ad98c 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -2909,7 +2909,9 @@ static struct net_device *_init_airo_car
 		for( i = 0; i < MAX_FIDS; i++ )
 			ai->fids[i] = transmit_allocate(ai,AIRO_DEF_MTU,i>=MAX_FIDS/2);
 
-	setup_proc_entry( dev, dev->priv ); /* XXX check for failure */
+	if (setup_proc_entry( dev, dev->priv ) != 0) /* XXX check for failure */
+		printk(KERN_ERR "Failed to create proc entries for airo\n");
+		 
 	netif_start_queue(dev);
 	SET_MODULE_OWNER(dev);
 	return dev;
@@ -4504,6 +4506,9 @@ static int setup_proc_entry( struct net_
 	apriv->proc_entry = create_proc_entry(apriv->proc_name,
 					      S_IFDIR|airo_perm,
 					      airo_entry);
+	if (apriv->proc_entry = NULL)
+		return -ENODEV;
+		
         apriv->proc_entry->uid = proc_uid;
         apriv->proc_entry->gid = proc_gid;
         apriv->proc_entry->owner = THIS_MODULE;
@@ -4512,6 +4517,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("StatsDelta",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
+	if (entry  = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4522,6 +4530,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("Stats",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4532,6 +4543,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("Status",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4542,6 +4556,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("Config",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4552,6 +4569,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("SSID",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4562,6 +4582,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("APList",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;
@@ -4572,6 +4595,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("BSSList",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
 	entry->uid = proc_uid;
 	entry->gid = proc_gid;
 	entry->data = dev;
@@ -4582,6 +4608,9 @@ static int setup_proc_entry( struct net_
 	entry = create_proc_entry("WepKey",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
+	if (entry = NULL)
+		return -ENODEV;
+				  
         entry->uid = proc_uid;
         entry->gid = proc_gid;
 	entry->data = dev;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

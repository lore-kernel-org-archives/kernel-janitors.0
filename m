From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:46:19 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114619.GI2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81801802830672266=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============81801802830672266==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/core/devices.c	Wed Jul 14 19:15:07 2004
+++ list_for_each/drivers/usb/core/devices.c	Wed Jul 28 18:49:26 2004
@@ -570,7 +570,6 @@
 
 static ssize_t usb_device_read(struct file *file, char __user *buf, size_t nbytes, loff_t *ppos)
 {
-	struct list_head *buslist;
 	struct usb_bus *bus;
 	ssize_t ret, total_written = 0;
 	loff_t skip_bytes = *ppos;
@@ -582,12 +581,9 @@
 	if (!access_ok(VERIFY_WRITE, buf, nbytes))
 		return -EFAULT;
 
-	/* enumerate busses */
 	down (&usb_bus_list_lock);
-	for (buslist = usb_bus_list.next; buslist != &usb_bus_list; buslist = buslist->next) {
-		/* print devices for this bus */
-		bus = list_entry(buslist, struct usb_bus, bus_list);
-
+	/* print devices for all busses */
+	list_for_each_entry(bus, &usb_bus_list, bus_list) {
 		/* recurse through all children of the root hub */
 		if (!bus->root_hub)
 			continue;

--===============81801802830672266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81801802830672266==--

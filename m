From: Tobias Klauser <tklauser@access.unizh.ch>
Date: Thu, 24 Mar 2005 14:24:22 +0000
Subject: [KJ] [PATCH] input/joydev: Remove custom msecs_to_jiffies() macro
Message-Id: <20050324142422.GA4421@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81500464149324836=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81500464149324836==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the MSECS() macro with the msecs_to_jiffies() function provided
in jiffies.h. The current macro is incorrect because HZ can have
different values on different architectures.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/input/joydev.c linux-2.6.11/drivers/input/joydev.c
--- linux-2.6.11.orig/drivers/input/joydev.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/input/joydev.c	2005-03-23 16:36:14.000000000 +0100
@@ -37,8 +37,6 @@ MODULE_LICENSE("GPL");
 #define JOYDEV_MINORS		16
 #define JOYDEV_BUFFER_SIZE	64
 
-#define MSECS(t)	(1000 * ((t) / HZ) + 1000 * ((t) % HZ) / HZ)
-
 struct joydev {
 	int exist;
 	int open;
@@ -117,7 +115,7 @@ static void joydev_event(struct input_ha
 			return;
 	}
 
-	event.time = MSECS(jiffies);
+	event.time = msecs_to_jiffies(jiffies);
 
 	list_for_each_entry(list, &joydev->list, node) {
 
@@ -245,7 +243,7 @@ static ssize_t joydev_read(struct file *
 
 		struct js_event event;
 
-		event.time = MSECS(jiffies);
+		event.time = msecs_to_jiffies(jiffies);
 
 		if (list->startup < joydev->nkey) {
 			event.type = JS_EVENT_BUTTON | JS_EVENT_INIT;

--===============81500464149324836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81500464149324836==--

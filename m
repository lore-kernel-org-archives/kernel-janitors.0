From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 24 Mar 2005 16:06:31 +0000
Subject: [KJ] [UPDATE PATCH] input/joydev: Remove custom jiffies_to_msecs()
Message-Id: <20050324160631.GE761@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72850066843652561=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72850066843652561==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, the previous patch was completely wrong. Thanks to Nishanth
Aravamudan for pointing this out!

Replace the MSECS() macro with the jiffies_to_msecs() function provided
in jiffies.h. The current macro is incorrect because HZ can have
different values on different architectures.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/input/joydev.c linux-2.6.11/drivers/input/joydev.c
--- linux-2.6.11.orig/drivers/input/joydev.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/input/joydev.c	2005-03-23 17:03:12.000000000 +0100
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
+	event.time = jiffies_to_msecs(jiffies);
 
 	list_for_each_entry(list, &joydev->list, node) {
 
@@ -245,7 +243,7 @@ static ssize_t joydev_read(struct file *
 
 		struct js_event event;
 
-		event.time = MSECS(jiffies);
+		event.time = jiffies_to_msecs(jiffies);
 
 		if (list->startup < joydev->nkey) {
 			event.type = JS_EVENT_BUTTON | JS_EVENT_INIT;

--===============72850066843652561==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72850066843652561==--

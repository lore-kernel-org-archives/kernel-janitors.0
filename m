From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:48:10 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114810.GM2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25065041188918658=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============25065041188918658==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use list_for_each_entry_safe to make code more readable.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/serial/ipaq.c	Fri Jul 23 16:00:26 2004
+++ list_for_each/drivers/usb/serial/ipaq.c	Wed Jul 28 20:02:38 2004
@@ -417,9 +417,8 @@
 	struct ipaq_private	*priv = usb_get_serial_port_data(port);
 	struct usb_serial	*serial = port->serial;
 	int			count, room;
-	struct ipaq_packet	*pkt;
+	struct ipaq_packet	*pkt, *tmp;
 	struct urb		*urb = port->write_urb;
-	struct list_head	*tmp;
 
 	if (urb->status == -EINPROGRESS) {
 		/* Should never happen */
@@ -427,9 +426,7 @@
 		return;
 	}
 	room = URBDATA_SIZE;
-	for (tmp = priv->queue.next; tmp != &priv->queue;) {
-		pkt = list_entry(tmp, struct ipaq_packet, list);
-		tmp = tmp->next;
+	list_for_each_entry_safe(pkt, tmp, &priv->queue, list) {
 		count = min(room, (int)(pkt->len - pkt->written));
 		memcpy(urb->transfer_buffer + (URBDATA_SIZE - room),
 		       pkt->data + pkt->written, count);
@@ -501,22 +498,16 @@
 static void ipaq_destroy_lists(struct usb_serial_port *port)
 {
 	struct ipaq_private	*priv = usb_get_serial_port_data(port);
-	struct list_head	*tmp;
-	struct ipaq_packet	*pkt;
+	struct ipaq_packet	*pkt, *tmp;
 
-	for (tmp = priv->queue.next; tmp != &priv->queue;) {
-		pkt = list_entry(tmp, struct ipaq_packet, list);
-		tmp = tmp->next;
+	list_for_each_entry_safe(pkt, tmp, &priv->queue, list) {
 		kfree(pkt->data);
 		kfree(pkt);
 	}
-	for (tmp = priv->freelist.next; tmp != &priv->freelist;) {
-		pkt = list_entry(tmp, struct ipaq_packet, list);
-		tmp = tmp->next;
+	list_for_each_entry_safe(pkt, tmp, &priv->freelist, list) {
 		kfree(pkt->data);
 		kfree(pkt);
 	}
-	return;
 }
 
 

--===============25065041188918658==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25065041188918658==--

From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:45:42 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114542.GH2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62791127778887645=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============62791127778887645==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/class/usb-midi.c	Fri Jul 23 16:00:24 2004
+++ list_for_each/drivers/usb/class/usb-midi.c	Wed Jul 28 18:47:02 2004
@@ -811,7 +811,6 @@
 {
 	int minor = iminor(inode);
 	DECLARE_WAITQUEUE(wait, current);
-	struct list_head      *devs, *mdevs;
 	struct usb_midi_state *s;
 	struct usb_mididev    *m;
 	unsigned long flags;
@@ -823,10 +822,8 @@
 
 	for(;;) {
 		down(&open_sem);
-		for (devs = mididevs.next; devs != &mididevs; devs = devs->next) {
-			s = list_entry(devs, struct usb_midi_state, mididev);
-			for (mdevs = s->midiDevList.next; mdevs != &s->midiDevList; mdevs = mdevs->next) {
-				m = list_entry(mdevs, struct usb_mididev, list);
+		list_for_each_entry(s, &mididevs, mididev) {
+			list_for_each_entry(m, &s->midiDevList, list) {
 				if ( !((m->dev_midi ^ minor) & ~0xf) )
 					goto device_found;
 			}
@@ -2000,7 +1997,6 @@
 static void usb_midi_disconnect(struct usb_interface *intf)
 {
 	struct usb_midi_state *s = usb_get_intfdata (intf);
-	struct list_head      *list;
 	struct usb_mididev    *m;
 
 	if ( !s )
@@ -2018,8 +2014,7 @@
 	s->usbdev = NULL;
 	usb_set_intfdata (intf, NULL);
 
-	for ( list = s->midiDevList.next; list != &s->midiDevList; list = list->next ) {
-		m = list_entry(list, struct usb_mididev, list);
+	list_for_each_entry(m, &s->midiDevList, list) {
 		wake_up(&(m->min.ep->wait));
 		wake_up(&(m->mout.ep->wait));
 		if ( m->dev_midi >= 0 ) {

--===============62791127778887645==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62791127778887645==--

From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:45:13 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114513.GG2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4166354464373534=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============4166354464373534==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/class/audio.c	Wed Jul 14 19:15:07 2004
+++ list_for_each/drivers/usb/class/audio.c	Wed Jul 28 18:41:07 2004
@@ -1949,15 +1949,12 @@
 static int usb_audio_open_mixdev(struct inode *inode, struct file *file)
 {
 	unsigned int minor = iminor(inode);
-	struct list_head *devs, *mdevs;
 	struct usb_mixerdev *ms;
 	struct usb_audio_state *s;
 
 	down(&open_sem);
-	for (devs = audiodevs.next; devs != &audiodevs; devs = devs->next) {
-		s = list_entry(devs, struct usb_audio_state, audiodev);
-		for (mdevs = s->mixerlist.next; mdevs != &s->mixerlist; mdevs = mdevs->next) {
-			ms = list_entry(mdevs, struct usb_mixerdev, list);
+	list_for_each_entry(s, &audiodevs, audiodev) {
+		list_for_each_entry(ms, &s->mixerlist, list) {
 			if (ms->dev_mixer == minor)
 				goto mixer_found;
 		}
@@ -2638,16 +2635,13 @@
 {
 	unsigned int minor = iminor(inode);
 	DECLARE_WAITQUEUE(wait, current);
-	struct list_head *devs, *adevs;
 	struct usb_audiodev *as;
 	struct usb_audio_state *s;
 
 	for (;;) {
 		down(&open_sem);
-		for (devs = audiodevs.next; devs != &audiodevs; devs = devs->next) {
-			s = list_entry(devs, struct usb_audio_state, audiodev);
-			for (adevs = s->audiolist.next; adevs != &s->audiolist; adevs = adevs->next) {
-				as = list_entry(adevs, struct usb_audiodev, list);
+		list_for_each_entry(s, &audiodevs, audiodev) {
+			list_for_each_entry(as, &s->audiolist, list) {
 				if (!((as->dev_audio ^ minor) & ~0xf))
 					goto device_found;
 			}
@@ -3813,7 +3807,6 @@
 static void usb_audio_disconnect(struct usb_interface *intf)
 {
 	struct usb_audio_state *s = usb_get_intfdata (intf);
-	struct list_head *list;
 	struct usb_audiodev *as;
 	struct usb_mixerdev *ms;
 
@@ -3835,8 +3828,7 @@
 	usb_set_intfdata (intf, NULL);
 
 	/* deregister all audio and mixer devices, so no new processes can open this device */
-	for(list = s->audiolist.next; list != &s->audiolist; list = list->next) {
-		as = list_entry(list, struct usb_audiodev, list);
+	list_for_each_entry(as, &s->audiolist, list) {
 		usbin_disc(as);
 		usbout_disc(as);
 		wake_up(&as->usbin.dma.wait);
@@ -3847,8 +3839,7 @@
 		}
 		as->dev_audio = -1;
 	}
-	for(list = s->mixerlist.next; list != &s->mixerlist; list = list->next) {
-		ms = list_entry(list, struct usb_mixerdev, list);
+	list_for_each_entry(ms, &s->mixerlist, list) {
 		if (ms->dev_mixer >= 0) {
 			unregister_sound_mixer(ms->dev_mixer);
 			printk(KERN_INFO "usbaudio: unregister mixer 14,%d\n", ms->dev_mixer);

--===============4166354464373534==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4166354464373534==--

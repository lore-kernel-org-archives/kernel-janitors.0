From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][17/26] drivers/usb/class/* - compile warning cleanup
Message-Id: <420BEF84.30631.5873DC@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65645653734191312=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65645653734191312==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: add MODULE definition compile fence so MODULE_DEVICE_TABLE 
vars not declared when compiled into the kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h
--- linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h	2005-02-03 03:56:10.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h	2005-02-07 21:19:25.000000000 +0200
@@ -139,6 +139,7 @@ static struct usb_midi_device usb_midi_d
 
 #define VENDOR_SPECIFIC_USB_MIDI_DEVICES (sizeof(usb_midi_devices)/sizeof(struct usb_midi_device))
 
+#ifdef MODULE
 /* for Hot-Plugging */
 
 static struct usb_device_id usb_midi_ids [] = {
@@ -157,6 +158,7 @@ static struct usb_device_id usb_midi_ids
 };
 
 MODULE_DEVICE_TABLE (usb, usb_midi_ids);
+#endif /* MODULE */
 
 /* ------------------------------------------------------------------------- */
 #endif /* _USB_MIDI_H_ */




--===============65645653734191312==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65645653734191312==--

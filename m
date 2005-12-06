From: walter harms <wharms@bfs.de>
Date: Tue, 06 Dec 2005 17:54:36 +0000
Subject: [KJ] drivers/usb/misc/sisusbvga/sisusb.c: fix warning: 'assignment
Message-Id: <4395D05C.5070106@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010200060607020806020603"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010200060607020806020603
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

fix a warning 'assignment discards qualifiers' . also a bit cleanup.

sign-off-by: walter <wharms@bfs.de>


--- linux-2.6.14/drivers/usb/misc/sisusbvga/sisusb.c.bak	2005-12-03 
21:23:38.000000000 +0100
+++ linux-2.6.14/drivers/usb/misc/sisusbvga/sisusb.c	2005-12-03 
21:50:02.000000000 +0100
@@ -2440,7 +2440,7 @@
  sisusb_reset_text_mode(struct sisusb_usb_data *sisusb, int init)
  {
  	int ret = 0, slot = sisusb->font_slot, i;
-	struct font_desc *myfont;
+	const struct font_desc *myfont;
  	u8 *tempbuf;
  	u16 *tempbufb;
  	size_t written;
@@ -2458,10 +2458,12 @@
  	/* Set mode 0x03 */
  	SiSUSBSetMode(sisusb->SiS_Pr, 0x03);

-	if (!(myfont = find_font("VGA8x16")))
+	myfont = find_font("VGA8x16");
+	if (!myfont)
  		return 1;

-	if (!(tempbuf = vmalloc(8192)))
+	tempbuf = vmalloc(8192);
+	if (!tempbuf)
  		return 1;

  	for (i = 0; i < 256; i++)

--------------010200060607020806020603
Content-Type: text/x-patch;
 name="sisusb.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sisusb.c.diff"

fix a warning 'assignment discards qualifiers' . also a bit cleanup.

sign-off: walter <wharms@bfs.de>


--- linux-2.6.14/drivers/usb/misc/sisusbvga/sisusb.c.bak	2005-12-03 21:23:38.000000000 +0100
+++ linux-2.6.14/drivers/usb/misc/sisusbvga/sisusb.c	2005-12-03 21:50:02.000000000 +0100
@@ -2440,7 +2440,7 @@
 sisusb_reset_text_mode(struct sisusb_usb_data *sisusb, int init)
 {
 	int ret = 0, slot = sisusb->font_slot, i;
-	struct font_desc *myfont;
+	const struct font_desc *myfont;
 	u8 *tempbuf;
 	u16 *tempbufb;
 	size_t written;
@@ -2458,10 +2458,12 @@
 	/* Set mode 0x03 */
 	SiSUSBSetMode(sisusb->SiS_Pr, 0x03);
 
-	if (!(myfont = find_font("VGA8x16")))
+	myfont = find_font("VGA8x16");
+	if (!myfont)
 		return 1;
 
-	if (!(tempbuf = vmalloc(8192)))
+	tempbuf = vmalloc(8192);
+	if (!tempbuf)
 		return 1;
 
 	for (i = 0; i < 256; i++)

--------------010200060607020806020603
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010200060607020806020603--

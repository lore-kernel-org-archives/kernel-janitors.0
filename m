From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 11 Dec 2005 15:20:08 +0000
Subject: [KJ] [PATCH] drivers/usb: Use ARRAY_SIZE macro
Message-Id: <20051211152007.GA1545@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41531077005013151=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41531077005013151==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove
duplicates of ARRAY_SIZE. Some trailing whitespaces are also removed.

Patch is compile-tested on i386.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/usb/class/usb-midi.h          |    2 +-
 drivers/usb/gadget/dummy_hcd.c        |    2 +-
 drivers/usb/input/aiptek.c            |    4 ++--
 drivers/usb/media/ibmcam.c            |    2 +-
 drivers/usb/media/sn9c102_core.c      |   23 ++++++++++-------------
 drivers/usb/media/w9968cf.c           |    2 +-
 drivers/usb/net/zd1201.c              |    8 ++++----
 drivers/usb/serial/io_edgeport.c      |    2 +-
 drivers/usb/serial/io_edgeport.h      |    3 ---
 drivers/usb/serial/safe_serial.c      |    2 +-
 drivers/usb/serial/ti_usb_3410_5052.c |    7 ++-----
 drivers/usb/storage/sddr09.c          |    4 +---
 12 files changed, 25 insertions(+), 36 deletions(-)

diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/class/usb-midi.h linux-2.6.15-rc5~array_size/drivers/usb/class/usb-midi.h
--- linux-2.6.15-rc5/drivers/usb/class/usb-midi.h	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc5~array_size/drivers/usb/class/usb-midi.h	2005-12-10 16:56:43.000000000 +0100
@@ -137,7 +137,7 @@ static struct usb_midi_device usb_midi_d
   }
 };
 
-#define VENDOR_SPECIFIC_USB_MIDI_DEVICES (sizeof(usb_midi_devices)/sizeof(struct usb_midi_device))
+#define VENDOR_SPECIFIC_USB_MIDI_DEVICES ARRAY_SIZE(usb_midi_devices)
 
 /* for Hot-Plugging */
 
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/gadget/dummy_hcd.c linux-2.6.15-rc5~array_size/drivers/usb/gadget/dummy_hcd.c
--- linux-2.6.15-rc5/drivers/usb/gadget/dummy_hcd.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/gadget/dummy_hcd.c	2005-12-07 21:26:59.000000000 +0100
@@ -138,7 +138,7 @@ static const char *const ep_name [] = {
 	/* or like sa1100: two fixed function endpoints */
 	"ep1out-bulk", "ep2in-bulk",
 };
-#define DUMMY_ENDPOINTS	(sizeof(ep_name)/sizeof(char *))
+#define DUMMY_ENDPOINTS	ARRAY_SIZE(ep_name)
 
 /*-------------------------------------------------------------------------*/
 
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/input/aiptek.c linux-2.6.15-rc5~array_size/drivers/usb/input/aiptek.c
--- linux-2.6.15-rc5/drivers/usb/input/aiptek.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/input/aiptek.c	2005-12-07 21:09:12.000000000 +0100
@@ -2093,7 +2093,7 @@ aiptek_probe(struct usb_interface *intf,
 	/* Programming the tablet macro keys needs to be done with a for loop
 	 * as the keycodes are discontiguous.
 	 */
-	for (i = 0; i < sizeof(macroKeyEvents) / sizeof(macroKeyEvents[0]); ++i)
+	for (i = 0; i < ARRAY_SIZE(macroKeyEvents); ++i)
 		set_bit(macroKeyEvents[i], inputdev->keybit);
 
 	/*
@@ -2135,7 +2135,7 @@ aiptek_probe(struct usb_interface *intf,
 	 * not an error :-)
 	 */
 
-	for (i = 0; i < sizeof(speeds) / sizeof(speeds[0]); ++i) {
+	for (i = 0; i < ARRAY_SIZE(speeds); ++i) {
 		aiptek->curSetting.programmableDelay = speeds[i];
 		(void)aiptek_program_tablet(aiptek);
 		if (aiptek->inputdev->absmax[ABS_X] > 0) {
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/media/ibmcam.c linux-2.6.15-rc5~array_size/drivers/usb/media/ibmcam.c
--- linux-2.6.15-rc5/drivers/usb/media/ibmcam.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc5~array_size/drivers/usb/media/ibmcam.c	2005-12-07 21:09:12.000000000 +0100
@@ -3457,7 +3457,7 @@ static void ibmcam_model3_setup_after_vi
 	if(init_model3_input) {
 		if (debug > 0)
 			info("Setting input to RCA.");
-		for (i=0; i < (sizeof(initData)/sizeof(initData[0])); i++) {
+		for (i=0; i < ARRAY_SIZE(initData); i++) {
 			ibmcam_veio(uvd, initData[i].req, initData[i].value, initData[i].index);
 		}
 	}
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/media/sn9c102_core.c linux-2.6.15-rc5~array_size/drivers/usb/media/sn9c102_core.c
--- linux-2.6.15-rc5/drivers/usb/media/sn9c102_core.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/media/sn9c102_core.c	2005-12-07 21:09:12.000000000 +0100
@@ -1316,7 +1316,7 @@ static int sn9c102_init(struct sn9c102_d
 	struct v4l2_control ctrl;
 	struct v4l2_queryctrl *qctrl;
 	struct v4l2_rect* rect;
-	u8 i = 0, n = 0;
+	u8 i = 0;
 	int err = 0;
 
 	if (!(cam->state & DEV_INITIALIZED)) {
@@ -1352,7 +1352,7 @@ static int sn9c102_init(struct sn9c102_d
 		return err;
 
 	if (s->pix_format.pixelformat == V4L2_PIX_FMT_SN9C10X)
-		DBG(3, "Compressed video format is active, quality %d", 
+		DBG(3, "Compressed video format is active, quality %d",
 		    cam->compression.quality)
 	else
 		DBG(3, "Uncompressed video format is active")
@@ -1364,9 +1364,8 @@ static int sn9c102_init(struct sn9c102_d
 		}
 
 	if (s->set_ctrl) {
-		n = sizeof(s->qctrl) / sizeof(s->qctrl[0]);
-		for (i = 0; i < n; i++)
-			if (s->qctrl[i].id != 0 && 
+		for (i = 0; i < ARRAY_SIZE(s->qctrl); i++)
+			if (s->qctrl[i].id != 0 &&
 			    !(s->qctrl[i].flags & V4L2_CTRL_FLAG_DISABLED)) {
 				ctrl.id = s->qctrl[i].id;
 				ctrl.value = qctrl[i].default_value;
@@ -1388,7 +1387,7 @@ static int sn9c102_init(struct sn9c102_d
 		init_waitqueue_head(&cam->wait_stream);
 		cam->nreadbuffers = 2;
 		memcpy(s->_qctrl, s->qctrl, sizeof(s->qctrl));
-		memcpy(&(s->_rect), &(s->cropcap.defrect), 
+		memcpy(&(s->_rect), &(s->cropcap.defrect),
 		       sizeof(struct v4l2_rect));
 		cam->state |= DEV_INITIALIZED;
 	}
@@ -1810,13 +1809,12 @@ static int sn9c102_ioctl_v4l2(struct ino
 	{
 		struct sn9c102_sensor* s = cam->sensor;
 		struct v4l2_queryctrl qc;
-		u8 i, n;
+		u8 i;
 
 		if (copy_from_user(&qc, arg, sizeof(qc)))
 			return -EFAULT;
 
-		n = sizeof(s->qctrl) / sizeof(s->qctrl[0]);
-		for (i = 0; i < n; i++)
+		for (i = 0; i < ARRAY_SIZE(s->qctrl); i++)
 			if (qc.id && qc.id == s->qctrl[i].id) {
 				memcpy(&qc, &(s->qctrl[i]), sizeof(qc));
 				if (copy_to_user(arg, &qc, sizeof(qc)))
@@ -1852,7 +1850,7 @@ static int sn9c102_ioctl_v4l2(struct ino
 	{
 		struct sn9c102_sensor* s = cam->sensor;
 		struct v4l2_control ctrl;
-		u8 i, n;
+		u8 i;
 		int err = 0;
 
 		if (!s->set_ctrl)
@@ -1861,8 +1859,7 @@ static int sn9c102_ioctl_v4l2(struct ino
 		if (copy_from_user(&ctrl, arg, sizeof(ctrl)))
 			return -EFAULT;
 
-		n = sizeof(s->qctrl) / sizeof(s->qctrl[0]);
-		for (i = 0; i < n; i++)
+		for (i = 0; i < ARRAY_SIZE(s->qctrl); i++)
 			if (ctrl.id == s->qctrl[i].id) {
 				if (ctrl.value < s->qctrl[i].minimum ||
 				    ctrl.value > s->qctrl[i].maximum)
@@ -2544,7 +2541,7 @@ sn9c102_usb_probe(struct usb_interface* 
 	unsigned int i, n;
 	int err = 0, r;
 
-	n = sizeof(sn9c102_id_table)/sizeof(sn9c102_id_table[0]);
+	n = ARRAY_SIZE(sn9c102_id_table);
 	for (i = 0; i < n-1; i++)
 		if (le16_to_cpu(udev->descriptor.idVendor) == 
 		    sn9c102_id_table[i].idVendor &&
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/media/w9968cf.c linux-2.6.15-rc5~array_size/drivers/usb/media/w9968cf.c
--- linux-2.6.15-rc5/drivers/usb/media/w9968cf.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/media/w9968cf.c	2005-12-07 21:27:38.000000000 +0100
@@ -2958,7 +2958,7 @@ static int w9968cf_v4l_ioctl(struct inod
 	};
 
 	#define V4L1_IOCTL(cmd) \
-	        ((_IOC_NR((cmd)) < sizeof(v4l1_ioctls)/sizeof(char*)) ? \
+	        ((_IOC_NR((cmd)) < ARRAY_SIZE(v4l1_ioctls)) ? \
 	        v4l1_ioctls[_IOC_NR((cmd))] : "?")
 
 	cam = (struct w9968cf_device*)video_get_drvdata(video_devdata(filp));
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/net/zd1201.c linux-2.6.15-rc5~array_size/drivers/usb/net/zd1201.c
--- linux-2.6.15-rc5/drivers/usb/net/zd1201.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/net/zd1201.c	2005-12-07 21:26:33.000000000 +0100
@@ -1722,7 +1722,7 @@ static const struct iw_priv_args zd1201_
 	    IW_PRIV_TYPE_NONE, "sethostauth" },
 	{ ZD1201GIWHOSTAUTH, IW_PRIV_TYPE_NONE,
 	    IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, "gethostauth" },
-	{ ZD1201SIWAUTHSTA, IW_PRIV_TYPE_ADDR | IW_PRIV_SIZE_FIXED | 1, 
+	{ ZD1201SIWAUTHSTA, IW_PRIV_TYPE_ADDR | IW_PRIV_SIZE_FIXED | 1,
 	    IW_PRIV_TYPE_NONE, "authstation" },
 	{ ZD1201SIWMAXASSOC, IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1,
 	    IW_PRIV_TYPE_NONE, "setmaxassoc" },
@@ -1731,9 +1731,9 @@ static const struct iw_priv_args zd1201_
 };
 
 static const struct iw_handler_def zd1201_iw_handlers = {
-	.num_standard 		= sizeof(zd1201_iw_handler)/sizeof(iw_handler),
-	.num_private 		= sizeof(zd1201_private_handler)/sizeof(iw_handler),
-	.num_private_args 	= sizeof(zd1201_private_args)/sizeof(struct iw_priv_args),
+	.num_standard 		= ARRAY_SIZE(zd1201_iw_handler),
+	.num_private 		= ARRAY_SIZE(zd1201_private_handler),
+	.num_private_args 	= ARRAY_SIZE(zd1201_private_args),
 	.standard 		= (iw_handler *)zd1201_iw_handler,
 	.private 		= (iw_handler *)zd1201_private_handler,
 	.private_args 		= (struct iw_priv_args *) zd1201_private_args,
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/serial/io_edgeport.c linux-2.6.15-rc5~array_size/drivers/usb/serial/io_edgeport.c
--- linux-2.6.15-rc5/drivers/usb/serial/io_edgeport.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/serial/io_edgeport.c	2005-12-07 21:09:12.000000000 +0100
@@ -2353,7 +2353,7 @@ static int calc_baud_rate_divisor (int b
 
 	dbg("%s - %d", __FUNCTION__, baudrate);
 
-	for (i = 0; i < NUM_ENTRIES(divisor_table); i++) {
+	for (i = 0; i < ARRAY_SIZE(divisor_table); i++) {
 		if ( divisor_table[i].BaudRate == baudrate ) {
 			*divisor = divisor_table[i].Divisor;
 			return 0;
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/serial/io_edgeport.h linux-2.6.15-rc5~array_size/drivers/usb/serial/io_edgeport.h
--- linux-2.6.15-rc5/drivers/usb/serial/io_edgeport.h	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc5~array_size/drivers/usb/serial/io_edgeport.h	2005-12-07 21:09:12.000000000 +0100
@@ -31,9 +31,6 @@
 #ifndef HIGH8
 	#define HIGH8(a)	((unsigned char)((a & 0xff00) >> 8))
 #endif
-#ifndef NUM_ENTRIES
-	#define NUM_ENTRIES(x)	(sizeof(x)/sizeof((x)[0]))
-#endif
 
 #ifndef __KERNEL__
 #define __KERNEL__
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/serial/safe_serial.c linux-2.6.15-rc5~array_size/drivers/usb/serial/safe_serial.c
--- linux-2.6.15-rc5/drivers/usb/serial/safe_serial.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/serial/safe_serial.c	2005-12-07 21:09:12.000000000 +0100
@@ -425,7 +425,7 @@ static int __init safe_init (void)
 	if (vendor || product) {
 		info ("vendor: %x product: %x\n", vendor, product);
 
-		for (i = 0; i < (sizeof (id_table) / sizeof (struct usb_device_id)); i++) {
+		for (i = 0; i < ARRAY_SIZE(id_table); i++) {
 			if (!id_table[i].idVendor && !id_table[i].idProduct) {
 				id_table[i].idVendor = vendor;
 				id_table[i].idProduct = product;
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/serial/ti_usb_3410_5052.c linux-2.6.15-rc5~array_size/drivers/usb/serial/ti_usb_3410_5052.c
--- linux-2.6.15-rc5/drivers/usb/serial/ti_usb_3410_5052.c	2005-12-07 20:57:16.000000000 +0100
+++ linux-2.6.15-rc5~array_size/drivers/usb/serial/ti_usb_3410_5052.c	2005-12-07 21:09:12.000000000 +0100
@@ -351,17 +351,14 @@ static int __init ti_init(void)
 	int i,j;
 	int ret;
 
-
 	/* insert extra vendor and product ids */
-	j = sizeof(ti_id_table_3410)/sizeof(struct usb_device_id)
-		- TI_EXTRA_VID_PID_COUNT - 1;
+	j = ARRAY_SIZE(ti_id_table_3410) - TI_EXTRA_VID_PID_COUNT - 1;
 	for (i=0; i<min(vendor_3410_count,product_3410_count); i++,j++) {
 		ti_id_table_3410[j].idVendor = vendor_3410[i];
 		ti_id_table_3410[j].idProduct = product_3410[i];
 		ti_id_table_3410[j].match_flags = USB_DEVICE_ID_MATCH_DEVICE;
 	}
-	j = sizeof(ti_id_table_5052)/sizeof(struct usb_device_id)
-		- TI_EXTRA_VID_PID_COUNT - 1;
+	j = ARRAY_SIZE(ti_id_table_5052) - TI_EXTRA_VID_PID_COUNT - 1;
 	for (i=0; i<min(vendor_5052_count,product_5052_count); i++,j++) {
 		ti_id_table_5052[j].idVendor = vendor_5052[i];
 		ti_id_table_5052[j].idProduct = product_5052[i];
diff -X dontdiff -urpN linux-2.6.15-rc5/drivers/usb/storage/sddr09.c linux-2.6.15-rc5~array_size/drivers/usb/storage/sddr09.c
--- linux-2.6.15-rc5/drivers/usb/storage/sddr09.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc5~array_size/drivers/usb/storage/sddr09.c	2005-12-07 21:09:12.000000000 +0100
@@ -133,13 +133,11 @@ static struct nand_flash_dev nand_flash_
 	{ 0,}
 };
 
-#define SIZE(a)	(sizeof(a)/sizeof((a)[0]))
-
 static struct nand_flash_dev *
 nand_find_id(unsigned char id) {
 	int i;
 
-	for (i = 0; i < SIZE(nand_flash_ids); i++)
+	for (i = 0; i < ARRAY_SIZE(nand_flash_ids); i++)
 		if (nand_flash_ids[i].model_id == id)
 			return &(nand_flash_ids[i]);
 	return NULL;

--===============41531077005013151==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41531077005013151==--

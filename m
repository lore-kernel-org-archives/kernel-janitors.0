From: Rememberme <rememberme@systol.god.lan>
Date: Thu, 24 Feb 2005 12:13:40 +0000
Subject: [KJ] [PATCH 2/2] drivers/video/savage
Message-Id: <20050224121340.GB4090@systol.god.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="A6N2fC+uXW/VQSAv"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Part 2
The savage driver adapted.

Best regards,

Henk Vergonet


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="patch-2.6.11-rc4-savage-accel"

diff -urpN --exclude='*.o' linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb-i2c.c linux-2.6.11-rc4/drivers/video/savage/savagefb-i2c.c
--- linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb-i2c.c	2005-02-23 10:08:55.000000000 +0100
+++ linux-2.6.11-rc4/drivers/video/savage/savagefb-i2c.c	2005-02-23 17:51:17.000000000 +0100
@@ -183,7 +183,7 @@ void savagefb_create_i2c_busses(struct f
 	struct savagefb_par *par = (struct savagefb_par *)info->par;
 	par->chan.par	= par;
 
-	switch(info->fix.accel) {
+	switch(par->accel) {
 	case FB_ACCEL_PROSAVAGE_DDRK:
 	case FB_ACCEL_PROSAVAGE_PM:
 		par->chan.reg         = CR_SERIAL2;
diff -urpN --exclude='*.o' linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb.c linux-2.6.11-rc4/drivers/video/savage/savagefb.c
--- linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb.c	2004-12-24 22:34:45.000000000 +0100
+++ linux-2.6.11-rc4/drivers/video/savage/savagefb.c	2005-02-23 17:51:42.000000000 +0100
@@ -1793,9 +1793,10 @@ static int __devinit savage_init_fb_info
 	info->fix.xpanstep	   = 2;
 	info->fix.ypanstep	   = 1;
 	info->fix.ywrapstep   = 0;
-	info->fix.accel       = id->driver_data;
+	info->fix.accel       = FB_ACCEL_DUMMY;
 
-	switch (info->fix.accel) {
+	par->accel = id->driver_data;
+	switch (par->accel) {
 	case FB_ACCEL_SUPERSAVAGE:
 		par->chip = S3_SUPERSAVAGE;
 		snprintf (info->fix.id, 16, "SuperSavage");
diff -urpN --exclude='*.o' linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb.h linux-2.6.11-rc4/drivers/video/savage/savagefb.h
--- linux-2.6.11-rc4-vanilla/drivers/video/savage/savagefb.h	2004-12-24 22:35:50.000000000 +0100
+++ linux-2.6.11-rc4/drivers/video/savage/savagefb.h	2005-02-23 17:49:32.000000000 +0100
@@ -76,6 +76,24 @@ typedef enum {
   S3_LAST
 } savage_chipset;
 
+typedef enum {
+	FB_ACCEL_SAVAGE4 = 0x80,	/* S3 Savage4		*/
+	FB_ACCEL_SAVAGE3D,		/* S3 Savage3D		*/
+	FB_ACCEL_SAVAGE3D_MV,		/* S3 Savage3D-MV	*/
+	FB_ACCEL_SAVAGE2000,		/* S3 Savage2000	*/
+	FB_ACCEL_SAVAGE_MX_MV,		/* S3 Savage/MX-MV	*/
+	FB_ACCEL_SAVAGE_MX,		/* S3 Savage/MX		*/
+	FB_ACCEL_SAVAGE_IX_MV,		/* S3 Savage/IX-MV	*/
+	FB_ACCEL_SAVAGE_IX,		/* S3 Savage/IX		*/
+	FB_ACCEL_PROSAVAGE_PM,		/* S3 ProSavage PM133	*/
+	FB_ACCEL_PROSAVAGE_KM,		/* S3 ProSavage KM133	*/
+	FB_ACCEL_S3TWISTER_P,		/* S3 Twister		*/
+	FB_ACCEL_S3TWISTER_K,		/* S3 TwisterK		*/
+	FB_ACCEL_SUPERSAVAGE,		/* S3 Supersavage	*/
+	FB_ACCEL_PROSAVAGE_DDR,		/* S3 ProSavage DDR	*/
+	FB_ACCEL_PROSAVAGE_DDRK		/* S3 ProSavage DDR-K	*/
+} savage_accel;
+
 #define BIOS_BSIZE		     1024
 #define BIOS_BASE		     0xc0000
 
@@ -163,6 +181,7 @@ struct savagefb_i2c_chan {
 struct savagefb_par {
 	struct pci_dev *pcidev;
 	savage_chipset  chip;
+	savage_accel	accel;
 	struct savagefb_i2c_chan chan;
 	unsigned char   *edid;
 	u32 pseudo_palette[16];

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--A6N2fC+uXW/VQSAv--

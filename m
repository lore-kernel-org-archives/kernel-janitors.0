From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 19:27:39 +0000
Subject: [patch] V4L/DVB: remove unneeded null check in anysee_probe()
Message-Id: <20100531192632.GZ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Antti Palosaari <crope@iki.fi>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complained because "d" is dereferenced first and then checked for
null later .  The only code path where "d" could be a invalid pointer is
if this is a cold device in dvb_usb_device_init().  I consulted Antti 
Palosaari and he explained that anysee is always a warm device.

I have added a comment and removed the unneeded null check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/dvb-usb/anysee.c b/drivers/media/dvb/dvb-usb/anysee.c
index faca1ad..aa5c7d5 100644
--- a/drivers/media/dvb/dvb-usb/anysee.c
+++ b/drivers/media/dvb/dvb-usb/anysee.c
@@ -463,6 +463,11 @@ static int anysee_probe(struct usb_interface *intf,
 	if (intf->num_altsetting < 1)
 		return -ENODEV;
 
+	/*
+	 * Anysee is always warm (its USB-bridge, Cypress FX2, uploads
+	 * firmware from eeprom).  If dvb_usb_device_init() succeeds that
+	 * means d is a valid pointer.
+	 */
 	ret = dvb_usb_device_init(intf, &anysee_properties, THIS_MODULE, &d,
 		adapter_nr);
 	if (ret)
@@ -479,10 +484,7 @@ static int anysee_probe(struct usb_interface *intf,
 	if (ret)
 		return ret;
 
-	if (d)
-		ret = anysee_init(d);
-
-	return ret;
+	return anysee_init(d);
 }
 
 static struct usb_device_id anysee_table[] = {

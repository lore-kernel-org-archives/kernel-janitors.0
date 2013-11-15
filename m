From: Luca <bartolacci92@hotmail.com>
Date: Fri, 15 Nov 2013 20:52:15 +0000
Subject: [patch]parport:probe.c Cleanup Whitespaces
Message-Id: <BLU0-SMTP95E0D0628583A91DFE38B4CAFB0@phx.gbl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Cleanup Whitespaces, let me know if something's wrong.

Signed-off-by: Luca Bartolacci <inductionv8@gmail.com>
---
 drivers/parport/probe.c |   40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/parport/probe.c b/drivers/parport/probe.c
index d763bc9..a46d7c7 100644
--- a/drivers/parport/probe.c
+++ b/drivers/parport/probe.c
@@ -20,7 +20,7 @@ static const struct {
 	{ "PRINTER",     "Printer" },
 	{ "MODEM",       "Modem" },
 	{ "NET",         "Network device" },
-	{ "HDC",       	 "Hard disk" },
+	{ "HDC",         "Hard disk" },
 	{ "PCMCIA",      "PCMCIA" },
 	{ "MEDIA",       "Multimedia device" },
 	{ "FDC",         "Floppy disk" },
@@ -40,9 +40,9 @@ static void pretty_print(struct parport *port, int device)
 	printk(KERN_INFO "%s", port->name);
 
 	if (device >= 0)
-		printk (" (addr %d)", device);
+		printk(" (addr %d)", device);
 
-	printk (": %s", classes[info->class].descr);
+	printk(": %s", classes[info->class].descr);
 	if (info->class)
 		printk(", %s %s", info->mfr, info->model);
 
@@ -70,7 +70,7 @@ static void parse_data(struct parport *port, int device, char *str)
 			char *u;
 			*(sep++) = 0;
 			/* Get rid of trailing blanks */
-			u = sep + strlen (sep) - 1;
+			u = sep + strlen(sep) - 1;
 			while (u >= p && *u = ' ')
 				*u-- = '\0';
 			u = p;
@@ -132,7 +132,7 @@ static void parse_data(struct parport *port, int device, char *str)
 /* Read up to count-1 bytes of device id. Terminate buffer with
  * '\0'. Buffer begins with two Device ID length bytes as given by
  * device. */
-static ssize_t parport_read_device_id (struct parport *port, char *buffer,
+static ssize_t parport_read_device_id(struct parport *port, char *buffer,
 				       size_t count)
 {
 	unsigned char length[2];
@@ -144,7 +144,7 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 	size_t len;
 
 	/* First two bytes are MSB,LSB of inclusive length. */
-	retval = parport_read (port, length, 2);
+	retval = parport_read(port, length, 2);
 
 	if (retval < 0)
 		return retval;
@@ -176,7 +176,7 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 		 * just return constant nibble forever. This catches
 		 * also those cases. */
 		if (idlens[0] = 0 || idlens[0] > 0xFFF) {
-			printk (KERN_DEBUG "%s: reported broken Device ID"
+			printk(KERN_DEBUG "%s: reported broken Device ID"
 				" length of %#zX bytes\n",
 				port->name, idlens[0]);
 			return -EIO;
@@ -192,7 +192,7 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 		if (idlen+1 >= count)
 			break;
 
-		retval = parport_read (port, buffer+len, idlen-len);
+		retval = parport_read(port, buffer+len, idlen-len);
 
 		if (retval < 0)
 			return retval;
@@ -200,7 +200,7 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 
 		if (port->physport->ieee1284.phase != IEEE1284_PH_HBUSY_DAVAIL) {
 			if (belen != len) {
-				printk (KERN_DEBUG "%s: Device ID was %zd bytes"
+				printk(KERN_DEBUG "%s: Device ID was %zd bytes"
 					" while device told it would be %d"
 					" bytes\n",
 					port->name, len, belen);
@@ -213,7 +213,7 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 		 * the first 256 bytes or so that we must have read so
 		 * far. */
 		if (buffer[len-1] = ';') {
- 			printk (KERN_DEBUG "%s: Device ID reading stopped"
+			printk(KERN_DEBUG "%s: Device ID reading stopped"
 				" before device told data not available. "
 				"Current idlen %u of %u, len bytes %02X %02X\n",
 				port->name, current_idlen, numidlens,
@@ -253,30 +253,30 @@ static ssize_t parport_read_device_id (struct parport *port, char *buffer,
 }
 
 /* Get Std 1284 Device ID. */
-ssize_t parport_device_id (int devnum, char *buffer, size_t count)
+ssize_t parport_device_id(int devnum, char *buffer, size_t count)
 {
 	ssize_t retval = -ENXIO;
-	struct pardevice *dev = parport_open (devnum, "Device ID probe");
+	struct pardevice *dev = parport_open(devnum, "Device ID probe");
 	if (!dev)
 		return -ENXIO;
 
-	parport_claim_or_block (dev);
+	parport_claim_or_block(dev);
 
 	/* Negotiate to compatibility mode, and then to device ID
 	 * mode. (This so that we start form beginning of device ID if
 	 * already in device ID mode.) */
-	parport_negotiate (dev->port, IEEE1284_MODE_COMPAT);
-	retval = parport_negotiate (dev->port,
+	parport_negotiate(dev->port, IEEE1284_MODE_COMPAT);
+	retval = parport_negotiate(dev->port,
 				    IEEE1284_MODE_NIBBLE | IEEE1284_DEVICEID);
 
 	if (!retval) {
-		retval = parport_read_device_id (dev->port, buffer, count);
-		parport_negotiate (dev->port, IEEE1284_MODE_COMPAT);
+		retval = parport_read_device_id(dev->port, buffer, count);
+		parport_negotiate(dev->port, IEEE1284_MODE_COMPAT);
 		if (retval > 2)
-			parse_data (dev->port, dev->daisy, buffer+2);
+			parse_data(dev->port, dev->daisy, buffer+2);
 	}
 
-	parport_release (dev);
-	parport_close (dev);
+	parport_release(dev);
+	parport_close(dev);
 	return retval;
 }
--



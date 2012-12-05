From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Dec 2012 18:43:16 +0000
Subject: [patch 1/2] staging: line6: delete an unused function
Message-Id: <20121205184316.GA18227@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Markus Grabner <grabner@icg.tugraz.at>, Johannes Thumshirn <morbidrsa@googlemail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

line6_send_sysex_message_async() isn't called from anywhere.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/line6/driver.h b/drivers/staging/line6/driver.h
index f0be5a2..1dd768c2 100644
--- a/drivers/staging/line6/driver.h
+++ b/drivers/staging/line6/driver.h
@@ -208,8 +208,6 @@ extern int line6_send_raw_message_async(struct usb_line6 *line6,
 					const char *buffer, int size);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
-extern int line6_send_sysex_message_async(struct usb_line6 *line6,
-					  const char *buffer, int size);
 extern ssize_t line6_set_raw(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count);
 extern void line6_start_timer(struct timer_list *timer, unsigned int msecs,
diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index 1e4ce500..8a5d89e 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -333,17 +333,6 @@ int line6_send_sysex_message(struct usb_line6 *line6, const char *buffer,
 }
 
 /*
-	Send sysex message in pieces of wMaxPacketSize bytes.
-*/
-int line6_send_sysex_message_async(struct usb_line6 *line6, const char *buffer,
-				   int size)
-{
-	return line6_send_raw_message_async(line6, buffer,
-					    size + SYSEX_EXTRA_SIZE) -
-	    SYSEX_EXTRA_SIZE;
-}
-
-/*
 	Allocate buffer for sysex message and prepare header.
 	@param code sysex message code
 	@param size number of bytes between code and sysex end

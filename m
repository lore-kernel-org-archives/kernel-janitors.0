From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Dec 2012 18:44:52 +0000
Subject: [patch 2/2] staging: line6: use after free bug requesting version
Message-Id: <20121205184452.GB18227@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In line6_version_request_async() we set up an async message but we free
the buffer with the version in it before the message has been sent.

I've introduced a new function line6_async_request_sent_free_buffer()
which frees the data after we are done with it.  I've added a "free"
parameter to the line6_send_raw_message_async() functions so that they
know if they have to free the msg->buffer or not at the end.

Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/line6/driver.h b/drivers/staging/line6/driver.h
index 1dd768c2..918d19e 100644
--- a/drivers/staging/line6/driver.h
+++ b/drivers/staging/line6/driver.h
@@ -205,7 +205,7 @@ extern int line6_send_program(struct usb_line6 *line6, u8 value);
 extern int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
 				  int size);
 extern int line6_send_raw_message_async(struct usb_line6 *line6,
-					const char *buffer, int size);
+					const char *buffer, int size, int free);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
 extern ssize_t line6_set_raw(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/staging/line6/variax.c b/drivers/staging/line6/variax.c
index 4fca58f..f97512d 100644
--- a/drivers/staging/line6/variax.c
+++ b/drivers/staging/line6/variax.c
@@ -47,7 +47,7 @@ static void variax_activate_async(struct usb_line6_variax *variax, int a)
 {
 	variax->buffer_activate[VARIAX_OFFSET_ACTIVATE] = a;
 	line6_send_raw_message_async(&variax->line6, variax->buffer_activate,
-				     sizeof(variax_activate));
+				     sizeof(variax_activate), 0);
 }
 
 /*
diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index 8a5d89e..884e0d8 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -110,7 +110,7 @@ struct message {
 */
 static void line6_data_received(struct urb *urb);
 static int line6_send_raw_message_async_part(struct message *msg,
-					     struct urb *urb);
+					     struct urb *urb, int free);
 
 /*
 	Start to listen on endpoint.
@@ -219,24 +219,42 @@ static void line6_async_request_sent(struct urb *urb)
 		usb_free_urb(urb);
 		kfree(msg);
 	} else
-		line6_send_raw_message_async_part(msg, urb);
+		line6_send_raw_message_async_part(msg, urb, 0);
+}
+
+static void line6_async_request_sent_free_buffer(struct urb *urb)
+{
+	struct message *msg = (struct message *)urb->context;
+
+	if (msg->done >= msg->size) {
+		usb_free_urb(urb);
+		kfree(msg->buffer);
+		kfree(msg);
+	} else
+		line6_send_raw_message_async_part(msg, urb, 1);
 }
 
 /*
 	Asynchronously send part of a raw message.
 */
 static int line6_send_raw_message_async_part(struct message *msg,
-					     struct urb *urb)
+					     struct urb *urb, int free)
 {
 	int retval;
 	struct usb_line6 *line6 = msg->line6;
 	int done = msg->done;
 	int bytes = min(msg->size - done, line6->max_packet_size);
+	usb_complete_t complete_fn;
+
+	if (free)
+		complete_fn = line6_async_request_sent_free_buffer;
+	else
+		complete_fn = line6_async_request_sent;
 
 	usb_fill_int_urb(urb, line6->usbdev,
 			 usb_sndintpipe(line6->usbdev, line6->ep_control_write),
-			 (char *)msg->buffer + done, bytes,
-			 line6_async_request_sent, msg, line6->interval);
+			 (char *)msg->buffer + done, bytes, complete_fn, msg,
+			 line6->interval);
 
 	msg->done += bytes;
 	retval = usb_submit_urb(urb, GFP_ATOMIC);
@@ -267,7 +285,7 @@ void line6_start_timer(struct timer_list *timer, unsigned int msecs,
 	Asynchronously send raw message.
 */
 int line6_send_raw_message_async(struct usb_line6 *line6, const char *buffer,
-				 int size)
+				 int size, int free)
 {
 	struct message *msg;
 	struct urb *urb;
@@ -296,7 +314,7 @@ int line6_send_raw_message_async(struct usb_line6 *line6, const char *buffer,
 	msg->done = 0;
 
 	/* start sending: */
-	return line6_send_raw_message_async_part(msg, urb);
+	return line6_send_raw_message_async_part(msg, urb, free);
 }
 
 /*
@@ -316,8 +334,7 @@ int line6_version_request_async(struct usb_line6 *line6)
 	memcpy(buffer, line6_request_version, sizeof(line6_request_version));
 
 	retval = line6_send_raw_message_async(line6, buffer,
-					      sizeof(line6_request_version));
-	kfree(buffer);
+					      sizeof(line6_request_version), 1);
 	return retval;
 }
 

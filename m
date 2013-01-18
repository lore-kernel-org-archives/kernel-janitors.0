From: Markus Grabner <grabner@icg.tugraz.at>
Date: Fri, 18 Jan 2013 21:52:14 +0000
Subject: [PATCH] staging: line6: fix use-after-free bug
Message-Id: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The function "line6_send_raw_message_async" now has an additional argument
"bool copy", which indicates whether the supplied buffer should be copied into
a dynamically allocated block of memory. The copy flag is also stored in the
"message" struct such that the temporary memory can be freed when appropriate
without intervention of the caller.

Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Markus Grabner <grabner@icg.tugraz.at>
---
 drivers/staging/line6/driver.c |   57 ++++++++++++++++++++++------------------
 drivers/staging/line6/driver.h |    3 ++-
 drivers/staging/line6/variax.c |    2 +-
 3 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index 1b05633..1e6e0da 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -103,6 +103,7 @@ struct message {
 	const char *buffer;
 	int size;
 	int done;
+	bool copy;
 };
 
 /*
@@ -216,6 +217,9 @@ static void line6_async_request_sent(struct urb *urb)
 	struct message *msg = (struct message *)urb->context;
 
 	if (msg->done >= msg->size) {
+		if (msg->copy)
+			kfree(msg->buffer);
+
 		usb_free_urb(urb);
 		kfree(msg);
 	} else
@@ -267,26 +271,29 @@ void line6_start_timer(struct timer_list *timer, unsigned int msecs,
 	Asynchronously send raw message.
 */
 int line6_send_raw_message_async(struct usb_line6 *line6, const char *buffer,
-				 int size)
+				 int size, bool copy)
 {
-	struct message *msg;
-	struct urb *urb;
+	struct message *msg = NULL;
+	struct urb *urb = NULL;
 
 	/* create message: */
 	msg = kmalloc(sizeof(struct message), GFP_ATOMIC);
 
-	if (msg = NULL) {
-		dev_err(line6->ifcdev, "Out of memory\n");
-		return -ENOMEM;
-	}
+	if (msg = NULL)
+		goto out_of_memory;
 
 	/* create URB: */
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
 
-	if (urb = NULL) {
-		kfree(msg);
-		dev_err(line6->ifcdev, "Out of memory\n");
-		return -ENOMEM;
+	if (urb = NULL)
+		goto out_of_memory;
+
+	/* copy buffer if requested: */
+	if (copy) {
+		buffer = kmemdup(buffer, size, GFP_ATOMIC);
+		
+		if (buffer = NULL)
+			goto out_of_memory;
 	}
 
 	/* set message data: */
@@ -294,9 +301,20 @@ int line6_send_raw_message_async(struct usb_line6 *line6, const char *buffer,
 	msg->buffer = buffer;
 	msg->size = size;
 	msg->done = 0;
+	msg->copy = copy;
 
 	/* start sending: */
 	return line6_send_raw_message_async_part(msg, urb);
+
+out_of_memory:
+	if (urb != NULL)
+		usb_free_urb(urb);
+
+	if (msg != NULL)
+		kfree(msg);
+
+	dev_err(line6->ifcdev, "Out of memory");
+	return -ENOMEM;
 }
 
 /*
@@ -304,20 +322,9 @@ int line6_send_raw_message_async(struct usb_line6 *line6, const char *buffer,
 */
 int line6_version_request_async(struct usb_line6 *line6)
 {
-	char *buffer;
-	int retval;
-
-	buffer = kmemdup(line6_request_version,
-			sizeof(line6_request_version), GFP_ATOMIC);
-	if (buffer = NULL) {
-		dev_err(line6->ifcdev, "Out of memory");
-		return -ENOMEM;
-	}
-
-	retval = line6_send_raw_message_async(line6, buffer,
-					      sizeof(line6_request_version));
-	kfree(buffer);
-	return retval;
+	return line6_send_raw_message_async(line6, line6_request_version,
+					    sizeof(line6_request_version),
+					    true);
 }
 
 /*
diff --git a/drivers/staging/line6/driver.h b/drivers/staging/line6/driver.h
index 2e0f134..8120cdf 100644
--- a/drivers/staging/line6/driver.h
+++ b/drivers/staging/line6/driver.h
@@ -205,7 +205,8 @@ extern int line6_send_program(struct usb_line6 *line6, u8 value);
 extern int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
 				  int size);
 extern int line6_send_raw_message_async(struct usb_line6 *line6,
-					const char *buffer, int size);
+					const char *buffer, int size,
+					bool copy);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
 extern ssize_t line6_set_raw(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/staging/line6/variax.c b/drivers/staging/line6/variax.c
index 4fca58f..47753d5 100644
--- a/drivers/staging/line6/variax.c
+++ b/drivers/staging/line6/variax.c
@@ -47,7 +47,7 @@ static void variax_activate_async(struct usb_line6_variax *variax, int a)
 {
 	variax->buffer_activate[VARIAX_OFFSET_ACTIVATE] = a;
 	line6_send_raw_message_async(&variax->line6, variax->buffer_activate,
-				     sizeof(variax_activate));
+				     sizeof(variax_activate), false);
 }
 
 /*
-- 
1.7.10.4


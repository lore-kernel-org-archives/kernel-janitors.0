From: Markus Grabner <grabner@icg.tugraz.at>
Date: Sun, 13 Jan 2013 18:15:22 +0000
Subject: Re: [patch 2/2] staging: line6: use after free bug requesting version
Message-Id: <2010413.oiM49xvt6a@mark>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205184452.GB18227@elgon.mountain>
In-Reply-To: <20121205184452.GB18227@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 06 December 2012 06:18:02 Stefan Hajnoczi wrote:
> On Wed, Dec 5, 2012 at 7:44 PM, Dan Carpenter <dan.carpenter@oracle.com> 
wrote:
> > diff --git a/drivers/staging/line6/driver.c
> > b/drivers/staging/line6/driver.c index 8a5d89e..884e0d8 100644
> > --- a/drivers/staging/line6/driver.c
> > +++ b/drivers/staging/line6/driver.c
> > @@ -110,7 +110,7 @@ struct message {
> > 
> >  */
> >  static void line6_data_received(struct urb *urb);
> >  static int line6_send_raw_message_async_part(struct message *msg,
> > 
> > -                                            struct urb *urb);
> > +                                            struct urb *urb, int free);
> 
> s/int/bool/
> 
> >  /*
> >  
> >         Start to listen on endpoint.
> > 
> > @@ -219,24 +219,42 @@ static void line6_async_request_sent(struct urb
> > *urb)
> > 
> >                 usb_free_urb(urb);
> >                 kfree(msg);
> >         
> >         } else
> > 
> > -               line6_send_raw_message_async_part(msg, urb);
> > +               line6_send_raw_message_async_part(msg, urb, 0);
> > +}
> 
> I'd add a bool free_buffer field to struct message and simply modify
> line6_async_request_sent() to do:
> 
> if (msg->free_buffer)
>          kfree(msg->buffer);
> 
> Then you don't need line6_async_request_sent_free_buffer() and
> line6_send_raw_message_async_part() doesn't need to take a bool free
> argument since struct message already contains that information.  It
> would make the code simpler.
Considering the suggestions made so far, I came up with the following 
solution: the function "line6_send_raw_message_async" now has an additional 
argument "bool copy", which indicates whether the supplied buffer should be 
copied into a dynamically allocated block of memory. The copy flag is also 
stored in the "message" struct such that the temporary memory can be freed 
when appropriate without intervention of the caller.

The patch is against linux-next since this bug should be fixed regardless of 
the status of moving the Line6 driver out of the staging area.

Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Markus Grabner <grabner@icg.tugraz.at>

diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index 4513f78..e29e126 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -106,6 +106,7 @@ struct message {
 	const char *buffer;
 	int size;
 	int done;
+	bool copy;
 };
 
 /*
@@ -239,6 +240,9 @@ static void line6_async_request_sent(struct urb *urb)
 	struct message *msg = (struct message *)urb->context;
 
 	if (msg->done >= msg->size) {
+		if (msg->copy)
+			kfree(msg->buffer);
+
 		usb_free_urb(urb);
 		kfree(msg);
 	} else
@@ -294,26 +298,29 @@ void line6_start_timer(struct timer_list *timer, 
unsigned int msecs,
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
@@ -321,9 +328,20 @@ int line6_send_raw_message_async(struct usb_line6 *line6, 
const char *buffer,
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
@@ -331,21 +349,8 @@ int line6_send_raw_message_async(struct usb_line6 *line6, 
const char *buffer,
 */
 int line6_version_request_async(struct usb_line6 *line6)
 {
-	char *buffer;
-	int retval;
-
-	buffer = kmalloc(sizeof(line6_request_version), GFP_ATOMIC);
-	if (buffer = NULL) {
-		dev_err(line6->ifcdev, "Out of memory");
-		return -ENOMEM;
-	}
-
-	memcpy(buffer, line6_request_version, sizeof(line6_request_version));
-
-	retval = line6_send_raw_message_async(line6, buffer,
-					      sizeof(line6_request_version));
-	kfree(buffer);
-	return retval;
+	return line6_send_raw_message_async(line6, line6_request_version,
+					    sizeof(line6_request_version), true);
 }
 
 /*
diff --git a/drivers/staging/line6/driver.h b/drivers/staging/line6/driver.h
index 117bf99..793ceda 100644
--- a/drivers/staging/line6/driver.h
+++ b/drivers/staging/line6/driver.h
@@ -213,7 +213,7 @@ extern int line6_send_program(struct usb_line6 *line6, int 
value);
 extern int line6_send_raw_message(struct usb_line6 *line6, const char 
*buffer,
 				  int size);
 extern int line6_send_raw_message_async(struct usb_line6 *line6,
-					const char *buffer, int size);
+					const char *buffer, int size, bool copy);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
 extern int line6_send_sysex_message_async(struct usb_line6 *line6,
diff --git a/drivers/staging/line6/dumprequest.c 
b/drivers/staging/line6/dumprequest.c
index 60c7bae..c2750c5 100644
--- a/drivers/staging/line6/dumprequest.c
+++ b/drivers/staging/line6/dumprequest.c
@@ -49,7 +49,7 @@ int line6_dump_request_async(struct line6_dump_request 
*l6dr,
 	int ret;
 	line6_dump_started(l6dr, dest);
 	ret = line6_send_raw_message_async(line6, l6dr->reqbufs[num].buffer,
-					   l6dr->reqbufs[num].length);
+					   l6dr->reqbufs[num].length, false);
 
 	if (ret < 0)
 		line6_dump_finished(l6dr);
diff --git a/drivers/staging/line6/variax.c b/drivers/staging/line6/variax.c
index d366222..d013e26 100644
--- a/drivers/staging/line6/variax.c
+++ b/drivers/staging/line6/variax.c
@@ -94,7 +94,7 @@ static void variax_activate_async(struct usb_line6_variax 
*variax, int a)
 {
 	variax->buffer_activate[VARIAX_OFFSET_ACTIVATE] = a;
 	line6_send_raw_message_async(&variax->line6, variax->buffer_activate,
-				     sizeof(variax_activate));
+				     sizeof(variax_activate), false);
 }
 
 /*


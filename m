From: Domen Puncer <domen@coderock.org>
Date: Sun, 21 Mar 2004 01:14:06 +0000
Subject: [Kernel-janitors] [patch 2.6.4] removing sleep_on from
Message-Id: <200403210214.06325.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200403202233.37294.domen@coderock.org>
In-Reply-To: <200403202233.37294.domen@coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

Only compile tested. Any feedback welcome.

--- c/drivers/usb/serial/whiteheat.c	2004-02-04 10:06:59.000000000 +0100
+++ a/drivers/usb/serial/whiteheat.c	2004-03-21 02:09:15.000000000 +0100
@@ -1132,6 +1132,7 @@ static int firm_send_command (struct usb
 	__u8 *transfer_buffer;
 	int retval = 0;
 	unsigned long flags;
+	DECLARE_WAITQUEUE(wait, current);
 
 	dbg("%s - command %d", __FUNCTION__, command);
 
@@ -1146,7 +1147,6 @@ static int firm_send_command (struct usb
 	command_port->write_urb->transfer_buffer_length = datasize + 1;
 	command_port->write_urb->dev = port->serial->dev;
 	retval = usb_submit_urb (command_port->write_urb, GFP_KERNEL);
-	spin_unlock_irqrestore(&command_info->lock, flags);
 	if (retval) {
 		dbg("%s - submit urb failed", __FUNCTION__);
 		goto exit;
@@ -1154,11 +1154,23 @@ static int firm_send_command (struct usb
 
 	/* wait for the command to complete */
 	timeout = COMMAND_TIMEOUT;
-	while (timeout && (command_info->command_finished = FALSE)) {
-		timeout = interruptible_sleep_on_timeout (&command_info->wait_command, timeout);
+	add_wait_queue(&command_info->wait_command, &wait);
+	for (;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE);
+		if (command_info->command_finished != FALSE)
+			break;
+		spin_unlock_irqrestore(&command_info->lock, flags);
+		timeout = schedule_timeout(timeout);
+		if (signal_pending(current)) {
+			remove_wait_queue(&command_info->wait_command, &wait);
+			return -EINTR;
+		}
+		spin_lock_irqsave(&command_info->lock, flags);
+		if (!timeout)
+			break;
 	}
-
-	spin_lock_irqsave(&command_info->lock, flags);
+	set_task_state(current, TASK_RUNNING);
+	remove_wait_queue(&command_info->wait_command, &wait);
 
 	if (command_info->command_finished = FALSE) {
 		dbg("%s - command timed out.", __FUNCTION__);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

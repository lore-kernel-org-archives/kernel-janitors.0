From: Domen Puncer <domen@coderock.org>
Date: Sun, 21 Mar 2004 00:06:15 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.4] removing sleep_on in
Message-Id: <200403210106.16053.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200403202233.37294.domen@coderock.org>
In-Reply-To: <200403202233.37294.domen@coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 20 of March 2004 23:13, Domen Puncer wrote:
> On Saturday 20 of March 2004 22:48, Greg KH wrote:
> > On Sat, Mar 20, 2004 at 10:33:36PM +0100, Domen Puncer wrote:
> > > Hi.
> > > 
> > > This is my first patch on sleep_on, so i'd really like some comments.
> > 
> > Please cc the linux-usb-devel list, they will help you out too
> > (hopefully...)
> 
> Comments and patch again, for the linux-usb-devel people...
> 
> Is wait_event(wq, 0) fine, if we are just waiting for wake_up?
> Second one is just waiting 3 seconds, so i removed wq.

I'm really sorry for posting this again.
Forget to compile test it, and missed an error. Bad Domen


--- c/drivers/usb/media/usbvideo.c	2003-12-18 03:59:59.000000000 +0100
+++ a/drivers/usb/media/usbvideo.c	2004-03-21 00:59:23.000000000 +0100
@@ -225,7 +225,7 @@
 static void RingQueue_InterruptibleSleepOn(struct RingQueue *rq)
 {
 	assert(rq != NULL);
-	interruptible_sleep_on(&rq->wqh);
+	wait_event_interruptible(rq->wqh, 0);
 }
 
 void RingQueue_WakeUpInterruptible(struct RingQueue *rq)
@@ -705,10 +705,9 @@
 /* Debugging aid */
 void usbvideo_SayAndWait(const char *what)
 {
-	wait_queue_head_t wq;
-	init_waitqueue_head(&wq);
 	info("Say: %s", what);
-	interruptible_sleep_on_timeout (&wq, HZ*3); /* Timeout */
+	set_current_state(TASK_INTERRUPTIBLE);
+	schedule_timeout(HZ*3);
 }
 
 EXPORT_SYMBOL(usbvideo_SayAndWait);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

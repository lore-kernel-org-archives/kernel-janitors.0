From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 23:22:35 +0000
Subject: [KJ] [UPDATE PATCH] ieee1394/video1394: replace
Message-Id: <20050303232235.GC16078@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1931667312147729=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1931667312147729==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 05:07:52PM -0500, Jody McIntyre wrote:
> On Tue, Feb 22, 2005 at 09:37:33AM -0800, Nishanth Aravamudan wrote:
> > On Tue, Feb 22, 2005 at 12:29:02PM -0500, Jody McIntyre wrote:
> > > Please add a Signed-off-by: line.
> > 
> > Will do, I just wanted to get you a patch to test first. If it works,
> > I'll send an "official" one :)
> 
> It's been over a week and nobody's reported any problems with your
> patch.  Please send an "official" one and I will apply it.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). Add a helper function to make the condition
for wait_event_interruptible() sane and lock-safe. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-v/drivers/ieee1394/video1394.c	2005-03-01 23:37:49.000000000 -0800
+++ 2.6.11/drivers/ieee1394/video1394.c	2005-03-03 15:22:01.000000000 -0800
@@ -699,6 +699,17 @@ static void initialize_dma_it_ctx(struct
 	reg_write(ohci, OHCI1394_IsoXmitIntMaskSet, 1<<d->ctx);
 }
 
+static inline unsigned video1394_buffer_state(struct dma_iso_ctx *d,
+					      unsigned int buffer)
+{
+	unsigned long flags;
+	unsigned int ret;
+	spin_lock_irqsave(&d->lock, flags);
+	ret = d->buffer_status[buffer];
+	spin_unlock_irqrestore(&d->lock, flags);
+	return ret;
+}
+
 static int __video1394_ioctl(struct file *file,
 			     unsigned int cmd, unsigned long arg)
 {
@@ -952,24 +963,12 @@ static int __video1394_ioctl(struct file
 			    return -EINTR;
 			}
 
-#if 1
-			while (d->buffer_status[v.buffer]!=
-			      VIDEO1394_BUFFER_READY) {
-				spin_unlock_irqrestore(&d->lock, flags);
-				interruptible_sleep_on(&d->waitq);
-				spin_lock_irqsave(&d->lock, flags);
-				if (signal_pending(current)) {
-					spin_unlock_irqrestore(&d->lock,flags);
-					return -EINTR;
-				}
-			}
-#else
-			if (wait_event_interruptible(d->waitq,
-						     d->buffer_status[v.buffer]
-						     == VIDEO1394_BUFFER_READY)
-			    == -ERESTARTSYS)
+			spin_unlock_irqrestore(&d->lock, flags);
+			wait_event_interruptible(d->waitq,
+					video1394_buffer_state(d, v.buffer) == VIDEO1394_BUFFER_READY);
+			if (signal_pending(current))
 				return -EINTR;
-#endif
+			spin_lock_irqsave(&d->lock, flags);
 			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
 			break;
 		default:

--===============1931667312147729==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1931667312147729==--

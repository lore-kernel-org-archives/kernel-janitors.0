From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:34:49 +0000
Subject: [KJ] [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050125233449.GH12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85351900544134074=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85351900544134074==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The first change is simply to clean up the code a
little to make it clearer. The second actually does a replacement, mimicking
exactly the first. I removed the #if 1/#else/endif logic, as it duplicated the
same code. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/ieee1394/video1394.c	2005-01-24 09:34:07.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/ieee1394/video1394.c	2005-01-24 15:06:16.000000000 -0800
@@ -964,10 +964,9 @@ static int __video1394_ioctl(struct file
 				}
 			}
 #else
-			if (wait_event_interruptible(d->waitq,
-						     d->buffer_status[v.buffer]
-						     == VIDEO1394_BUFFER_READY)
-			    == -ERESTARTSYS)
+			wait_event_interruptible(d->waitq,
+					(d->buffer_status[v.buffer] == VIDEO1394_BUFFER_READY));
+			if (signal_pending(current))
 				return -EINTR;
 #endif
 			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
@@ -1126,19 +1125,10 @@ static int __video1394_ioctl(struct file
 			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
 			return 0;
 		case VIDEO1394_BUFFER_QUEUED:
-#if 1
-			while (d->buffer_status[v.buffer]!=
-			      VIDEO1394_BUFFER_READY) {
-				interruptible_sleep_on(&d->waitq);
-				if (signal_pending(current)) return -EINTR;
-			}
-#else
-			if (wait_event_interruptible(d->waitq,
-						     d->buffer_status[v.buffer]
-						     == VIDEO1394_BUFFER_READY)
-			    == -ERESTARTSYS)
+			wait_event_interruptible(d->waitq,
+					(d->buffer_status[v.buffer] == VIDEO1394_BUFFER_READY));
+			if (signal_pending(current))
 				return -EINTR;
-#endif
 			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
 			return 0;
 		default:

--===============85351900544134074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85351900544134074==--

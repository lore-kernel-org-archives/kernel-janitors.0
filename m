From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 15:54:34 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/usbnet: replace
Message-Id: <20040728155433.GA1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36619859641695918=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41073864.1050407@pacbell.net>
In-Reply-To: <41073864.1050407@pacbell.net>
To: kernel-janitors@vger.kernel.org

--===============36619859641695918==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 10:23:48PM -0700, David Brownell wrote:
> Nishanth Aravamudan wrote:
> >I would appreciate any comments from the janitors list. 
> >
> >Applys-to: 2.6.7
> >
> >Description: Use msleep() instead of schedule_timeout() to 
> >guarantee the task delays for the desired time.
> 
> Please define and use UNLINK_TIMEOUT_MS, instead.
> Or better yet, switch to wait_event() ...

Please find the first of these changes below. Thanks.


--- linux-vanilla/drivers/usb/net/usbnet.c	2004-06-15 22:19:31.000000000 -0700
+++ linux-dev/drivers/usb/net/usbnet.c	2004-07-28 08:52:16.000000000 -0700
@@ -165,7 +165,8 @@
 
 // between wakeups
 #define UNLINK_TIMEOUT_JIFFIES ((3  /*ms*/ * HZ)/1000)
-
+#define UNLINK_TIMEOUT_MS	3
+ 
 /*-------------------------------------------------------------------------*/
 
 // randomly generated ethernet address
@@ -2550,8 +2551,7 @@ static int usbnet_stop (struct net_devic
 	while (skb_queue_len (&dev->rxq)
 			&& skb_queue_len (&dev->txq)
 			&& skb_queue_len (&dev->done)) {
-		set_current_state (TASK_UNINTERRUPTIBLE);
-		schedule_timeout (UNLINK_TIMEOUT_JIFFIES);
+		msleep(UNLINK_TIMEOUT_MS);
 		devdbg (dev, "waited for %d urb completions", temp);
 	}
 	dev->wait = 0;

--===============36619859641695918==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36619859641695918==--

From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:16:30 +0000
Subject: [Kernel-janitors] [PATCH] usb/usbnet: replace schedule_timeout()
Message-Id: <20040727231630.GP4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97350445169212829=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97350445169212829==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/net/usbnet.c	2004-06-16 05:19:31.000000000 +0000
+++ linux-dev/drivers/usb/net/usbnet.c	2004-07-06 01:14:20.000000000 +0000
@@ -2550,8 +2550,7 @@ static int usbnet_stop (struct net_devic
 	while (skb_queue_len (&dev->rxq)
 			&& skb_queue_len (&dev->txq)
 			&& skb_queue_len (&dev->done)) {
-		set_current_state (TASK_UNINTERRUPTIBLE);
-		schedule_timeout (UNLINK_TIMEOUT_JIFFIES);
+		msleep(jiffies_to_msecs(UNLINK_TIMEOUT_JIFFIES);
 		devdbg (dev, "waited for %d urb completions", temp);
 	}
 	dev->wait = 0;

--===============97350445169212829==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97350445169212829==--

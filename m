From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:06:45 +0000
Subject: [KJ] [PATCH 20/34] isdn/capi: replace interruptible_sleep_on() with
Message-Id: <20050126000645.GJ12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18010745717880661=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18010745717880661==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). Patch is straight-forward as current sleep is
conditionally looped. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/isdn/capi/capi.c	2005-01-24 09:34:07.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/isdn/capi/capi.c	2005-01-24 15:51:41.000000000 -0800
@@ -675,13 +675,8 @@ capi_read(struct file *file, char __user
 		if (file->f_flags & O_NONBLOCK)
 			return -EAGAIN;
 
-		for (;;) {
-			interruptible_sleep_on(&cdev->recvwait);
-			if ((skb = skb_dequeue(&cdev->recvqueue)) != 0)
-				break;
-			if (signal_pending(current))
-				break;
-		}
+		wait_event_interruptible(cdev->recvwait,
+				((skb = skb_dequeue(&cdev->recvqueue)) == 0));
 		if (skb == 0)
 			return -ERESTARTNOHAND;
 	}

--===============18010745717880661==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18010745717880661==--

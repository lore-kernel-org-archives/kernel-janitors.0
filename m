From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 24 Jan 2005 15:41:11 +0000
Subject: [KJ] [PATCH] unified spinlock initialization drivers/block/DAC960.c
Message-Id: <200501242059.16604.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95654966187575874=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============95654966187575874==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/drivers/block/DAC960.c	2005-01-19 11:19:25.000000000 +0530
+++ linux-2.6.10/drivers/block/DAC960.c	2005-01-24 19:31:13.000000000 +0530
@@ -2738,7 +2738,7 @@ DAC960_DetectController(struct pci_dev *
   }
   init_waitqueue_head(&Controller->CommandWaitQueue);
   init_waitqueue_head(&Controller->HealthStatusWaitQueue);
-  Controller->queue_lock = SPIN_LOCK_UNLOCKED; 
+  spin_lock_init(&Controller->queue_lock); 
   DAC960_AnnounceDriver(Controller);
   /*
     Map the Controller Register Window.


--===============95654966187575874==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95654966187575874==--

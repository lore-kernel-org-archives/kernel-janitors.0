From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 24 Jan 2005 15:48:53 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501242106.55137.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38738666844807446=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============38738666844807446==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- vanilla-2.6.10/drivers/char/drm/drm_drv.h	2005-01-19 11:19:25.000000000 +0530
+++ linux-2.6.10/drivers/char/drm/drm_drv.h	2005-01-24 20:09:35.000000000 +0530
@@ -447,7 +447,7 @@ static int DRM(probe)(struct pci_dev *pd
 	dev = &(DRM(device)[DRM(numdevs)]);
 
 	memset( (void *)dev, 0, sizeof(*dev) );
-	dev->count_lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&dev->count_lock);
 	init_timer( &dev->timer );
 	sema_init( &dev->struct_sem, 1 );
 	sema_init( &dev->ctxlist_sem, 1 );


--===============38738666844807446==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38738666844807446==--

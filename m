From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 24 Jan 2005 15:42:58 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501242100.59366.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13167623003315621=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============13167623003315621==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

--- vanilla-2.6.10/drivers/char/drm/drm_auth.h	2004-10-19 03:25:07.000000000 +0530
+++ linux-2.6.10/drivers/char/drm/drm_auth.h	2005-01-24 20:07:39.000000000 +0530
@@ -174,11 +174,12 @@ int DRM(getmagic)(struct inode *inode, s
 		  unsigned int cmd, unsigned long arg)
 {
 	static drm_magic_t sequence = 0;
-	static spinlock_t  lock	    = SPIN_LOCK_UNLOCKED;
+	static spinlock_t  lock;
 	drm_file_t	   *priv    = filp->private_data;
 	drm_device_t	   *dev	    = priv->dev;
 	drm_auth_t	   auth;
-
+	
+	spin_lock_init(&lock);
 				/* Find unique magic */
 	if (priv->magic) {
 		auth.magic = priv->magic;


--===============13167623003315621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13167623003315621==--

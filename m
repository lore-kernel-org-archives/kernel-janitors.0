From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 25 Jan 2005 07:07:21 +0000
Subject: [KJ] [PATCH] Unified spinlock initialization
Message-Id: <20050125070721.GC7452@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IpbVkmxF4tDyP/Kb"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unified spinlock initialization.

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="skystar2-unified-spinlock.patch"

diff -urB linux-2.6.10-vanilla/drivers/media/dvb/b2c2/skystar2.c linux-2.6.10/drivers/media/dvb/b2c2/skystar2.c
--- linux-2.6.10-vanilla/drivers/media/dvb/b2c2/skystar2.c	2005-01-24 17:07:56.000000000 +0100
+++ linux-2.6.10/drivers/media/dvb/b2c2/skystar2.c	2005-01-24 20:40:35.000000000 +0100
@@ -1979,7 +1979,7 @@
 		ctrl_enable_mac(adapter, 1);
 	}
 
-	adapter->lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&adapter->lock);
 
 	return 0;
 }

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--IpbVkmxF4tDyP/Kb--

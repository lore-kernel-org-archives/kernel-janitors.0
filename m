From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Tue, 12 Jul 2005 01:37:17 +0000
Subject: Re: [KJ] [PATCH] cli() cleanup in xircom_tulip_cp.c and fec.c
Message-Id: <1121132237.3554.56.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============097664800095922155=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121121132.3554.50.camel@localhost>
In-Reply-To: <1121121132.3554.50.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============097664800095922155==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Please discard the previous patch.  I'm going to take these one at a
time.  Here's a patch for the fec code, it also makes some global
variables that aren't used anywhere or declared in a header static.

Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>

diff -pruNX anti-cli/Documentation/dontdiff linux-pristine/drivers/net/fec.c anti-cli/drivers/net/fec.c
--- linux-pristine/drivers/net/fec.c	2005-06-17 15:48:29.000000000 -0400
+++ anti-cli/drivers/net/fec.c	2005-07-11 21:29:38.000000000 -0400
@@ -237,10 +237,11 @@ typedef struct mii_list {
 } mii_list_t;
 
 #define		NMII	20
-mii_list_t	mii_cmds[NMII];
-mii_list_t	*mii_free;
-mii_list_t	*mii_head;
-mii_list_t	*mii_tail;
+static mii_list_t	mii_cmds[NMII];
+static mii_list_t	*mii_free;
+static mii_list_t	*mii_head;
+static mii_list_t	*mii_tail;
+static DECLARE_SPINLOCK(mii_lock);
 
 static int	mii_queue(struct net_device *dev, int request, 
 				void (*func)(uint, struct net_device *));
@@ -679,10 +680,13 @@ fec_enet_mii(struct net_device *dev)
 	volatile fec_t	*ep;
 	mii_list_t	*mip;
 	uint		mii_reg;
+	unsigned long	flags;
 
 	fep = netdev_priv(dev);
 	ep = fep->hwp;
 	mii_reg = ep->fec_mii_data;
+
+	spin_lock_irqsave(&mii_lock, flags);
 	
 	if ((mip = mii_head) == NULL) {
 		printk("MII and no head!\n");
@@ -698,6 +702,8 @@ fec_enet_mii(struct net_device *dev)
 
 	if ((mip = mii_head) != NULL)
 		ep->fec_mii_data = mip->mii_regval;
+
+	spin_unlock_irqrestore(&mii_lock, flags);
 }
 
 static int
@@ -715,8 +721,7 @@ mii_queue(struct net_device *dev, int re
 
 	retval = 0;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&mii_lock, flags);
 
 	if ((mip = mii_free) != NULL) {
 		mii_free = mip->mii_next;
@@ -736,7 +741,7 @@ mii_queue(struct net_device *dev, int re
 		retval = 1;
 	}
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&mii_lock, flags);
 
 	return(retval);
 }



--===============097664800095922155==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============097664800095922155==--

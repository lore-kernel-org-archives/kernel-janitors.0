From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Feb 2006 22:02:20 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/mtd/
Message-Id: <1139349741.30830.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82299817941052611=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============82299817941052611==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git2/drivers/mtd/mtd_blkdevs.c.orig	2006-02-07 22:55:07.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/mtd/mtd_blkdevs.c	2006-02-07 22:56:37.000000000 +0100
@@ -450,8 +450,7 @@ int deregister_mtd_blktrans(struct mtd_b
 
 	kfree(tr->blkcore_priv);
 
-	if (!list_empty(&tr->devs))
-		BUG();
+	BUG_ON(!list_empty(&tr->devs));
 	return 0;
 }
 
--- linux-2.6.16-rc2-git2/drivers/mtd/maps/dilnetpc.c.orig	2006-02-07 22:56:46.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/mtd/maps/dilnetpc.c	2006-02-07 22:57:23.000000000 +0100
@@ -218,8 +218,8 @@ static void dnp_set_vpp(struct map_info 
 	{
 		if(--vpp_counter == 0)
 			setcsc(CSC_RBWR, getcsc(CSC_RBWR) | 0x4);
-		else if(vpp_counter < 0)
-			BUG();
+		else
+			BUG_ON(vpp_counter < 0);
 	}
 	spin_unlock_irq(&dnpc_spin);
 }
@@ -240,8 +240,8 @@ static void adnp_set_vpp(struct map_info
 	{
 		if(--vpp_counter == 0)
 			setcsc(CSC_RBWR, getcsc(CSC_RBWR) | 0x8);
-		else if(vpp_counter < 0)
-			BUG();
+		else
+			BUG_ON(vpp_counter < 0);
 	}
 	spin_unlock_irq(&dnpc_spin);
 }
--- linux-2.6.16-rc2-git2/drivers/mtd/mtdconcat.c.orig	2006-02-07 22:58:05.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/mtd/mtdconcat.c	2006-02-07 22:58:25.000000000 +0100
@@ -477,8 +477,7 @@ static int concat_erase(struct mtd_info 
 	}
 
 	/* must never happen since size limit has been verified above */
-	if (i >= concat->num_subdev)
-		BUG();
+	BUG_ON(i >= concat->num_subdev);
 
 	/* now do the erase: */
 	err = 0;
@@ -500,8 +499,7 @@ static int concat_erase(struct mtd_info 
 		if ((err = concat_dev_erase(subdev, erase))) {
 			/* sanity check: should never happen since
 			 * block alignment has been checked above */
-			if (err == -EINVAL)
-				BUG();
+			BUG_ON(err == -EINVAL);
 			if (erase->fail_addr != 0xffffffff)
 				instr->fail_addr = erase->fail_addr + offset;
 			break;



--===============82299817941052611==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82299817941052611==--

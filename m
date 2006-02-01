From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 00:28:16 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/video/
Message-Id: <1138753696.9742.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94052727893228227=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============94052727893228227==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/video/bw2.c.orig	2006-01-31 21:40:21.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/video/bw2.c	2006-01-31 21:40:38.000000000 +0100
@@ -327,8 +327,7 @@ static void bw2_init_one(struct sbus_dev
 	} else
 #else
 	{
-		if (!sdev)
-			BUG();
+		BUG_ON(!sdev);
 		all->par.physbase = sdev->reg_addrs[0].phys_addr;
 		resp = &sdev->resource[0];
 		sbusfb_fill_var(&all->info.var, (sdev ? sdev->prom_node : 0), 1);
--- linux-2.6.16-rc1-git4/drivers/video/ffb.c.orig	2006-01-31 21:41:06.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/video/ffb.c	2006-01-31 21:41:21.000000000 +0100
@@ -466,8 +466,7 @@ static void ffb_fillrect(struct fb_info 
 	unsigned long flags;
 	u32 fg;
 
-	if (rect->rop != ROP_COPY && rect->rop != ROP_XOR)
-		BUG();
+	BUG_ON(rect->rop != ROP_COPY && rect->rop != ROP_XOR);
 
 	fg = ((u32 *)info->pseudo_palette)[rect->color];
 



--===============94052727893228227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94052727893228227==--

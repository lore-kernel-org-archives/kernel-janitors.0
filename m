From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:42 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/nubus
Message-Id: <1141592562.17717.17.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96191302429035508=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============96191302429035508==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/nubus/ to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/nubus/nubus.c.orig	2006-03-05 16:04:52.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/nubus/nubus.c	2006-03-05 16:05:10.000000000 +0100
@@ -467,9 +467,8 @@ static struct nubus_dev* __init
 		       parent->base, dir.base);
 
 	/* Actually we should probably panic if this fails */
-	if ((dev = kmalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
+	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
 		return NULL;	
-	memset(dev, 0, sizeof(*dev));
 	dev->resid = parent->type;
 	dev->directory = dir.base;
 	dev->board = board;
@@ -801,9 +800,8 @@ static struct nubus_board* __init nubus_
 	nubus_rewind(&rp, FORMAT_BLOCK_SIZE, bytelanes);
 
 	/* Actually we should probably panic if this fails */
-	if ((board = kmalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
+	if ((board = kzalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
 		return NULL;	
-	memset(board, 0, sizeof(*board));
 	board->fblock = rp;
 
 	/* Dump the format block for debugging purposes */



--===============96191302429035508==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96191302429035508==--

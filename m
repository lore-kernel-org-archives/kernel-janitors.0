From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 21:02:51 +0000
Subject: [KJ] [Patch 3/3] BUG_ON() Conversion in net/tulip/xircom_cb.c
Message-Id: <1138309371.26201.8.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39188033188017357=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39188033188017357==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/net/tulip/xircom_cb.c.orig	2006-01-26 20:33:27.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/net/tulip/xircom_cb.c	2006-01-26 20:33:45.000000000 +0100
@@ -598,10 +598,8 @@ static void setup_descriptors(struct xir
 	enter("setup_descriptors");
 
 
-	if (card->rx_buffer == NULL)
-		BUG();
-	if (card->tx_buffer == NULL)
-		BUG();
+	BUG_ON(card->rx_buffer == NULL);
+	BUG_ON(card->tx_buffer == NULL);
 
 	/* Receive descriptors */
 	memset(card->rx_buffer, 0, 128);	/* clear the descriptors */



--===============39188033188017357==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39188033188017357==--

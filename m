From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 12:12:49 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/arm26
Message-Id: <1141733570.8665.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6827614452150752=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============6827614452150752==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/ppc to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/arm26/kernel/ecard.c.orig	2006-03-07 12:31:09.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm26/kernel/ecard.c	2006-03-07 12:31:18.000000000 +0100
@@ -621,12 +621,10 @@ ecard_probe(int slot, card_type_t type)
 	struct ex_ecid cid;
 	int i, rc = -ENOMEM;
 
-	ec = kmalloc(sizeof(ecard_t), GFP_KERNEL);
+	ec = kzalloc(sizeof(ecard_t), GFP_KERNEL);
 	if (!ec)
 		goto nomem;
 
-	memset(ec, 0, sizeof(ecard_t));
-
 	ec->slot_no	= slot;
 	ec->type        = type;
 	ec->irq		= NO_IRQ;



--===============6827614452150752==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6827614452150752==--

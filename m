From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 17 Jan 2006 21:25:16 +0000
Subject: [KJ] [Patch] change if() BUG();
Message-Id: <1137533116.20230.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43778880505972428=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43778880505972428==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes the if() BUG(); construct in
drivers/ieee1394/cmp.c to a BUG_ON; so defining
BUG to a no-op is safe.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git11/drivers/ieee1394/cmp.c.orig	2006-01-17 22:11:13.000000000 +0100
+++ linux-2.6.15-git11/drivers/ieee1394/cmp.c	2006-01-17 22:11:29.000000000 +0100
@@ -129,7 +129,7 @@ void cmp_unregister_opcr(struct hpsb_hos
 
 	ch = hpsb_get_hostinfo(&cmp_highlevel, host);
 	plug = (struct plug *)opcr;
-	if (plug - ch->opcr >= ch->u.ompr.nplugs) BUG();
+	BUG_ON(plug - ch->opcr >= ch->u.ompr.nplugs);
 
 	plug->u.pcr.online = 0;
 	plug->update = NULL;



--===============43778880505972428==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43778880505972428==--

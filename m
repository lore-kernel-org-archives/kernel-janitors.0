From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:03:18 +0000
Subject: [KJ] [PATCH] drivers/atm/zatm.c: fix sparse warning
Message-Id: <200503100156.52582.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43972777159272392=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43972777159272392==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/drivers/atm/zatm.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/drivers/atm/zatm.c	2005-03-02 09:37:50.000000000 +0200
+++ linux-2.6.11-bk3-sparse/drivers/atm/zatm.c	2005-03-08 15:01:25.000000000 +0200
@@ -411,7 +411,7 @@ printk("[-3..0] 0x%08lx 0x%08lx 0x%08lx 
 #if 0
 printk("dummy: 0x%08lx, 0x%08lx\n",dummy[0],dummy[1]);
 #endif
-		size = error ? 0 : ntohs(((u16 *) skb->data)[cells*
+		size = error ? 0 : ntohs(((__be16 *) skb->data)[cells*
 		    ATM_CELL_PAYLOAD/sizeof(u16)-3]);
 		EVENT("got skb 0x%lx, size %d\n",(unsigned long) skb,size);
 		chan = (here[3] & uPD98401_AAL5_CHAN) >>

--===============43972777159272392==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43972777159272392==--

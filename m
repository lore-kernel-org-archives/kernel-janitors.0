From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 28 Mar 2005 17:23:47 +0000
Subject: [KJ] [PATCH] serial/icom: Remove custom msescs_to_jiffies() macro
Message-Id: <20050328171945.GA3568@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10028142776071802=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-serial@vger.kernel.org

--===============10028142776071802==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the MSECS_TO_JIFFIES() macro because msescs_to_jiffies() from
jiffies.h should be used. The macro isn't referenced anywhere anyway.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/serial/icom.h linux-2.6.11/drivers/serial/icom.h
--- linux-2.6.11.orig/drivers/serial/icom.h	2005-03-02 12:50:31.000000000 +0100
+++ linux-2.6.11/drivers/serial/icom.h	2005-03-23 13:52:24.485557392 +0100
@@ -286,5 +286,3 @@ struct lookup_int_table {
 	u32	__iomem *global_int_mask;
 	unsigned long	processor_id;
 };
-
-#define MSECS_TO_JIFFIES(ms) (((ms)*HZ+999)/1000)

--===============10028142776071802==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10028142776071802==--

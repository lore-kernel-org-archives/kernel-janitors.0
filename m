From: Chuck Short <zulcss@gmail.com>
Date: Mon, 30 May 2005 02:08:03 +0000
Subject: [KJ] [PATCH] - nicstar gcc 4 warnings
Message-Id: <429A7583.4010201@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050900030003040202080601"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050900030003040202080601
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch fixes gcc4 warnings when compiling the nicstar driver.

Signed-off by: Chuck Short <zulcss@gmail.com>


--------------050900030003040202080601
Content-Type: text/x-patch;
 name="atm_nicstar_gcc4-warnings.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="atm_nicstar_gcc4-warnings.patch"

diff -Naur linux-source-2.6.12-2.6.11.93.orig/drivers/atm/nicstar.c linux-source-2.6.12-2.6.11.93/drivers/atm/nicstar.c
--- linux-source-2.6.12-2.6.11.93.orig/drivers/atm/nicstar.c	2005-04-07 08:57:14.000000000 -0400
+++ linux-source-2.6.12-2.6.11.93/drivers/atm/nicstar.c	2005-05-29 14:34:12.123970048 -0400
@@ -2111,7 +2111,7 @@
 
 static void process_rsq(ns_dev *card)
 {
-   ns_rsqe *previous;
+   ns_rsqe *previous = NULL;
 
    if (!ns_rsqe_valid(card->rsq.next))
       return;

--------------050900030003040202080601
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050900030003040202080601--

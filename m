From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 11:00:03 +0000
Subject: [KJ][Patch] make storage class first in pwc-kiara.h
Message-Id: <1140174003.7789.14.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17512110803633574=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17512110803633574==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

ICC complains about : Remark #82: Storage Class is not First.

http://linuxicc.sourceforge.net/

@ line 40 & 41 of pwc-kiara.h.

The patch below re-orders the modifiers to make extern before const.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-kiara.h.orig	2006-02-17 21:47:21.000000000 +1100
+++ linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-kiara.h	2006-02-17 21:47:30.000000000 +1100
@@ -37,8 +37,8 @@ struct Kiara_table_entry
 	unsigned char mode[12];		/* precomputed mode settings for cam */
 };
 
-const extern struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
-const extern unsigned int KiaraRomTable[8][2][16][8];
+extern const struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
+extern const unsigned int KiaraRomTable[8][2][16][8];
 
 #endif
 



--===============17512110803633574==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17512110803633574==--

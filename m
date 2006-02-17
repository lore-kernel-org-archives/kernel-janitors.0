From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 11:43:00 +0000
Subject: [KJ][Patch] make storage class first in pwc-timon.h
Message-Id: <1140176580.7789.25.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86879751416226481=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============86879751416226481==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

from http://linuxicc.sourceforge.net/

ICC complains about : Storage Class is not First

@ line 55 & 56 of pwc-timon.h

This patch just re-orders the modifiers to ensure extern is first

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-timon.h.orig	2006-02-17 22:29:16.000000000 +1100
+++ linux-2.6.16-rc3/drivers/usb/media/pwc/pwc-timon.h	2006-02-17 22:29:50.000000000 +1100
@@ -52,8 +52,8 @@ struct Timon_table_entry
 	unsigned char mode[13];		/* precomputed mode settings for cam */
 };
 
-const extern struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
-const extern unsigned int TimonRomTable [16][2][16][8];
+extern const struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
+extern const unsigned int TimonRomTable [16][2][16][8];
 
 
 #endif



--===============86879751416226481==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86879751416226481==--

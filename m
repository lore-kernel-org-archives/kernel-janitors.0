From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 00:05:49 +0000
Subject: [KJ] [Patch] Check unsigned < 0 in /drivers/net/acenic.c
Message-Id: <1134691549.14588.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91183444102608657=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91183444102608657==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since read_eeprom_byte() returns a negative value on an error
condition, tmp should be signed so the comparisons in line 1007
and 1017 can catch the error. 

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/acenic.c.orig	2005-12-16 01:01:44.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/acenic.c	2005-12-16 01:01:58.000000000 +0100
@@ -905,7 +905,8 @@ static int __devinit ace_init(struct net
 	struct pci_dev *pdev;
 	unsigned long myjif;
 	u64 tmp_ptr;
-	u32 tig_ver, mac1, mac2, tmp, pci_state;
+	u32 tig_ver, mac1, mac2, pci_state;
+	int tmp;
 	int board_idx, ecode = 0;
 	short i;
 	unsigned char cache_size;



--===============91183444102608657==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91183444102608657==--

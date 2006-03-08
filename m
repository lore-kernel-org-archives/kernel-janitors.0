From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Mar 2006 01:52:57 +0000
Subject: [KJ][Patch] fix array over-run in efi.c
Message-Id: <1141782778.8503.22.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============052036443420781398=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============052036443420781398==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list.

Coverity found an over-run @ line 364 of efi.c

This is due to the loop checking the size correctly, then adding a '\0'
after possibly hitting the end of the array.

The patch below just ensures the loop exits with one space left in the
array.

Compile tested.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/arch/i386/kernel/efi.c.orig	2006-03-08 12:31:14.000000000 +1100
+++ linux-2.6.16-rc5/arch/i386/kernel/efi.c	2006-03-08 12:37:59.000000000 +1100
@@ -359,7 +359,7 @@ void __init efi_init(void)
 	 */
 	c16 = (efi_char16_t *) boot_ioremap(efi.systab->fw_vendor, 2);
 	if (c16) {
-		for (i = 0; i < sizeof(vendor) && *c16; ++i)
+		for (i = 0; i < (sizeof(vendor) - 1) && *c16; ++i)
 			vendor[i] = *c16++;
 		vendor[i] = '\0';
 	} else



--===============052036443420781398==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============052036443420781398==--

From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:29:56 +0000
Subject: [KJ] [patch 4/8] ifdef typos: drivers_char_ipmi_ipmi_si_intf.c
Message-Id: <20041124152956.GD14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98351316423883794=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98351316423883794==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CONFIG_ACPI_INTERPETER is wrong.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/char/ipmi/ipmi_si_intf.c	2004-11-15 13:42:10.000000000 +0100
+++ str2/drivers/char/ipmi/ipmi_si_intf.c	2004-11-24 14:44:44.000000000 +0100
@@ -959,7 +959,7 @@ MODULE_PARM_DESC(regshifts, "The amount 
 #define IPMI_MEM_ADDR_SPACE 1
 #define IPMI_IO_ADDR_SPACE  2
 
-#if defined(CONFIG_ACPI_INTERPETER) || defined(CONFIG_X86) || defined(CONFIG_PCI)
+#if defined(CONFIG_ACPI_INTERPRETER) || defined(CONFIG_X86) || defined(CONFIG_PCI)
 static int is_new_interface(int intf, u8 addr_space, unsigned long base_addr)
 {
 	int i;

--===============98351316423883794==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98351316423883794==--

From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:29 +0000
Subject: [KJ] [PATCH][6/26] drivers/isdn/hisax/* - compile warning cleanup
Message-Id: <420BEF85.4614.5879D7@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43959150292230875=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43959150292230875==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns, add MODULE definition compile fence so MODULE_DEVICE_TABLE vars 
not declared when compiled into the kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/isdn/hisax/config.c linux-2.6.11-rc3-mm/drivers/isdn/hisax/config.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/hisax/config.c	2005-02-03 03:56:47.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/hisax/config.c	2005-02-07 20:47:02.000000000 +0200
@@ -631,7 +631,11 @@ int HiSax_readstatus(u_char __user *buf,
 		count = cs->status_end - cs->status_read + 1;
 		if (count >= len)
 			count = len;
-		copy_to_user(p, cs->status_read, count);
+		if(copy_to_user(p, cs->status_read, count)) {
+			printk(KERN_ERR
+				"HiSax: copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		cs->status_read += count;
 		if (cs->status_read > cs->status_end)
 			cs->status_read = cs->status_buf;
@@ -642,7 +646,11 @@ int HiSax_readstatus(u_char __user *buf,
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs->status_read, cnt);
+			if(copy_to_user(p, cs->status_read, cnt)) {
+				printk(KERN_ERR
+					"HiSax: copy_to_user failed!\n");
+				return -EFAULT;
+			}
 			p += cnt;
 			cs->status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;
@@ -1878,6 +1886,7 @@ static void EChannel_proc_rcv(struct his
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
 
+#ifdef MODULE
 static struct pci_device_id hisax_pci_tbl[] __initdata = {
 #ifdef CONFIG_HISAX_FRITZPCI
 	{PCI_VENDOR_ID_AVM,      PCI_DEVICE_ID_AVM_A1,           PCI_ANY_ID, PCI_ANY_ID},
@@ -1944,6 +1953,7 @@ static struct pci_device_id hisax_pci_tb
 };
 
 MODULE_DEVICE_TABLE(pci, hisax_pci_tbl);
+#endif /* MODULE */
 #endif /* CONFIG_PCI */
 
 module_init(HiSax_init);




--===============43959150292230875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43959150292230875==--

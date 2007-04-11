From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Wed, 11 Apr 2007 06:50:05 +0000
Subject: [KJ] [PATCH] include KERN_* constant in printk() calls in
Message-Id: <20070411065005.GI24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070409194151.GG4262@traven>
In-Reply-To: <20070409194151.GG4262@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

include KERN_* constant in printk() calls in arch/i386/mach-default/setup.c

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
 
---
diff --git a/arch/i386/mach-default/setup.c b/arch/i386/mach-default/setup.c
index c788162..f1891b6 100644
--- a/arch/i386/mach-default/setup.c
+++ b/arch/i386/mach-default/setup.c
@@ -115,15 +115,15 @@ void mca_nmi_hook(void)
 	 * at the moment.
 	 */
 
-	printk("NMI generated from unknown source!\n");
+	printk(KERN_WARNING "NMI generated from unknown source!\n");
 }
 #endif
 
 static __init int no_ipi_broadcast(char *str)
 {
 	get_option(&str, &no_broadcast);
-	printk ("Using %s mode\n", no_broadcast ? "No IPI Broadcast" :
-											"IPI Broadcast");
+	printk(KERN_INFO "Using %s mode\n",
+	       no_broadcast ? "No IPI Broadcast" : "IPI Broadcast");
 	return 1;
 }
 
@@ -131,8 +131,8 @@ __setup("no_ipi_broadcast", no_ipi_broadcast);
 
 static int __init print_ipi_mode(void)
 {
-	printk ("Using IPI %s mode\n", no_broadcast ? "No-Shortcut" :
-											"Shortcut");
+	printk(KERN_INFO "Using IPI %s mode\n",
+	       no_broadcast ? "No-Shortcut" : "Shortcut");
 	return 0;
 }
 

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

              Comunicar bichos a <bug-coreutils@gnu.org>
                     (LANG=es_ES uname --help)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

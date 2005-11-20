From: Witold Rugowski <rugowski@nhw.pl>
Date: Sun, 20 Nov 2005 10:57:40 +0000
Subject: Re: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <438056A4.8000302@nhw.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437E8107.2000103@nhw.pl>
In-Reply-To: <437E8107.2000103@nhw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nish Aravamudan wrote:
> Missing spaces?

Yes. But that was my first time ;-)) so - improved patch version follows:

--- linux-2.6.14.2/sound/oss/maestro3.c	Fri Nov 11 06:33:12 2005
+++ linux-2.6.14.2-wr/sound/oss/maestro3.c	Sun Nov 20 11:10:28 2005
@@ -2935,7 +2935,8 @@ static struct pci_driver m3_pci_driver  
 static int __init m3_init_module(void)
 {
-    printk(KERN_INFO PFX "version " DRIVER_VERSION " built at " __TIME__ " " __DATE__ "\n");
+    printk(KERN_INFO "%sversion %s built at %s %s\n", PFX, DRIVER_VERSION,
+                      __TIME__, __DATE__);
 
     if (register_reboot_notifier(&m3_reboot_nb)) {
         printk(KERN_WARNING PFX "reboot notifier registration failed\n");

-- 
Witold Rugowski
rugowski _at_ nhw.pl http://nhw.pl/blg/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:03:24 +0000
Subject: [KJ] [PATC] printk : arch/arm/mach-footbridge/netwinder-hw.c
Message-Id: <20060515100324.GG12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============097143466954198843=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============097143466954198843==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.16.16/arch/arm/mach-footbridge/netwinder-hw.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-footbridge/netwinder-hw.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-footbridge/netwinder-hw.c	2006-05-15 11:54:28.000000000 +0200
@@ -548,7 +548,7 @@
 		mdelay(1);
 	}
 	if (i == 5)
-		printk("SoundBlaster: DSP reset failed\n");
+		printk(KERN_WARNING "SoundBlaster: DSP reset failed\n");
 
 	dprintk("SoundBlaster DSP reset: %02X (AA)\n", inb(0x22a));
 
@@ -559,7 +559,7 @@
 	}
 
 	if (i == 5)
-		printk("SoundBlaster: DSP not ready\n");
+		printk(KERN_WARNING "SoundBlaster: DSP not ready\n");
 	else {
 		outb(0xe1, 0x22c);
 
@@ -576,7 +576,7 @@
 		}
 
 		if (i == 5)
-			printk("SoundBlaster: could not turn speaker off\n");
+			printk(KERN_WARNING "SoundBlaster: could not turn speaker off\n");
 
 		outb(0xd3, 0x22c);
 	}

--===============097143466954198843==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============097143466954198843==--

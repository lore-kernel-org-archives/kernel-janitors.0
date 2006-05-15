From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:20:05 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-ixp4xx/common.c
Message-Id: <20060515102005.GJ12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============061457766360094368=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============061457766360094368==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-ixp4xx/common.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-ixp4xx/common.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-ixp4xx/common.c	2006-05-15 12:00:26.000000000 +0200
@@ -359,7 +359,7 @@
 		}
 	}
 
-	printk("IXP4xx: Using %luMiB expansion bus window size\n",
+	printk(KERN_INFO "IXP4xx: Using %luMiB expansion bus window size\n",
 			ixp4xx_exp_bus_size >> 20);
 }
 

--===============061457766360094368==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============061457766360094368==--

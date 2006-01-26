From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 26 Jan 2006 11:50:33 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-footbridge/dc21285.c
Message-Id: <20060126115033.GJ8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38828719426406932=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060126114939.GI8401@rotomalug.org>
In-Reply-To: <20060126114939.GI8401@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============38828719426406932==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).


Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/mach-footbridge/dc21285.c
===================================================================
--- linux-2.6.15.orig/arch/arm/mach-footbridge/dc21285.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/mach-footbridge/dc21285.c	2006-01-26 12:39:37.000000000 +0100
@@ -257,7 +257,7 @@
 
 	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
 	if (!res) {
-		printk("out of memory for root bus resources");
+		printk(KERN_EMERG "out of memory for root bus resources");
 		return 0;
 	}
 

--===============38828719426406932==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38828719426406932==--

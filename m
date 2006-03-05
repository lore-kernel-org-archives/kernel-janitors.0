From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:38 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/pnp
Message-Id: <1141592559.17717.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85789161128602265=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============85789161128602265==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/pnp/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/pnp/core.c.orig	2006-03-05 16:06:10.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/pnp/core.c	2006-03-05 16:06:32.000000000 +0100
@@ -26,12 +26,11 @@ void *pnp_alloc(long size)
 {
 	void *result;
 
-	result = kmalloc(size, GFP_KERNEL);
+	result = kzalloc(size, GFP_KERNEL);
 	if (!result){
 		printk(KERN_ERR "pnp: Out of Memory\n");
 		return NULL;
 	}
-	memset(result, 0, size);
 	return result;
 }
 



--===============85789161128602265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85789161128602265==--

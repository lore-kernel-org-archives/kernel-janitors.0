From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 12:12:52 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/m68k
Message-Id: <1141733572.8665.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43059696604445685=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============43059696604445685==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts arch/m64k to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/m68k/amiga/chipram.c.orig	2006-03-07 12:32:58.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/m68k/amiga/chipram.c	2006-03-07 12:33:05.000000000 +0100
@@ -53,10 +53,9 @@ void *amiga_chip_alloc(unsigned long siz
 #ifdef DEBUG
     printk("amiga_chip_alloc: allocate %ld bytes\n", size);
 #endif
-    res = kmalloc(sizeof(struct resource), GFP_KERNEL);
+    res = kzalloc(sizeof(struct resource), GFP_KERNEL);
     if (!res)
 	return NULL;
-    memset(res, 0, sizeof(struct resource));
     res->name = name;
 
     if (allocate_resource(&chipram_res, res, size, 0, UINT_MAX, PAGE_SIZE, NULL, NULL) < 0) {
--- linux-2.6.16-rc5-mm1/arch/m68k/atari/hades-pci.c.orig	2006-03-07 12:33:14.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/m68k/atari/hades-pci.c	2006-03-07 12:33:21.000000000 +0100
@@ -376,10 +376,9 @@ struct pci_bus_info * __init init_hades_
 	 * Allocate memory for bus info structure.
 	 */
 
-	bus = kmalloc(sizeof(struct pci_bus_info), GFP_KERNEL);
+	bus = kzalloc(sizeof(struct pci_bus_info), GFP_KERNEL);
 	if (!bus)
 		return NULL;
-	memset(bus, 0, sizeof(struct pci_bus_info));
 
 	/*
 	 * Claim resources. The m68k has no separate I/O space, both



--===============43059696604445685==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43059696604445685==--

From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:16:29 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/ieee1394
Message-Id: <1161634589.419.5.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/ieee1394/nodemgr.c.orig	2006-10-23 21:04:32.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/ieee1394/nodemgr.c	2006-10-23 21:05:07.000000000 +0200
@@ -976,10 +976,9 @@ static struct unit_directory *nodemgr_pr
 			/* Logical Unit Number */
 			if (kv->key.type = CSR1212_KV_TYPE_IMMEDIATE) {
 				if (ud->flags & UNIT_DIRECTORY_HAS_LUN) {
-					ud_child = kmalloc(sizeof(*ud_child), GFP_KERNEL);
+					ud_child = kmemdup(ud, sizeof(*ud_child), GFP_KERNEL);
 					if (!ud_child)
 						goto unit_directory_error;
-					memcpy(ud_child, ud, sizeof(*ud_child));
 					nodemgr_register_device(ne, ud_child, &ne->device);
 					ud_child = NULL;
 					
--- linux-2.6.19-rc2-git7/drivers/ieee1394/pcilynx.c.orig	2006-10-23 21:05:17.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/ieee1394/pcilynx.c	2006-10-23 21:05:55.000000000 +0200
@@ -1428,10 +1428,9 @@ static int __devinit add_card(struct pci
         	struct i2c_algo_bit_data i2c_adapter_data;
 
         	error = -ENOMEM;
-		i2c_ad = kmalloc(sizeof(*i2c_ad), SLAB_KERNEL);
+		i2c_ad = kmemdup(&bit_ops, sizeof(*i2c_ad), SLAB_KERNEL);
         	if (!i2c_ad) FAIL("failed to allocate I2C adapter memory");
 
-		memcpy(i2c_ad, &bit_ops, sizeof(struct i2c_adapter));
                 i2c_adapter_data = bit_data;
                 i2c_ad->algo_data = &i2c_adapter_data;
                 i2c_adapter_data.data = lynx;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

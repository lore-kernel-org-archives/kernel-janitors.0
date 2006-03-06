From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 20:13:32 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/ppc
Message-Id: <1141676012.6349.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96069637916872375=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============96069637916872375==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/ppc to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/ppc/syslib/ocp.c.orig	2006-03-06 21:03:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ppc/syslib/ocp.c	2006-03-06 21:03:14.000000000 +0100
@@ -451,10 +451,9 @@ ocp_driver_init(void)
 	DBG(("ocp: ocp_driver_init()...\n"));
 
 	/* Allocate/register primary OCP bus */
-	ocp_bus = kmalloc(sizeof(struct device), GFP_KERNEL);
+	ocp_bus = kzalloc(sizeof(struct device), GFP_KERNEL);
 	if (ocp_bus == NULL)
 		return 1;
-	memset(ocp_bus, 0, sizeof(struct device));
 	strcpy(ocp_bus->bus_id, "ocp");
 
 	bus_register(&ocp_bus_type);
--- linux-2.6.16-rc5-mm1/arch/ppc/kernel/smp-tbsync.c.orig	2006-03-06 21:03:27.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ppc/kernel/smp-tbsync.c	2006-03-06 21:03:37.000000000 +0100
@@ -126,8 +126,7 @@ smp_generic_give_timebase( void )
 	printk("Synchronizing timebase\n");
 
 	/* if this fails then this kernel won't work anyway... */
-	tbsync = kmalloc( sizeof(*tbsync), GFP_KERNEL );
-	memset( tbsync, 0, sizeof(*tbsync) );
+	tbsync = kzalloc( sizeof(*tbsync), GFP_KERNEL );
 	mb();
 	running = 1;
 
--- linux-2.6.16-rc5-mm1/arch/ppc/4xx_io/serial_sicc.c.orig	2006-03-06 21:04:15.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ppc/4xx_io/serial_sicc.c	2006-03-06 21:04:24.000000000 +0100
@@ -1637,9 +1637,8 @@ static struct SICC_info *siccuart_get(in
     state->count++;
     if (state->info)
         return state->info;
-    info = kmalloc(sizeof(struct SICC_info), GFP_KERNEL);
+    info = kzalloc(sizeof(struct SICC_info), GFP_KERNEL);
     if (info) {
-        memset(info, 0, sizeof(struct SICC_info));
         init_waitqueue_head(&info->open_wait);
         init_waitqueue_head(&info->close_wait);
         init_waitqueue_head(&info->delta_msr_wait);
--- linux-2.6.16-rc5-mm1/arch/ppc/platforms/katana.c.orig	2006-03-06 21:04:45.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ppc/platforms/katana.c	2006-03-06 21:05:12.000000000 +0100
@@ -662,12 +662,11 @@ katana_setup_mtd(void)
 
 	ptbl_entries = (size >= (64*MB)) ? 6 : 4;
 
-	if ((ptbl = kmalloc(ptbl_entries * sizeof(struct mtd_partition),
+	if ((ptbl = kcalloc(ptbl_entries, sizeof(struct mtd_partition),
 			GFP_KERNEL)) == NULL) {
 		printk(KERN_WARNING "Can't alloc MTD partition table\n");
 		return -ENOMEM;
 	}
-	memset(ptbl, 0, ptbl_entries * sizeof(struct mtd_partition));
 
 	ptbl[0].name = "Monitor";
 	ptbl[0].size = KATANA_MTD_MONITOR_SIZE;
--- linux-2.6.16-rc5-mm1/arch/ppc/platforms/radstone_ppc7d.c.orig	2006-03-06 21:05:20.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ppc/platforms/radstone_ppc7d.c	2006-03-06 21:05:35.000000000 +0100
@@ -683,11 +683,10 @@ ppc7d_fixup_i2c_pdata(struct platform_de
 
 	pdata = pdev->dev.platform_data;
 	if (pdata == NULL) {
-		pdata = kmalloc(sizeof(*pdata), GFP_KERNEL);
+		pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
 		if (pdata == NULL)
 			return;
 
-		memset(pdata, 0, sizeof(*pdata));
 		pdev->dev.platform_data = pdata;
 	}
 



--===============96069637916872375==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96069637916872375==--

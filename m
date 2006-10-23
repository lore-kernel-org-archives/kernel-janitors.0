From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:21:13 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/parport
Message-Id: <1161634873.419.15.camel@alice>
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

--- linux-2.6.19-rc2-git7/drivers/parport/parport_sunbpp.c.orig	2006-10-23 21:28:36.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/parport/parport_sunbpp.c	2006-10-23 21:28:54.000000000 +0200
@@ -309,12 +309,10 @@ static int __devinit init_one_port(struc
 	size = sdev->reg_addrs[0].reg_size;
 	dma = PARPORT_DMA_NONE;
 
-	ops = kmalloc(sizeof(struct parport_operations), GFP_KERNEL);
+	ops = kmemdup(&parport_sunbpp_ops, sizeof(struct parport_operations), GFP_KERNEL);
         if (!ops)
 		goto out_unmap;
 
-        memcpy (ops, &parport_sunbpp_ops, sizeof (struct parport_operations));
-
 	dprintk(("register_port\n"));
 	if (!(p = parport_register_port((unsigned long)base, irq, dma, ops)))
 		goto out_free_ops;
--- linux-2.6.19-rc2-git7/drivers/parport/procfs.c.orig	2006-10-23 21:29:06.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/parport/procfs.c	2006-10-23 21:29:40.000000000 +0200
@@ -381,10 +381,9 @@ int parport_proc_register(struct parport
 	struct parport_sysctl_table *t;
 	int i;
 
-	t = kmalloc(sizeof(*t), GFP_KERNEL);
+	t = kmemdup(&parport_sysctl_template, sizeof(*t), GFP_KERNEL);
 	if (t = NULL)
 		return -ENOMEM;
-	memcpy(t, &parport_sysctl_template, sizeof(*t));
 
 	t->device_dir[0].extra1 = port;
 
@@ -429,10 +428,9 @@ int parport_device_proc_register(struct 
 	struct parport_device_sysctl_table *t;
 	struct parport * port = device->port;
 	
-	t = kmalloc(sizeof(*t), GFP_KERNEL);
+	t = kmemdup(&parport_device_sysctl_template, sizeof(*t), GFP_KERNEL);
 	if (t = NULL)
 		return -ENOMEM;
-	memcpy(t, &parport_device_sysctl_template, sizeof(*t));
 
 	t->dev_dir[0].child = t->parport_dir;
 	t->parport_dir[0].child = t->port_dir;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

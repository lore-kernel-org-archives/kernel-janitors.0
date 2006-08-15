From: Reiner Herrmann <reiner@reiner-h.de>
Date: Tue, 15 Aug 2006 18:25:48 +0000
Subject: [KJ] [PATCH] input/serio: kzalloc conversion
Message-Id: <200608152025.48838.reiner@reiner-h.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use kzalloc instead of kmalloc and zero-memset in drivers/input/serio/

Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
---
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/serio/ambakmi.c linux-work/drivers/input/serio/ambakmi.c
--- linux-2.6.18-rc4/drivers/input/serio/ambakmi.c	2006-06-18 03:49:35.000000000 +0200
+++ linux-work/drivers/input/serio/ambakmi.c	2006-08-15 19:57:47.000000000 +0200
@@ -117,16 +117,13 @@ static int amba_kmi_probe(struct amba_de
 	if (ret)
 		return ret;
 
-	kmi = kmalloc(sizeof(struct amba_kmi_port), GFP_KERNEL);
-	io = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	kmi = kzalloc(sizeof(struct amba_kmi_port), GFP_KERNEL);
+	io = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!kmi || !io) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	memset(kmi, 0, sizeof(struct amba_kmi_port));
-	memset(io, 0, sizeof(struct serio));
-
 	io->id.type	= SERIO_8042;
 	io->write	= amba_kmi_write;
 	io->open	= amba_kmi_open;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/serio/gscps2.c linux-work/drivers/input/serio/gscps2.c
--- linux-2.6.18-rc4/drivers/input/serio/gscps2.c	2006-08-13 16:30:17.000000000 +0200
+++ linux-work/drivers/input/serio/gscps2.c	2006-08-15 19:58:22.000000000 +0200
@@ -340,8 +340,8 @@ static int __init gscps2_probe(struct pa
 	if (dev->id.sversion = 0x96)
 		hpa += GSC_DINO_OFFSET;
 
-	ps2port = kmalloc(sizeof(struct gscps2port), GFP_KERNEL);
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	ps2port = kzalloc(sizeof(struct gscps2port), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!ps2port || !serio) {
 		ret = -ENOMEM;
 		goto fail_nomem;
@@ -349,8 +349,6 @@ static int __init gscps2_probe(struct pa
 
 	dev_set_drvdata(&dev->dev, ps2port);
 
-	memset(ps2port, 0, sizeof(struct gscps2port));
-	memset(serio, 0, sizeof(struct serio));
 	ps2port->port = serio;
 	ps2port->padev = dev;
 	ps2port->addr = ioremap_nocache(hpa, GSC_STATUS + 4);
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/serio/libps2.c linux-work/drivers/input/serio/libps2.c
--- linux-2.6.18-rc4/drivers/input/serio/libps2.c	2006-08-13 16:30:17.000000000 +0200
+++ linux-work/drivers/input/serio/libps2.c	2006-08-15 20:00:04.000000000 +0200
@@ -263,10 +263,10 @@ int ps2_schedule_command(struct ps2dev *
 	int send = (command >> 12) & 0xf;
 	int receive = (command >> 8) & 0xf;
 
-	if (!(ps2work = kmalloc(sizeof(struct ps2work) + max(send, receive), GFP_ATOMIC)))
+	ps2work = kzalloc(sizeof(struct ps2work) + max(send, receive), GFP_ATOMIC)
+	if (!ps2work)
 		return -1;
 
-	memset(ps2work, 0, sizeof(struct ps2work));
 	ps2work->ps2dev = ps2dev;
 	ps2work->command = command;
 	memcpy(ps2work->param, param, send);
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/serio/pcips2.c linux-work/drivers/input/serio/pcips2.c
--- linux-2.6.18-rc4/drivers/input/serio/pcips2.c	2006-08-13 16:30:17.000000000 +0200
+++ linux-work/drivers/input/serio/pcips2.c	2006-08-15 20:00:54.000000000 +0200
@@ -140,16 +140,13 @@ static int __devinit pcips2_probe(struct
 	if (ret)
 		goto disable;
 
-	ps2if = kmalloc(sizeof(struct pcips2_data), GFP_KERNEL);
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	ps2if = kzalloc(sizeof(struct pcips2_data), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!ps2if || !serio) {
 		ret = -ENOMEM;
 		goto release;
 	}
 
-	memset(ps2if, 0, sizeof(struct pcips2_data));
-	memset(serio, 0, sizeof(struct serio));
-
 	serio->id.type		= SERIO_8042;
 	serio->write		= pcips2_write;
 	serio->open		= pcips2_open;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/serio/sa1111ps2.c linux-work/drivers/input/serio/sa1111ps2.c
--- linux-2.6.18-rc4/drivers/input/serio/sa1111ps2.c	2006-06-18 03:49:35.000000000 +0200
+++ linux-work/drivers/input/serio/sa1111ps2.c	2006-08-15 20:01:13.000000000 +0200
@@ -234,16 +234,13 @@ static int ps2_probe(struct sa1111_dev *
 	struct serio *serio;
 	int ret;
 
-	ps2if = kmalloc(sizeof(struct ps2if), GFP_KERNEL);
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	ps2if = kzalloc(sizeof(struct ps2if), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!ps2if || !serio) {
 		ret = -ENOMEM;
 		goto free;
 	}
 
-	memset(ps2if, 0, sizeof(struct ps2if));
-	memset(serio, 0, sizeof(struct serio));
-
 	serio->id.type		= SERIO_8042;
 	serio->write		= ps2_write;
 	serio->open		= ps2_open;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:18:23 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/media/video
Message-Id: <1161634704.419.9.camel@alice>
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

--- linux-2.6.19-rc2-git7/drivers/media/video/ovcamchip/ovcamchip_core.c.orig	2006-10-23 21:13:43.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/media/video/ovcamchip/ovcamchip_core.c	2006-10-23 21:14:04.000000000 +0200
@@ -307,12 +307,11 @@ static int ovcamchip_attach(struct i2c_a
 		return -ENODEV;
 	}
 
-	c = kmalloc(sizeof *c, GFP_KERNEL);
+	c = kmemdup(&client_template, sizeof *c, GFP_KERNEL);
 	if (!c) {
 		rc = -ENOMEM;
 		goto no_client;
 	}
-	memcpy(c, &client_template, sizeof *c);
 	c->adapter = adap;
 	strcpy(c->name, "OV????");
 
--- linux-2.6.19-rc2-git7/drivers/media/video/pvrusb2/pvrusb2-io.c.orig	2006-10-23 21:15:34.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/media/video/pvrusb2/pvrusb2-io.c	2006-10-23 21:16:17.000000000 +0200
@@ -351,9 +351,8 @@ static int pvr2_stream_buffer_count(stru
 		if (scnt < sp->buffer_slot_count) {
 			struct pvr2_buffer **nb = NULL;
 			if (scnt) {
-				nb = kmalloc(scnt * sizeof(*nb),GFP_KERNEL);
+				nb = kmemdup(sp->buffers, scnt * sizeof(*nb),GFP_KERNEL);
 				if (!nb) return -ENOMEM;
-				memcpy(nb,sp->buffers,scnt * sizeof(*nb));
 			}
 			kfree(sp->buffers);
 			sp->buffers = nb;
--- linux-2.6.19-rc2-git7/drivers/media/video/saa5246a.c.orig	2006-10-23 21:16:46.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/media/video/saa5246a.c	2006-10-23 21:17:19.000000000 +0200
@@ -80,12 +80,11 @@ static int saa5246a_attach(struct i2c_ad
 	struct saa5246a_device *t;
 
 	printk(KERN_INFO "saa5246a: teletext chip found.\n");
-	client=kmalloc(sizeof(*client), GFP_KERNEL);
+	client=kmemdup(&client_template, sizeof(*client), GFP_KERNEL);
 	if(client=NULL)
 		return -ENOMEM;
 	client_template.adapter = adap;
 	client_template.addr = addr;
-	memcpy(client, &client_template, sizeof(*client));
 	t = kzalloc(sizeof(*t), GFP_KERNEL);
 	if(t=NULL)
 	{
--- linux-2.6.19-rc2-git7/drivers/media/video/tuner-3036.c.orig	2006-10-23 21:18:30.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/media/video/tuner-3036.c	2006-10-23 21:18:44.000000000 +0200
@@ -121,10 +121,9 @@ tuner_attach(struct i2c_adapter *adap, i
 	client_template.adapter = adap;
 	client_template.addr = addr;
 
-	client = kmalloc(sizeof(struct i2c_client), GFP_KERNEL);
+	client = kmemdup(&client_template, sizeof(struct i2c_client), GFP_KERNEL);
 	if (client = NULL)
 		return -ENOMEM;
-	memcpy(client, &client_template, sizeof(struct i2c_client));
 
 	printk("tuner: SAB3036 found, status %02x\n", tuner_getstatus(client));
 
--- linux-2.6.19-rc2-git7/drivers/media/video/tvp5150.c.orig	2006-10-23 21:19:27.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/media/video/tvp5150.c	2006-10-23 21:19:43.000000000 +0200
@@ -1066,10 +1066,9 @@ static int tvp5150_detect_client(struct 
 	     I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
 		return 0;
 
-	c = kmalloc(sizeof(struct i2c_client), GFP_KERNEL);
+	c = kmemdup(&client_template, sizeof(struct i2c_client), GFP_KERNEL);
 	if (c = 0)
 		return -ENOMEM;
-	memcpy(c, &client_template, sizeof(struct i2c_client));
 
 	core = kzalloc(sizeof(struct tvp5150), GFP_KERNEL);
 	if (core = 0) {


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

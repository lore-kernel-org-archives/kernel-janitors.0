From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 08:41:36 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/sbus
Message-Id: <1141548096.6426.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76954058933906122=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============76954058933906122==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts drivers/sbus to kzalloc usage.
Not tested

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/sbus/char/bbc_envctrl.c.orig	2006-03-04 21:59:51.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/sbus/char/bbc_envctrl.c	2006-03-04 22:00:20.000000000 +0100
@@ -485,11 +485,10 @@ static int kenvctrld(void *__unused)
 
 static void attach_one_temp(struct linux_ebus_child *echild, int temp_idx)
 {
-	struct bbc_cpu_temperature *tp = kmalloc(sizeof(*tp), GFP_KERNEL);
+	struct bbc_cpu_temperature *tp = kzalloc(sizeof(*tp), GFP_KERNEL);
 
 	if (!tp)
 		return;
-	memset(tp, 0, sizeof(*tp));
 	tp->client = bbc_i2c_attach(echild);
 	if (!tp->client) {
 		kfree(tp);
@@ -531,11 +530,10 @@ static void attach_one_temp(struct linux
 
 static void attach_one_fan(struct linux_ebus_child *echild, int fan_idx)
 {
-	struct bbc_fan_control *fp = kmalloc(sizeof(*fp), GFP_KERNEL);
+	struct bbc_fan_control *fp = kzalloc(sizeof(*fp), GFP_KERNEL);
 
 	if (!fp)
 		return;
-	memset(fp, 0, sizeof(*fp));
 	fp->client = bbc_i2c_attach(echild);
 	if (!fp->client) {
 		kfree(fp);
--- linux-2.6.16-rc5-mm1/drivers/sbus/char/openprom.c.orig	2006-03-04 22:00:31.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/sbus/char/openprom.c	2006-03-04 22:01:41.000000000 +0100
@@ -87,9 +87,8 @@ static int copyin(struct openpromio __us
 	if (bufsize > OPROMMAXPARAM)
 		bufsize = OPROMMAXPARAM;
 
-	if (!(*opp_p = kmalloc(sizeof(int) + bufsize + 1, GFP_KERNEL)))
+	if (!(*opp_p = kzalloc(sizeof(int) + bufsize + 1, GFP_KERNEL)))
 		return -ENOMEM;
-	memset(*opp_p, 0, sizeof(int) + bufsize + 1);
 
 	if (copy_from_user(&(*opp_p)->oprom_array,
 			   &info->oprom_array, bufsize)) {
@@ -107,10 +106,9 @@ static int getstrings(struct openpromio 
 	if (!info || !opp_p)
 		return -EFAULT;
 
-	if (!(*opp_p = kmalloc(sizeof(int) + OPROMMAXPARAM + 1, GFP_KERNEL)))
+	if (!(*opp_p = kzalloc(sizeof(int) + OPROMMAXPARAM + 1, GFP_KERNEL)))
 		return -ENOMEM;
 
-	memset(*opp_p, 0, sizeof(int) + OPROMMAXPARAM + 1);
 	(*opp_p)->oprom_size = 0;
 
 	n = bufsize = 0;
--- linux-2.6.16-rc5-mm1/drivers/sbus/char/bbc_i2c.c.orig	2006-03-04 22:02:02.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/sbus/char/bbc_i2c.c	2006-03-04 22:02:33.000000000 +0100
@@ -155,10 +155,9 @@ struct bbc_i2c_client *bbc_i2c_attach(st
 
 	if (!bp)
 		return NULL;
-	client = kmalloc(sizeof(*client), GFP_KERNEL);
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client)
 		return NULL;
-	memset(client, 0, sizeof(*client));
 	client->bp = bp;
 	client->echild = echild;
 	client->bus = echild->resource[0].start;
@@ -356,13 +355,12 @@ static void __init reset_one_i2c(struct 
 
 static int __init attach_one_i2c(struct linux_ebus_device *edev, int index)
 {
-	struct bbc_i2c_bus *bp = kmalloc(sizeof(*bp), GFP_KERNEL);
+	struct bbc_i2c_bus *bp = kzalloc(sizeof(*bp), GFP_KERNEL);
 	struct linux_ebus_child *echild;
 	int entry;
 
 	if (!bp)
 		return -ENOMEM;
-	memset(bp, 0, sizeof(*bp));
 
 	bp->i2c_control_regs = ioremap(edev->resource[0].start, 0x2);
 	if (!bp->i2c_control_regs)
--- linux-2.6.16-rc5-mm1/drivers/sbus/char/vfc_dev.c.orig	2006-03-04 22:02:42.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/sbus/char/vfc_dev.c	2006-03-04 22:03:31.000000000 +0100
@@ -264,11 +264,10 @@ static int vfc_debug(struct vfc_dev *dev
 		if (copy_from_user(&inout, argp, sizeof(inout)))
 			return -EFAULT;
 
-		buffer = kmalloc(inout.len, GFP_KERNEL);
+		buffer = kzalloc(inout.len, GFP_KERNEL);
 		if (buffer == NULL)
 			return -ENOMEM;
 
-		memset(buffer,0,inout.len);
 		vfc_lock_device(dev);
 		inout.ret=
 			vfc_i2c_recvbuf(dev,inout.addr & 0xff
@@ -663,12 +662,9 @@ static int vfc_probe(void)
 	if (!cards)
 		return -ENODEV;
 
-	vfc_dev_lst = (struct vfc_dev **)kmalloc(sizeof(struct vfc_dev *) *
-						 (cards+1),
-						 GFP_KERNEL);
+	vfc_dev_lst = kcalloc((cards+1), sizeof(struct vfc_dev *), GFP_KERNEL);
 	if (vfc_dev_lst == NULL)
 		return -ENOMEM;
-	memset(vfc_dev_lst, 0, sizeof(struct vfc_dev *) * (cards + 1));
 	vfc_dev_lst[cards] = NULL;
 
 	ret = register_chrdev(VFC_MAJOR, vfcstr, &vfc_fops);



--===============76954058933906122==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76954058933906122==--

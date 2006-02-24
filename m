From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 24 Feb 2006 18:48:42 +0000
Subject: [KJ] [Patch] convert drivers/input to kzalloc() usage
Message-Id: <1140806922.22903.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4835112304799285=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4835112304799285==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts drivers/input to kzalloc() usage, and cleans
up two if blocks in input/mouse/hil_ptr.c
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/drivers/input/evdev.c.orig	2006-02-24 19:38:07.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/evdev.c	2006-02-24 19:38:30.000000000 +0100
@@ -130,9 +130,8 @@ static int evdev_open(struct inode * ino
 	if ((accept_err = input_accept_process(&(evdev_table[i]->handle), file)))
 		return accept_err;
 
-	if (!(list = kmalloc(sizeof(struct evdev_list), GFP_KERNEL)))
+	if (!(list = kzalloc(sizeof(struct evdev_list), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(list, 0, sizeof(struct evdev_list));
 
 	list->evdev = evdev_table[i];
 	list_add_tail(&list->node, &evdev_table[i]->list);
@@ -609,9 +608,8 @@ static struct input_handle *evdev_connec
 		return NULL;
 	}
 
-	if (!(evdev = kmalloc(sizeof(struct evdev), GFP_KERNEL)))
+	if (!(evdev = kzalloc(sizeof(struct evdev), GFP_KERNEL)))
 		return NULL;
-	memset(evdev, 0, sizeof(struct evdev));
 
 	INIT_LIST_HEAD(&evdev->list);
 	init_waitqueue_head(&evdev->wait);
--- linux-2.6.16-rc4/drivers/input/mousedev.c.orig	2006-02-24 19:38:43.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/mousedev.c	2006-02-24 19:39:10.000000000 +0100
@@ -412,9 +412,8 @@ static int mousedev_open(struct inode * 
 	if (i >= MOUSEDEV_MINORS || !mousedev_table[i])
 		return -ENODEV;
 
-	if (!(list = kmalloc(sizeof(struct mousedev_list), GFP_KERNEL)))
+	if (!(list = kzalloc(sizeof(struct mousedev_list), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(list, 0, sizeof(struct mousedev_list));
 
 	spin_lock_init(&list->packet_lock);
 	list->pos_x = xres / 2;
@@ -626,9 +625,8 @@ static struct input_handle *mousedev_con
 		return NULL;
 	}
 
-	if (!(mousedev = kmalloc(sizeof(struct mousedev), GFP_KERNEL)))
+	if (!(mousedev = kzalloc(sizeof(struct mousedev), GFP_KERNEL)))
 		return NULL;
-	memset(mousedev, 0, sizeof(struct mousedev));
 
 	INIT_LIST_HEAD(&mousedev->list);
 	init_waitqueue_head(&mousedev->wait);
--- linux-2.6.16-rc4/drivers/input/serio/serio_raw.c.orig	2006-02-24 19:39:23.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/serio/serio_raw.c	2006-02-24 19:39:57.000000000 +0100
@@ -95,12 +95,11 @@ static int serio_raw_open(struct inode *
 		goto out;
 	}
 
-	if (!(list = kmalloc(sizeof(struct serio_raw_list), GFP_KERNEL))) {
+	if (!(list = kzalloc(sizeof(struct serio_raw_list), GFP_KERNEL))) {
 		retval = -ENOMEM;
 		goto out;
 	}
 
-	memset(list, 0, sizeof(struct serio_raw_list));
 	list->serio_raw = serio_raw;
 	file->private_data = list;
 
@@ -275,14 +274,13 @@ static int serio_raw_connect(struct seri
 	struct serio_raw *serio_raw;
 	int err;
 
-	if (!(serio_raw = kmalloc(sizeof(struct serio_raw), GFP_KERNEL))) {
+	if (!(serio_raw = kzalloc(sizeof(struct serio_raw), GFP_KERNEL))) {
 		printk(KERN_ERR "serio_raw.c: can't allocate memory for a device\n");
 		return -ENOMEM;
 	}
 
 	down(&serio_raw_sem);
 
-	memset(serio_raw, 0, sizeof(struct serio_raw));
 	snprintf(serio_raw->name, sizeof(serio_raw->name), "serio_raw%d", serio_raw_no++);
 	serio_raw->refcnt = 1;
 	serio_raw->serio = serio;
--- linux-2.6.16-rc4/drivers/input/serio/parkbd.c.orig	2006-02-24 19:40:08.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/serio/parkbd.c	2006-02-24 19:40:16.000000000 +0100
@@ -171,9 +171,8 @@ static struct serio * __init parkbd_allo
 {
 	struct serio *serio;
 
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (serio) {
-		memset(serio, 0, sizeof(struct serio));
 		serio->id.type = parkbd_mode;
 		serio->write = parkbd_write,
 		strlcpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->name));
--- linux-2.6.16-rc4/drivers/input/serio/rpckbd.c.orig	2006-02-24 19:40:26.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/serio/rpckbd.c	2006-02-24 19:40:36.000000000 +0100
@@ -111,11 +111,10 @@ static int __devinit rpckbd_probe(struct
 {
 	struct serio *serio;
 
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!serio)
 		return -ENOMEM;
 
-	memset(serio, 0, sizeof(struct serio));
 	serio->id.type		= SERIO_8042;
 	serio->write		= rpckbd_write;
 	serio->open		= rpckbd_open;
--- linux-2.6.16-rc4/drivers/input/serio/hil_mlc.c.orig	2006-02-24 19:41:20.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/serio/hil_mlc.c	2006-02-24 19:41:34.000000000 +0100
@@ -872,9 +872,8 @@ int hil_mlc_register(hil_mlc *mlc) {
 	for (i = 0; i < HIL_MLC_DEVMEM; i++) {
 		struct serio *mlc_serio;
 		hil_mlc_copy_di_scratch(mlc, i);
-		mlc_serio = kmalloc(sizeof(*mlc_serio), GFP_KERNEL);
+		mlc_serio = kzalloc(sizeof(*mlc_serio), GFP_KERNEL);
 		mlc->serio[i] = mlc_serio;
-		memset(mlc_serio, 0, sizeof(*mlc_serio));
 		mlc_serio->id			= hil_mlc_serio_id;
 		mlc_serio->write		= hil_mlc_serio_write;
 		mlc_serio->open			= hil_mlc_serio_open;
--- linux-2.6.16-rc4/drivers/input/tsdev.c.orig	2006-02-24 19:41:46.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/tsdev.c	2006-02-24 19:42:03.000000000 +0100
@@ -157,9 +157,8 @@ static int tsdev_open(struct inode *inod
 	if (i >= TSDEV_MINORS || !tsdev_table[i & TSDEV_MINOR_MASK])
 		return -ENODEV;
 
-	if (!(list = kmalloc(sizeof(struct tsdev_list), GFP_KERNEL)))
+	if (!(list = kzalloc(sizeof(struct tsdev_list), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(list, 0, sizeof(struct tsdev_list));
 
 	list->raw = (i >= TSDEV_MINORS/2) ? 1 : 0;
 
@@ -379,9 +378,8 @@ static struct input_handle *tsdev_connec
 		return NULL;
 	}
 
-	if (!(tsdev = kmalloc(sizeof(struct tsdev), GFP_KERNEL)))
+	if (!(tsdev = kzalloc(sizeof(struct tsdev), GFP_KERNEL)))
 		return NULL;
-	memset(tsdev, 0, sizeof(struct tsdev));
 
 	INIT_LIST_HEAD(&tsdev->list);
 	init_waitqueue_head(&tsdev->wait);
--- linux-2.6.16-rc4/drivers/input/keyboard/hil_kbd.c.orig	2006-02-24 19:42:17.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/keyboard/hil_kbd.c	2006-02-24 19:42:42.000000000 +0100
@@ -251,10 +251,9 @@ static int hil_kbd_connect(struct serio 
 	uint8_t		did, *idd;
 	int		i;
 	
-	kbd = kmalloc(sizeof(*kbd), GFP_KERNEL);
+	kbd = kzalloc(sizeof(*kbd), GFP_KERNEL);
 	if (!kbd)
 		return -ENOMEM;
-	memset(kbd, 0, sizeof(struct hil_kbd));
 
 	if (serio_open(serio, drv)) goto bail0;
 
--- linux-2.6.16-rc4/drivers/input/power.c.orig	2006-02-24 19:42:58.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/power.c	2006-02-24 19:43:07.000000000 +0100
@@ -103,9 +103,8 @@ static struct input_handle *power_connec
 {
 	struct input_handle *handle;
 
-	if (!(handle = kmalloc(sizeof(struct input_handle), GFP_KERNEL)))
+	if (!(handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL)))
 		return NULL;
-	memset(handle, 0, sizeof(struct input_handle));
 
 	handle->dev = dev;
 	handle->handler = handler;
--- linux-2.6.16-rc4/drivers/input/mouse/hil_ptr.c.orig	2006-02-24 19:43:17.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/mouse/hil_ptr.c	2006-02-24 19:43:51.000000000 +0100
@@ -245,10 +245,11 @@ static int hil_ptr_connect(struct serio 
 	unsigned int	i, naxsets, btntype;
 	uint8_t		did, *idd;
 
-	if (!(ptr = kmalloc(sizeof(struct hil_ptr), GFP_KERNEL))) return -ENOMEM;
-	memset(ptr, 0, sizeof(struct hil_ptr));
+	if (!(ptr = kzalloc(sizeof(struct hil_ptr), GFP_KERNEL)))
+		return -ENOMEM;
 
-	if (serio_open(serio, driver)) goto bail0;
+	if (serio_open(serio, driver))
+		goto bail0;
 
 	serio_set_drvdata(serio, ptr);
 	ptr->serio = serio;
--- linux-2.6.16-rc4/drivers/input/mouse/synaptics.c.orig	2006-02-24 19:44:06.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/mouse/synaptics.c	2006-02-24 19:44:31.000000000 +0100
@@ -247,14 +247,12 @@ static void synaptics_pt_create(struct p
 {
 	struct serio *serio;
 
-	serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!serio) {
 		printk(KERN_ERR "synaptics: not enough memory to allocate pass-through port\n");
 		return;
 	}
 
-	memset(serio, 0, sizeof(struct serio));
-
 	serio->id.type = SERIO_PS_PSTHRU;
 	strlcpy(serio->name, "Synaptics pass-through", sizeof(serio->name));
 	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->name));
@@ -623,10 +621,9 @@ int synaptics_init(struct psmouse *psmou
 {
 	struct synaptics_data *priv;
 
-	psmouse->private = priv = kmalloc(sizeof(struct synaptics_data), GFP_KERNEL);
+	psmouse->private = priv = kzalloc(sizeof(struct synaptics_data), GFP_KERNEL);
 	if (!priv)
 		return -1;
-	memset(priv, 0, sizeof(struct synaptics_data));
 
 	if (synaptics_query_hardware(psmouse)) {
 		printk(KERN_ERR "Unable to query Synaptics hardware.\n");
--- linux-2.6.16-rc4/drivers/input/evbug.c.orig	2006-02-24 19:44:42.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/evbug.c	2006-02-24 19:44:51.000000000 +0100
@@ -49,9 +49,8 @@ static struct input_handle *evbug_connec
 {
 	struct input_handle *handle;
 
-	if (!(handle = kmalloc(sizeof(struct input_handle), GFP_KERNEL)))
+	if (!(handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL)))
 		return NULL;
-	memset(handle, 0, sizeof(struct input_handle));
 
 	handle->dev = dev;
 	handle->handler = handler;
--- linux-2.6.16-rc4/drivers/input/joydev.c.orig	2006-02-24 19:44:58.000000000 +0100
+++ linux-2.6.16-rc4/drivers/input/joydev.c	2006-02-24 19:45:14.000000000 +0100
@@ -171,9 +171,8 @@ static int joydev_open(struct inode *ino
 	if (i >= JOYDEV_MINORS || !joydev_table[i])
 		return -ENODEV;
 
-	if (!(list = kmalloc(sizeof(struct joydev_list), GFP_KERNEL)))
+	if (!(list = kzalloc(sizeof(struct joydev_list), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(list, 0, sizeof(struct joydev_list));
 
 	list->joydev = joydev_table[i];
 	list_add_tail(&list->node, &joydev_table[i]->list);
@@ -457,9 +456,8 @@ static struct input_handle *joydev_conne
 		return NULL;
 	}
 
-	if (!(joydev = kmalloc(sizeof(struct joydev), GFP_KERNEL)))
+	if (!(joydev = kzalloc(sizeof(struct joydev), GFP_KERNEL)))
 		return NULL;
-	memset(joydev, 0, sizeof(struct joydev));
 
 	INIT_LIST_HEAD(&joydev->list);
 	init_waitqueue_head(&joydev->wait);



--===============4835112304799285==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4835112304799285==--

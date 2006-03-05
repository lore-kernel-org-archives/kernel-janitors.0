From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:18 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/media/
Message-Id: <1141570938.13183.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33483197810493848=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============33483197810493848==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts drivers/media/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/media/dvb/cinergyT2/cinergyT2.c.orig	2006-03-05 09:48:34.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/media/dvb/cinergyT2/cinergyT2.c	2006-03-05 09:48:53.000000000 +0100
@@ -877,12 +877,11 @@ static int cinergyt2_probe (struct usb_i
 	struct cinergyt2 *cinergyt2;
 	int err;
 
-	if (!(cinergyt2 = kmalloc (sizeof(struct cinergyt2), GFP_KERNEL))) {
+	if (!(cinergyt2 = kzalloc(sizeof(struct cinergyt2), GFP_KERNEL))) {
 		dprintk(1, "out of memory?!?\n");
 		return -ENOMEM;
 	}
 
-	memset (cinergyt2, 0, sizeof (struct cinergyt2));
 	usb_set_intfdata (intf, (void *) cinergyt2);
 
 	init_MUTEX(&cinergyt2->sem);
--- linux-2.6.16-rc5-mm1/drivers/media/video/cx88/cx88-alsa.c.orig	2006-03-05 09:50:04.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/media/video/cx88/cx88-alsa.c	2006-03-05 09:50:14.000000000 +0100
@@ -413,11 +413,9 @@ static int snd_cx88_hw_params(struct snd
 
 	dprintk(1,"Setting buffer\n");
 
-	buf = kmalloc(sizeof(*buf),GFP_KERNEL);
+	buf = kzalloc(sizeof(*buf),GFP_KERNEL);
 	if (NULL == buf)
 		return -ENOMEM;
-	memset(buf,0,sizeof(*buf));
-
 
 	buf->vb.memory = V4L2_MEMORY_MMAP;
 	buf->vb.width  = chip->period_size;
--- linux-2.6.16-rc5-mm1/drivers/media/video/msp3400-driver.c.orig	2006-03-05 09:50:27.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/media/video/msp3400-driver.c	2006-03-05 09:50:54.000000000 +0100
@@ -1070,10 +1070,9 @@ static int msp_attach(struct i2c_adapter
 	int msp_product, msp_prod_hi, msp_prod_lo;
 	int msp_rom;
 
-	client = kmalloc(sizeof(*client), GFP_KERNEL);
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (client == NULL)
 		return -ENOMEM;
-	memset(client, 0, sizeof(*client));
 	client->addr = address;
 	client->adapter = adapter;
 	client->driver = &i2c_driver;
@@ -1085,14 +1084,13 @@ static int msp_attach(struct i2c_adapter
 		return -1;
 	}
 
-	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state == NULL) {
 		kfree(client);
 		return -ENOMEM;
 	}
 	i2c_set_clientdata(client, state);
 
-	memset(state, 0, sizeof(*state));
 	state->v4l2_std = V4L2_STD_NTSC;
 	state->volume = 58880;	/* 0db gain */
 	state->balance = 32768;	/* 0db gain */
--- linux-2.6.16-rc5-mm1/drivers/media/video/planb.c.orig	2006-03-05 09:51:03.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/media/video/planb.c	2006-03-05 09:51:39.000000000 +0100
@@ -352,9 +352,8 @@ static int planb_prepare_open(struct pla
 		* PLANB_DUMMY)*sizeof(struct dbdma_cmd)
 		+(PLANB_MAXLINES*((PLANB_MAXPIXELS+7)& ~7))/8
 		+MAX_GBUFFERS*sizeof(unsigned int);
-	if ((pb->priv_space = kmalloc (size, GFP_KERNEL)) == 0)
+	if ((pb->priv_space = kzalloc(size, GFP_KERNEL)) == 0)
 		return -ENOMEM;
-	memset ((void *) pb->priv_space, 0, size);
 	pb->overlay_last1 = pb->ch1_cmd = (volatile struct dbdma_cmd *)
 						DBDMA_ALIGN (pb->priv_space);
 	pb->overlay_last2 = pb->ch2_cmd = pb->ch1_cmd + pb->tab_size;



--===============33483197810493848==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33483197810493848==--

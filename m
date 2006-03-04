From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 18:19:28 +0000
Subject: [KJ] [Patch] kzalloc() conversion in sound/
Message-Id: <1141496369.26346.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82038792661170401=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82038792661170401==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts sound (except the oss stuff) to kzalloc usage.
Compile tested with allyes config, which does not include the pcc
drivers.

I believe there is a possible memory leak in sound/vx/vx_pcm.c
when the kmalloc() for chip->playback_pipes is succesfull, and 
the one for chip->capture_pipes() fails, playback_pipes will
not get free()d. ( Or the other way around ).

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/sound/ppc/keywest.c.orig	2006-03-04 19:00:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/ppc/keywest.c	2006-03-04 19:00:12.000000000 +0100
@@ -65,11 +65,10 @@ static int keywest_attach_adapter(struct
 	if (strncmp(i2c_device_name(adapter), "mac-io", 6))
 		return 0; /* ignored */
 
-	new_client = kmalloc(sizeof(struct i2c_client), GFP_KERNEL);
+	new_client = kzalloc(sizeof(struct i2c_client), GFP_KERNEL);
 	if (! new_client)
 		return -ENOMEM;
 
-	memset(new_client, 0, sizeof(*new_client));
 	new_client->addr = keywest_ctx->addr;
 	i2c_set_clientdata(new_client, keywest_ctx);
 	new_client->adapter = adapter;
--- linux-2.6.16-rc5-mm1/sound/ppc/awacs.c.orig	2006-03-04 19:00:18.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/ppc/awacs.c	2006-03-04 19:00:30.000000000 +0100
@@ -801,11 +801,10 @@ snd_pmac_awacs_init(struct snd_pmac *chi
 	chip->revision = (in_le32(&chip->awacs->codec_stat) >> 12) & 0xf;
 #ifdef PMAC_AMP_AVAIL
 	if (chip->revision == 3 && chip->has_iic && CHECK_CUDA_AMP()) {
-		struct awacs_amp *amp = kmalloc(sizeof(*amp), GFP_KERNEL);
+		struct awacs_amp *amp = kzalloc(sizeof(*amp), GFP_KERNEL);
 		if (! amp)
 			return -ENOMEM;
 		chip->mixer_data = amp;
-		memset(amp, 0, sizeof(*amp));
 		chip->mixer_free = awacs_amp_free;
 		awacs_amp_set_vol(amp, 0, 63, 63, 0); /* mute and zero vol */
 		awacs_amp_set_vol(amp, 1, 63, 63, 0);
--- linux-2.6.16-rc5-mm1/sound/ppc/daca.c.orig	2006-03-04 19:00:36.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/ppc/daca.c	2006-03-04 19:00:43.000000000 +0100
@@ -259,10 +259,9 @@ int __init snd_pmac_daca_init(struct snd
 		request_module("i2c-keywest");
 #endif /* CONFIG_KMOD */	
 
-	mix = kmalloc(sizeof(*mix), GFP_KERNEL);
+	mix = kzalloc(sizeof(*mix), GFP_KERNEL);
 	if (! mix)
 		return -ENOMEM;
-	memset(mix, 0, sizeof(*mix));
 	chip->mixer_data = mix;
 	chip->mixer_free = daca_cleanup;
 	mix->amp_on = 1; /* default on */
--- linux-2.6.16-rc5-mm1/sound/ppc/tumbler.c.orig	2006-03-04 19:00:51.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/ppc/tumbler.c	2006-03-04 19:00:58.000000000 +0100
@@ -1317,10 +1317,9 @@ int __init snd_pmac_tumbler_init(struct 
 		request_module("i2c-keywest");
 #endif /* CONFIG_KMOD */	
 
-	mix = kmalloc(sizeof(*mix), GFP_KERNEL);
+	mix = kzalloc(sizeof(*mix), GFP_KERNEL);
 	if (! mix)
 		return -ENOMEM;
-	memset(mix, 0, sizeof(*mix));
 	mix->headphone_irq = -1;
 
 	chip->mixer_data = mix;
--- linux-2.6.16-rc5-mm1/sound/core/sgbuf.c.orig	2006-03-04 19:01:09.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/core/sgbuf.c	2006-03-04 19:02:13.000000000 +0100
@@ -69,21 +69,18 @@ void *snd_malloc_sgbuf_pages(struct devi
 
 	dmab->area = NULL;
 	dmab->addr = 0;
-	dmab->private_data = sgbuf = kmalloc(sizeof(*sgbuf), GFP_KERNEL);
+	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (! sgbuf)
 		return NULL;
-	memset(sgbuf, 0, sizeof(*sgbuf));
 	sgbuf->dev = device;
 	pages = snd_sgbuf_aligned_pages(size);
 	sgbuf->tblsize = sgbuf_align_table(pages);
-	sgbuf->table = kmalloc(sizeof(*sgbuf->table) * sgbuf->tblsize, GFP_KERNEL);
+	sgbuf->table = kcalloc(sgbuf->tblsize, sizeof(*sgbuf->table), GFP_KERNEL);
 	if (! sgbuf->table)
 		goto _failed;
-	memset(sgbuf->table, 0, sizeof(*sgbuf->table) * sgbuf->tblsize);
-	sgbuf->page_table = kmalloc(sizeof(*sgbuf->page_table) * sgbuf->tblsize, GFP_KERNEL);
+	sgbuf->page_table = kcalloc(sgbuf->tblsize, sizeof(*sgbuf->page_table), GFP_KERNEL);
 	if (! sgbuf->page_table)
 		goto _failed;
-	memset(sgbuf->page_table, 0, sizeof(*sgbuf->page_table) * sgbuf->tblsize);
 
 	/* allocate each page */
 	for (i = 0; i < pages; i++) {
--- linux-2.6.16-rc5-mm1/sound/core/seq/seq_device.c.orig	2006-03-04 19:02:25.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/core/seq/seq_device.c	2006-03-04 19:02:33.000000000 +0100
@@ -372,10 +372,9 @@ static struct ops_list * create_driver(c
 {
 	struct ops_list *ops;
 
-	ops = kmalloc(sizeof(*ops), GFP_KERNEL);
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
 	if (ops == NULL)
 		return ops;
-	memset(ops, 0, sizeof(*ops));
 
 	/* set up driver entry */
 	strlcpy(ops->id, id, sizeof(ops->id));
--- linux-2.6.16-rc5-mm1/sound/drivers/vx/vx_pcm.c.orig	2006-03-04 19:02:52.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/drivers/vx/vx_pcm.c	2006-03-04 19:04:02.000000000 +0100
@@ -1252,14 +1252,11 @@ static int vx_init_audio_io(struct vx_co
 	chip->audio_info = rmh.Stat[1];
 
 	/* allocate pipes */
-	chip->playback_pipes = kmalloc(sizeof(struct vx_pipe *) * chip->audio_outs, GFP_KERNEL);
-	chip->capture_pipes = kmalloc(sizeof(struct vx_pipe *) * chip->audio_ins, GFP_KERNEL);
+	chip->playback_pipes = kcalloc(chip->audio_outs, sizeof(struct vx_pipe *), GFP_KERNEL);
+	chip->capture_pipes = kcalloc(chip->audio_ins, sizeof(struct vx_pipe *), GFP_KERNEL);
 	if (! chip->playback_pipes || ! chip->capture_pipes)
 		return -ENOMEM;
 
-	memset(chip->playback_pipes, 0, sizeof(struct vx_pipe *) * chip->audio_outs);
-	memset(chip->capture_pipes, 0, sizeof(struct vx_pipe *) * chip->audio_ins);
-
 	preferred = chip->ibl.size;
 	chip->ibl.size = 0;
 	vx_set_ibl(chip, &chip->ibl); /* query the info */
--- linux-2.6.16-rc5-mm1/sound/usb/usbaudio.c.orig	2006-03-04 19:05:22.000000000 +0100
+++ linux-2.6.16-rc5-mm1/sound/usb/usbaudio.c	2006-03-04 19:05:34.000000000 +0100
@@ -2222,10 +2222,9 @@ static int add_audio_endpoint(struct snd
 	}
 
 	/* create a new pcm */
-	as = kmalloc(sizeof(*as), GFP_KERNEL);
+	as = kzalloc(sizeof(*as), GFP_KERNEL);
 	if (! as)
 		return -ENOMEM;
-	memset(as, 0, sizeof(*as));
 	as->pcm_index = chip->pcm_devs;
 	as->chip = chip;
 	as->fmt_type = fp->fmt_type;



--===============82038792661170401==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82038792661170401==--

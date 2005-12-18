From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 21:12:26 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in media/video/mxb.c
Message-Id: <1134940346.21316.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71287537641529841=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134733947.8536.2.camel@alice>
In-Reply-To: <1134733947.8536.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============71287537641529841==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> IIRC, these should be fixed too:
> 
> > -		if( i->index < 0 || i->index >= MXB_INPUTS) {
> > +		if( i->index >= MXB_INPUTS) {
> if (i->index >= ....) {

here is a patch on top of the first one which
changes the coding style. 


Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-rc5-git5/drivers/media/video/mxb.c.orig	2005-12-18 22:06:20.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/media/video/mxb.c	2005-12-18 22:08:12.000000000 +0100
@@ -177,7 +177,7 @@ static int mxb_probe(struct saa7146_dev*
 	}
 
 	mxb = (struct mxb*)kmalloc(sizeof(struct mxb), GFP_KERNEL);
-	if( NULL == mxb ) {
+	if (NULL == mxb) {
 		DEB_D(("not enough kernel memory.\n"));
 		return -ENOMEM;
 	}
@@ -189,7 +189,7 @@ static int mxb_probe(struct saa7146_dev*
 	};
 
 	saa7146_i2c_adapter_prepare(dev, &mxb->i2c_adapter, SAA7146_I2C_BUS_BIT_RATE_480);
-	if(i2c_add_adapter(&mxb->i2c_adapter) < 0) {
+	if (i2c_add_adapter(&mxb->i2c_adapter) < 0) {
 		DEB_S(("cannot register i2c-device. skipping.\n"));
 		kfree(mxb);
 		return -EFAULT;
@@ -198,22 +198,22 @@ static int mxb_probe(struct saa7146_dev*
 	/* loop through all i2c-devices on the bus and look who is there */
 	list_for_each(item,&mxb->i2c_adapter.clients) {
 		client = list_entry(item, struct i2c_client, list);
-		if( I2C_TEA6420_1 == client->addr )
+		if (I2C_TEA6420_1 == client->addr)
 			mxb->tea6420_1 = client;
-		if( I2C_TEA6420_2 == client->addr ) 
+		if (I2C_TEA6420_2 == client->addr) 
 			mxb->tea6420_2 = client;
-		if( I2C_TEA6415C_2 == client->addr ) 
+		if (I2C_TEA6415C_2 == client->addr) 
 			mxb->tea6415c = client;
-		if( I2C_TDA9840 == client->addr ) 
+		if (I2C_TDA9840 == client->addr) 
 			mxb->tda9840 = client;
-		if( I2C_SAA7111 == client->addr )
+		if (I2C_SAA7111 == client->addr)
 			mxb->saa7111a = client;
-		if( 0x60 == client->addr ) 
+		if (0x60 == client->addr) 
 			mxb->tuner = client;
 	}
 
 	/* check if all devices are present */
-	if(    0 == mxb->tea6420_1	|| 0 == mxb->tea6420_2	|| 0 == mxb->tea6415c
+	if (   0 == mxb->tea6420_1	|| 0 == mxb->tea6420_2	|| 0 == mxb->tea6415c
 	    || 0 == mxb->tda9840	|| 0 == mxb->saa7111a	|| 0 == mxb->tuner ) {
 
 		printk("mxb: did not find all i2c devices. aborting\n");
@@ -393,21 +393,21 @@ static int mxb_init_done(struct saa7146_
 	msg.len = mxb_saa7740_init[0].length;
 	msg.buf = &mxb_saa7740_init[0].data[0];
 
-	if( 1 == (err = i2c_transfer(&mxb->i2c_adapter, &msg, 1))) {
+	if (1 == (err = i2c_transfer(&mxb->i2c_adapter, &msg, 1))) {
 		/* the sound arena module is a pos, that's probably the reason
 		   philips refuses to hand out a datasheet for the saa7740...
 		   it seems to screw up the i2c bus, so we disable fast irq
 		   based i2c transactions here and rely on the slow and safe
 		   polling method ... */
 		extension.flags &= ~SAA7146_USE_I2C_IRQ;
-		for(i = 1;;i++) {
-			if( -1 == mxb_saa7740_init[i].length ) {
+		for (i = 1;;i++) {
+			if (-1 == mxb_saa7740_init[i].length) {
 				break;
 			}
 
 			msg.len = mxb_saa7740_init[i].length;		
 			msg.buf = &mxb_saa7740_init[i].data[0];
-			if( 1 != (err = i2c_transfer(&mxb->i2c_adapter, &msg, 1))) {
+			if (1 != (err = i2c_transfer(&mxb->i2c_adapter, &msg, 1))) {
 				DEB_D(("failed to initialize 'sound arena module'.\n"));
 				goto err;
 			}
@@ -456,14 +456,14 @@ static int mxb_attach(struct saa7146_dev
 	   already did this in "mxb_vl42_probe" */
 
 	saa7146_vv_init(dev,&vv_data);
-	if( 0 != saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_GRABBER)) {
+	if (0 != saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_GRABBER)) {
 		ERR(("cannot register capture v4l2 device. skipping.\n"));
 		return -1;
 	}
 	
 	/* initialization stuff (vbi) (only for revision > 0 and for extensions which want it)*/
-	if( 0 != MXB_BOARD_CAN_DO_VBI(dev)) {
-		if( 0 != saa7146_register_device(&mxb->vbi_dev, dev, "mxb", VFL_TYPE_VBI)) {
+	if (0 != MXB_BOARD_CAN_DO_VBI(dev)) {
+		if (0 != saa7146_register_device(&mxb->vbi_dev, dev, "mxb", VFL_TYPE_VBI)) {
 			ERR(("cannot register vbi v4l2 device. skipping.\n"));
 		}
 	}
@@ -496,7 +496,7 @@ static int mxb_detach(struct saa7146_dev
 	i2c_release_client(mxb->tuner);
 
 	saa7146_unregister_device(&mxb->video_dev,dev);
-	if( 0 != MXB_BOARD_CAN_DO_VBI(dev)) {
+	if (0 != MXB_BOARD_CAN_DO_VBI(dev)) {
 		saa7146_unregister_device(&mxb->vbi_dev,dev);
 	}
 	saa7146_vv_release(dev);
@@ -521,7 +521,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		struct v4l2_input *i = arg;
 		
 		DEB_EE(("VIDIOC_ENUMINPUT %d.\n",i->index));
-		if( i->index >= MXB_INPUTS) {
+		if (i->index >= MXB_INPUTS) {
 			return -EINVAL;
 		}
 		memcpy(i, &mxb_inputs[i->index], sizeof(struct v4l2_input));
@@ -556,11 +556,11 @@ static int mxb_ioctl(struct saa7146_fh *
 			}
 		}
 		
-		if( i < 0 ) {
+		if (i < 0) {
 			return -EAGAIN;
 		}
 			
-		switch (vc->id ) {
+		switch (vc->id) {
 			case V4L2_CID_AUDIO_MUTE: {
 				vc->value = mxb->cur_mute;
 				DEB_D(("VIDIOC_G_CTRL V4L2_CID_AUDIO_MUTE:%d.\n",vc->value));
@@ -583,14 +583,14 @@ static int mxb_ioctl(struct saa7146_fh *
 			}
 		}
 		
-		if( i < 0 ) {
+		if (i < 0) {
 			return -EAGAIN;
 		}
 		
-		switch (vc->id ) {
+		switch (vc->id) {
 			case V4L2_CID_AUDIO_MUTE: {
 				mxb->cur_mute = vc->value;
-				if( 0 == vc->value ) {
+				if (0 == vc->value) {
 					/* switch the audio-source */
 					mxb->tea6420_1->driver->command(mxb->tea6420_1,TEA6420_SWITCH, &TEA6420_line[video_audio_connect[mxb->cur_input]][0]);
 					mxb->tea6420_2->driver->command(mxb->tea6420_2,TEA6420_SWITCH, &TEA6420_line[video_audio_connect[mxb->cur_input]][1]);
@@ -651,7 +651,7 @@ static int mxb_ioctl(struct saa7146_fh *
 				vm.in  = 3;
 				vm.out = 17;
 								
-			if ( 0 != mxb->tea6415c->driver->command(mxb->tea6415c,TEA6415C_SWITCH, &vm)) {
+			if (0 != mxb->tea6415c->driver->command(mxb->tea6415c,TEA6415C_SWITCH, &vm)) {
 					printk("VIDIOC_S_INPUT: could not address tea6415c #1\n");
 					return -EFAULT;
 				}
@@ -688,7 +688,7 @@ static int mxb_ioctl(struct saa7146_fh *
 			case TUNER:
 			case AUX1:
 			{
-				if ( 0 != mxb->tea6415c->driver->command(mxb->tea6415c,TEA6415C_SWITCH, &vm)) {
+				if (0 != mxb->tea6415c->driver->command(mxb->tea6415c,TEA6415C_SWITCH, &vm)) {
 					printk("VIDIOC_S_INPUT: could not address tea6415c #3\n");
 					return -EFAULT;
 				}
@@ -701,12 +701,12 @@ static int mxb_ioctl(struct saa7146_fh *
 		}
 				
 		/* switch video in saa7111a */
-		if ( 0 != mxb->saa7111a->driver->command(mxb->saa7111a,DECODER_SET_INPUT, &i)) {
+		if (0 != mxb->saa7111a->driver->command(mxb->saa7111a,DECODER_SET_INPUT, &i)) {
 			printk("VIDIOC_S_INPUT: could not address saa7111a #1.\n");
 		}			
 
 		/* switch the audio-source only if necessary */
-		if( 0 == mxb->cur_mute ) {
+		if (0 == mxb->cur_mute ) {
 			mxb->tea6420_1->driver->command(mxb->tea6420_1,TEA6420_SWITCH, &TEA6420_line[video_audio_connect[input]][0]);
 			mxb->tea6420_2->driver->command(mxb->tea6420_2,TEA6420_SWITCH, &TEA6420_line[video_audio_connect[input]][1]);
 		}
@@ -718,7 +718,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		struct v4l2_tuner *t = arg;
 		int byte = 0;
 
-		if( 0 != t->index ) {
+		if (0 != t->index) {
 			DEB_D(("VIDIOC_G_TUNER: channel %d does not have a tuner attached.\n", t->index));
 			return -EINVAL;
 		}
@@ -739,7 +739,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		mxb->tda9840->driver->command(mxb->tda9840,TDA9840_DETECT, &byte);
 		t->audmode = mxb->cur_mode;
 		
-		if( byte < 0 ) {
+		if (byte < 0) {
 			t->rxsubchans  = V4L2_TUNER_SUB_MONO;
 		} else {
 			switch(byte) {
@@ -774,7 +774,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		int result = 0;
 		int byte = 0;
 		
-		if( 0 != t->index ) {
+		if (0 != t->index) {
 			DEB_D(("VIDIOC_S_TUNER: channel %d does not have a tuner attached.\n",t->index));
 			return -EINVAL;
 		}
@@ -806,7 +806,7 @@ static int mxb_ioctl(struct saa7146_fh *
 			}
 		}
 
-		if( 0 != (result = mxb->tda9840->driver->command(mxb->tda9840, TDA9840_SWITCH, &byte))) {
+		if (0 != (result = mxb->tda9840->driver->command(mxb->tda9840, TDA9840_SWITCH, &byte))) {
 			printk("VIDIOC_S_TUNER error. result:%d, byte:%d\n",result,byte);
 		}
 				
@@ -816,7 +816,7 @@ static int mxb_ioctl(struct saa7146_fh *
 	{
 		struct v4l2_frequency *f = arg;
 
-		if(0 != mxb->cur_input) {
+		if (0 != mxb->cur_input) {
 			DEB_D(("VIDIOC_G_FREQ: channel %d does not have a tuner!\n",mxb->cur_input));
 			return -EINVAL;
 		}
@@ -836,7 +836,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		if (V4L2_TUNER_ANALOG_TV != f->type)
 			return -EINVAL;
 		
-		if(0 != mxb->cur_input) {
+		if (0 != mxb->cur_input) {
 			DEB_D(("VIDIOC_S_FREQ: channel %d does not have a tuner!\n",mxb->cur_input));
 			return -EINVAL;
 		}
@@ -858,7 +858,7 @@ static int mxb_ioctl(struct saa7146_fh *
 	{
 		int i = *(int*)arg;
 				
-		if( i < 0 || i >= MXB_AUDIOS ) {
+		if (i < 0 || i >= MXB_AUDIOS) {
 			DEB_D(("illegal argument to MXB_S_AUDIO_CD: i:%d.\n",i));
 			return -EINVAL;
 		}
@@ -874,7 +874,7 @@ static int mxb_ioctl(struct saa7146_fh *
 	{
 		int i = *(int*)arg;
 				
-		if( i < 0 || i >= MXB_AUDIOS ) {
+		if (i < 0 || i >= MXB_AUDIOS) {
 			DEB_D(("illegal argument to MXB_S_AUDIO_LINE: i:%d.\n",i));
 			return -EINVAL;
 		}
@@ -889,7 +889,7 @@ static int mxb_ioctl(struct saa7146_fh *
 	{
 		struct v4l2_audio *a = arg;
 
-		if( a->index > MXB_INPUTS ) {
+		if (a->index > MXB_INPUTS) {
 	 		DEB_D(("VIDIOC_G_AUDIO %d out of range.\n",a->index));
 			return -EINVAL;
 		}
@@ -920,7 +920,7 @@ static int std_callback(struct saa7146_d
 	int zero = 0;
 	int one = 1;
 
-	if(V4L2_STD_PAL_I == std->id ) {
+	if (V4L2_STD_PAL_I == std->id) {
 		DEB_D(("VIDIOC_S_STD: setting mxb for PAL_I.\n"));
 		/* set the 7146 gpio register -- I don't know what this does exactly */
       		saa7146_write(dev, GPIO_CTRL, 0x00404050);
@@ -1006,7 +1006,7 @@ static struct saa7146_extension extensio
 
 static int __init mxb_init_module(void)
 {
-	if( 0 != saa7146_register_extension(&extension)) {
+	if (0 != saa7146_register_extension(&extension)) {
 		DEB_S(("failed to register extension.\n"));
 		return -ENODEV;
 	}



--===============71287537641529841==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71287537641529841==--

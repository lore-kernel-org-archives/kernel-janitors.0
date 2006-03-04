From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 19:09:43 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/macintosh
Message-Id: <1141499383.30193.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82574684985719249=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============82574684985719249==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/macintosh to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/macintosh/therm_pm72.c.orig	2006-03-04 19:30:49.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/therm_pm72.c	2006-03-04 19:31:03.000000000 +0100
@@ -306,10 +306,9 @@ static struct i2c_client *attach_i2c_chi
 	if (adap == NULL)
 		return NULL;
 
-	clt = kmalloc(sizeof(struct i2c_client), GFP_KERNEL);
+	clt = kzalloc(sizeof(struct i2c_client), GFP_KERNEL);
 	if (clt == NULL)
 		return NULL;
-	memset(clt, 0, sizeof(struct i2c_client));
 
 	clt->addr = (id >> 1) & 0x7f;
 	clt->adapter = adap;
--- linux-2.6.16-rc5-mm1/drivers/macintosh/windfarm_lm75_sensor.c.orig	2006-03-04 19:31:15.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/windfarm_lm75_sensor.c	2006-03-04 19:31:25.000000000 +0100
@@ -116,10 +116,9 @@ static struct wf_lm75_sensor *wf_lm75_cr
 	DBG("wf_lm75: creating  %s device at address 0x%02x\n",
 	    ds1775 ? "ds1775" : "lm75", addr);
 
-	lm = kmalloc(sizeof(struct wf_lm75_sensor), GFP_KERNEL);
+	lm = kzalloc(sizeof(struct wf_lm75_sensor), GFP_KERNEL);
 	if (lm == NULL)
 		return NULL;
-	memset(lm, 0, sizeof(struct wf_lm75_sensor));
 
 	/* Usual rant about sensor names not beeing very consistent in
 	 * the device-tree, oh well ...
--- linux-2.6.16-rc5-mm1/drivers/macintosh/smu.c.orig	2006-03-04 19:31:33.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/smu.c	2006-03-04 19:31:49.000000000 +0100
@@ -1035,10 +1035,9 @@ static int smu_open(struct inode *inode,
 	struct smu_private *pp;
 	unsigned long flags;
 
-	pp = kmalloc(sizeof(struct smu_private), GFP_KERNEL);
+	pp = kzalloc(sizeof(struct smu_private), GFP_KERNEL);
 	if (pp == 0)
 		return -ENOMEM;
-	memset(pp, 0, sizeof(struct smu_private));
 	spin_lock_init(&pp->lock);
 	pp->mode = smu_file_commands;
 	init_waitqueue_head(&pp->wait);
--- linux-2.6.16-rc5-mm1/drivers/macintosh/therm_windtunnel.c.orig	2006-03-04 19:31:57.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/therm_windtunnel.c	2006-03-04 19:32:11.000000000 +0100
@@ -431,9 +431,8 @@ do_probe( struct i2c_adapter *adapter, i
 				     | I2C_FUNC_SMBUS_WRITE_BYTE) )
 		return 0;
 
-	if( !(cl=kmalloc(sizeof(*cl), GFP_KERNEL)) )
+	if( !(cl=kzalloc(sizeof(*cl), GFP_KERNEL)) )
 		return -ENOMEM;
-	memset( cl, 0, sizeof(struct i2c_client) );
 
 	cl->addr = addr;
 	cl->adapter = adapter;
--- linux-2.6.16-rc5-mm1/drivers/macintosh/therm_adt746x.c.orig	2006-03-04 19:32:19.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/therm_adt746x.c	2006-03-04 19:32:35.000000000 +0100
@@ -379,13 +379,11 @@ static int attach_one_thermostat(struct 
 	if (thermostat)
 		return 0;
 
-	th = (struct thermostat *)
-		kmalloc(sizeof(struct thermostat), GFP_KERNEL);
+	th = kzalloc(sizeof(struct thermostat), GFP_KERNEL);
 
 	if (!th)
 		return -ENOMEM;
 
-	memset(th, 0, sizeof(*th));
 	th->clt.addr = addr;
 	th->clt.adapter = adapter;
 	th->clt.driver = &thermostat_driver;
--- linux-2.6.16-rc5-mm1/drivers/macintosh/macio_asic.c.orig	2006-03-04 19:32:45.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/macintosh/macio_asic.c	2006-03-04 19:33:09.000000000 +0100
@@ -407,10 +407,9 @@ static struct macio_dev * macio_add_one_
 	if (np == NULL)
 		return NULL;
 
-	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
-	memset(dev, 0, sizeof(*dev));
 
 	dev->bus = &chip->lbus;
 	dev->media_bay = in_bay;



--===============82574684985719249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82574684985719249==--

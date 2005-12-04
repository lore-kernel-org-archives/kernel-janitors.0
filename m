From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:19:08 +0000
Subject: [KJ] [PATCH 11/21] polling loops: change exit condition to
Message-Id: <439235FC.6080404@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

there were bug in drivers/media/dvb/ttpci/budget-av.c - loop might took 50s instead of 5 seconds as comment say!
DVB SUBSYSTEM AND DRIVERS
P:	LinuxTV.org Project
M: 	linux-dvb-maintainer@linuxtv.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/bt8xx/dst.c linux-2.6.15-rc4/drivers/media/dvb/bt8xx/dst.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/bt8xx/dst.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/bt8xx/dst.c	2005-12-03 16:53:10.000000000 +0100
@@ -182,9 +182,11 @@ EXPORT_SYMBOL(dst_pio_disable);
 int dst_wait_dst_ready(struct dst_state *state, u8 delay_mode)
 {
 	u8 reply;
-	int i;
+	int i = 0;
+	unsigned long end_time;
 
-	for (i = 0; i < 200; i++) {
+	end_time = jiffies + msecs_to_jiffies(2000);
+	while (time_before(jiffies, end_time)) {
 		if (dst_gpio_inb(state, &reply) < 0) {
 			dprintk(verbose, DST_ERROR, 1, "dst_gpio_inb ERROR !");
 			return -1;
@@ -194,6 +196,7 @@ int dst_wait_dst_ready(struct dst_state 
 			return 1;
 		}
 		msleep(10);
+		++i;
 	}
 	dprintk(verbose, DST_NOTICE, 1, "dst wait NOT ready after %d", i);
 
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/dvb-usb/dtt200u-fe.c linux-2.6.15-rc4/drivers/media/dvb/dvb-usb/dtt200u-fe.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/dvb-usb/dtt200u-fe.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/dvb-usb/dtt200u-fe.c	2005-12-03 16:53:10.000000000 +0100
@@ -105,7 +105,7 @@ static int dtt200u_fe_set_frontend(struc
 				  struct dvb_frontend_parameters *fep)
 {
 	struct dtt200u_fe_state *state = fe->demodulator_priv;
-	int i;
+	unsigned long end_time;
 	fe_status_t st;
 	u16 freq = fep->frequency / 250000;
 	u8 bwbuf[2] = { SET_BANDWIDTH, 0 },freqbuf[3] = { SET_RF_FREQ, 0, 0 };
@@ -125,7 +125,8 @@ static int dtt200u_fe_set_frontend(struc
 	freqbuf[2] = (freq >> 8) & 0xff;
 	dvb_usb_generic_write(state->d,freqbuf,3);
 
-	for (i = 0; i < 30; i++) {
+	end_time = jiffies + msecs_to_jiffies(600);
+	while (time_before(jiffies, end_time)) {
 		msleep(20);
 		dtt200u_fe_read_status(fe, &st);
 		if (st & FE_TIMEDOUT)
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/frontends/nxt2002.c linux-2.6.15-rc4/drivers/media/dvb/frontends/nxt2002.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/frontends/nxt2002.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/frontends/nxt2002.c	2005-12-03 16:53:10.000000000 +0100
@@ -158,18 +158,19 @@ static int nxt2002_readreg_multibyte (st
 
 static void nxt2002_microcontroller_stop (struct nxt2002_state* state)
 {
-	u8 buf[2],counter = 0;
+	u8 buf[2];
+	unsigned long end_time;
 	dprintk("%s\n", __FUNCTION__);
 
 	buf[0] = 0x80;
 	i2c_writebytes(state,0x22,buf,1);
 
-	while (counter < 20) {
+	end_time = jiffies + msecs_to_jiffies(200);
+	while (time_before(jiffies, end_time)) {
 		i2c_readbytes(state,0x31,buf,1);
 		if (buf[0] & 0x40)
 			return;
 		msleep(10);
-		counter++;
 	}
 
 	dprintk("Timeout waiting for micro to stop.. This is ok after firmware upload\n");
@@ -187,7 +188,8 @@ static void nxt2002_microcontroller_star
 
 static int nxt2002_writetuner (struct nxt2002_state* state, u8* data)
 {
-	u8 buf,count = 0;
+	u8 buf;
+	unsigned long end_time;
 
 	dprintk("Tuner Bytes: %02X %02X %02X %02X\n",data[0],data[1],data[2],data[3]);
 
@@ -214,12 +216,12 @@ static int nxt2002_writetuner (struct nx
 	buf = 0x80;
 	i2c_writebytes(state,0x21,&buf,1);
 
-	while (count < 20) {
+	end_time = jiffies + msecs_to_jiffies(2000);
+	while (time_before(jiffies, end_time)) {
 		i2c_readbytes(state,0x21,&buf,1);
 		if ((buf & 0x80)= 0x00)
 			return 0;
 		msleep(100);
-		count++;
 	}
 
 	printk("nxt2002: timeout error writing tuner\n");
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/frontends/tda80xx.c linux-2.6.15-rc4/drivers/media/dvb/frontends/tda80xx.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/frontends/tda80xx.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/frontends/tda80xx.c	2005-12-03 16:53:10.000000000 +0100
@@ -389,9 +389,10 @@ static void tda80xx_worklet(void *priv)
 
 static void tda80xx_wait_diseqc_fifo(struct tda80xx_state* state)
 {
-	size_t i;
+	unsigned long end_time;
 
-	for (i = 0; i < 100; i++) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time)) {
 		if (tda80xx_readreg(state, 0x02) & 0x80)
 			break;
 		msleep(10);
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/ttpci/av7110.c linux-2.6.15-rc4/drivers/media/dvb/ttpci/av7110.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/ttpci/av7110.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/ttpci/av7110.c	2005-12-03 16:53:10.000000000 +0100
@@ -1978,7 +1978,7 @@ static int nexusca_stv0297_pll_set(struc
 	u8 data[4];
 	struct i2c_msg msg = { .addr = 0x63, .flags = 0, .buf = data, .len = sizeof(data) };
 	struct i2c_msg readmsg = { .addr = 0x63, .flags = I2C_M_RD, .buf = data, .len = 1 };
-	int i;
+	unsigned long end_time;
 
 	div = (params->frequency + 36150000 + 31250) / 62500;
 
@@ -2004,8 +2004,8 @@ static int nexusca_stv0297_pll_set(struc
 	}
 
 	// wait for PLL lock
-	for(i = 0; i < 20; i++) {
-
+	end_time = jiffies + msecs_to_jiffies(200);
+	while (time_before(jiffies, end_time)) {
 		stv0297_enable_plli2c(fe);
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) = 1)
 			if (data[0] & 0x40) break;
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/dvb/ttpci/budget-av.c linux-2.6.15-rc4/drivers/media/dvb/ttpci/budget-av.c
--- linux-2.6.15-rc4-orig/drivers/media/dvb/ttpci/budget-av.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/dvb/ttpci/budget-av.c	2005-12-03 16:53:10.000000000 +0100
@@ -192,7 +192,7 @@ static int ciintf_slot_reset(struct dvb_
 {
 	struct budget_av *budget_av = (struct budget_av *) ca->data;
 	struct saa7146_dev *saa = budget_av->budget.dev;
-	int timeout = 500; // 5 seconds (4.4.6 Ready)
+	unsigned long end_time;
 
 	if (slot != 0)
 		return -EINVAL;
@@ -210,10 +210,11 @@ static int ciintf_slot_reset(struct dvb_
 
 	/* This should have been based on pin 16 READY of the pcmcia port,
 	 * but AFAICS it is not routed to the saa7146 */
-	while (--timeout > 0 && ciintf_read_attribute_mem(ca, slot, 0) != 0x1d)
+	end_time = jiffies + msecs_to_jiffies(5000); // 5 seconds (4.4.6 Ready)
+	while (time_before(jiffies, end_time) && ciintf_read_attribute_mem(ca, slot, 0) != 0x1d)
 		msleep(100);
 
-	if (timeout <= 0)
+	if (time_after_eq(jiffies, end_time))
 	{
 		printk(KERN_ERR "budget-av: cam reset failed (timeout).\n");
 		saa7146_setgpio(saa, 2, SAA7146_GPIO_OUTHI); /* disable card */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

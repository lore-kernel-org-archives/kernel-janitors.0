From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:36:10 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-maestro: replace
Message-Id: <20040726223610.GH1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25700081648035544=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25700081648035544==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replaced sleep_125ms() with msleep(125), udelay2()
with udelay(2), udelay4() with udelay(4) and udelay16() with
udelay(16) and removed the replaced functions' definitions.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-maestro.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-maestro.c	2004-07-02 20:41:43.000000000 +0000
@@ -93,27 +93,6 @@ static struct radio_device
 	struct  semaphore lock;
 } radio_unit = {0, 0, 0, 0, };
 
-static void sleep_125ms(void)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ >> 3);
-}
-
-static void udelay2(void)
-{
-	udelay(2);
-}
-
-static void udelay4(void)
-{
-	udelay(4);
-}
-
-static void udelay16(void)
-{
-	udelay(16);
-}
-
 static __u32 radio_bits_get(struct radio_device *dev)
 {
 	register __u16 io=dev->io, l, rdata;
@@ -122,14 +101,15 @@ static __u32 radio_bits_get(struct radio
 	omask = inw(io + IO_MASK);
 	outw(~(STR_CLK | STR_WREN), io + IO_MASK);
 	outw(0, io);
-	udelay16();
+	udelay(16);
+
 	for (l=24;l--;) {
 		outw(STR_CLK, io);		/* HI state */
-		udelay2();
+		udelay(2);
 		if(!l) 
 			dev->tuned = inw(io) & STR_MOST ? 0 : 0xffff;
 		outw(0, io);			/* LO state */
-		udelay2();
+		udelay(2);
 		data <<= 1;			/* shift data */
 		rdata = inw(io);
 		if(!l)
@@ -138,11 +118,11 @@ static __u32 radio_bits_get(struct radio
 		else
 			if(rdata & STR_DATA)
 				data++;
-		udelay2();
+		udelay(2);
 	}
 	if(dev->muted)
 		outw(STR_WREN, io);
-	udelay4();
+	udelay(4);
 	outw(omask, io + IO_MASK);
 	return data & 0x3ffe;
 }
@@ -155,23 +135,23 @@ static void radio_bits_set(struct radio_
 	odir  = (inw(io + IO_DIR) & ~STR_DATA) | (STR_CLK | STR_WREN);
 	outw(odir | STR_DATA, io + IO_DIR);
 	outw(~(STR_DATA | STR_CLK | STR_WREN), io + IO_MASK);
-	udelay16();
+	udelay(16);
 	for (l=25;l;l--) {
 		bits = ((data >> 18) & STR_DATA) | STR_WREN ;
 		data <<= 1;			/* shift data */
 		outw(bits, io);			/* start strobe */
-		udelay2();
+		udelay(2);
 		outw(bits | STR_CLK, io);	/* HI level */
-		udelay2();   
+		udelay(2);   
 		outw(bits, io);			/* LO level */
-		udelay4();
+		udelay(4);
 	}
 	if(!dev->muted)
 		outw(0, io);
-	udelay4();
+	udelay(4);
 	outw(omask, io + IO_MASK);
 	outw(odir, io + IO_DIR);
-	sleep_125ms();
+	msleep(125);
 }
 
 inline static int radio_function(struct inode *inode, struct file *file,
@@ -238,9 +218,9 @@ inline static int radio_function(struct 
 				outw(~STR_WREN, io + IO_MASK);
 				outw((card->muted = v->flags & VIDEO_AUDIO_MUTE)
 				     ? STR_WREN : 0, io);
-				udelay4();
+				udelay(4);
 				outw(omask, io + IO_MASK);
-				sleep_125ms();
+				msleep(125);
 				return 0;
 			}
 		}
@@ -315,7 +295,7 @@ inline static __u16 radio_power_on(struc
 	outw(odir, io + IO_DIR);
 	outw(~(STR_WREN | STR_CLK), io + IO_MASK);
 	outw(dev->muted ? 0 : STR_WREN, io);
-	udelay16();
+	udelay(16);
 	outw(omask, io + IO_MASK);
 	ofreq = radio_bits_get(dev);
 	if((ofreq<FREQ2BITS(FREQ_LO)) || (ofreq>FREQ2BITS(FREQ_HI)))

--===============25700081648035544==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25700081648035544==--

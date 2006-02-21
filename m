From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 21 Feb 2006 08:47:19 +0000
Subject: [kj][Patch][update] remove implicit sign bit on single bit
Message-Id: <1140511640.7780.23.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26558787819385232=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26558787819385232==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-02-21 at 00:34 +0300, Alexey Dobriyan wrote:
> On Thu, Feb 09, 2006 at 09:21:24PM +1100, Darren Jenkins" wrote:
> > --- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig
> > +++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c
> > @@ -306,9 +306,8 @@ struct via_info {
> >  	unsigned intmask: 1;	/* Needs int bits */
> >  	unsigned sixchannel: 1;	/* 8233/35 with 6 channel support */
> >  	unsigned volume: 1;
> > +	unsigned locked_rate : 1;
> >
> > -	int locked_rate : 1;
> > -
> >  	int mixer_vol;		/* 8233/35 volume  - not yet implemented */
> > 
> >  	struct semaphore syscall_sem;
> 
> These patches are OK, except
> 
> 	unsigned int a:1;
> 
> is preferred. 
> 

Yep, that was pointed out to me earlier. I hadn't gone through them to
change them all yet.

I think the via82cxxx_audio.c patch should stay the same as the local
context uses "unsigned foo:1;" but if you want I can do a patch that
converts the whole file to "unsigned int foo:1;" style.

Here is a re-work of the other patches.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/media/video/videocodec.h.orig	2006-02-21 18:59:38.000000000 +1100
+++ linux-2.6.16-rc3/drivers/media/video/videocodec.h	2006-02-21 19:04:18.000000000 +1100
@@ -222,14 +222,14 @@ M                       zr36055[1] 0001 
 /* ========================= */
 
 struct vfe_polarity {
-	int vsync_pol:1;
-	int hsync_pol:1;
-	int field_pol:1;
-	int blank_pol:1;
-	int subimg_pol:1;
-	int poe_pol:1;
-	int pvalid_pol:1;
-	int vclk_pol:1;
+	unsigned int vsync_pol:1;
+	unsigned int hsync_pol:1;
+	unsigned int field_pol:1;
+	unsigned int blank_pol:1;
+	unsigned int subimg_pol:1;
+	unsigned int poe_pol:1;
+	unsigned int pvalid_pol:1;
+	unsigned int vclk_pol:1;
 };
 
 struct vfe_settings {
--- linux-2.6.16-rc3/drivers/media/dvb/frontends/l64781.c.orig	2006-02-21 19:10:39.000000000 +1100
+++ linux-2.6.16-rc3/drivers/media/dvb/frontends/l64781.c	2006-02-21 19:10:52.000000000 +1100
@@ -37,7 +37,7 @@ struct l64781_state {
 	struct dvb_frontend frontend;
 
 	/* private demodulator data */
-	int first:1;
+	unsigned int first:1;
 };
 
 #define dprintk(args...) \
--- linux-2.6.16-rc3/drivers/isdn/hisax/isdnhdlc.h.orig	2006-02-21 19:14:23.000000000 +1100
+++ linux-2.6.16-rc3/drivers/isdn/hisax/isdnhdlc.h	2006-02-21 19:19:25.000000000 +1100
@@ -41,10 +41,10 @@ struct isdnhdlc_vars {
 	unsigned char shift_reg;
 	unsigned char ffvalue;
 
-	int data_received:1; 	// set if transferring data
-	int dchannel:1; 	// set if D channel (send idle instead of flags)
-	int do_adapt56:1; 	// set if 56K adaptation
-        int do_closing:1; 	// set if in closing phase (need to send CRC + flag
+	unsigned int data_received:1; 	// set if transferring data
+	unsigned int dchannel:1; 	// set if D channel (send idle instead of flags)
+	unsigned int do_adapt56:1; 	// set if 56K adaptation
+	unsigned int do_closing:1; 	// set if in closing phase (need to send CRC + flag
 };
 




--===============26558787819385232==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26558787819385232==--

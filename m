From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:41:56 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-sf16fmi: replace
Message-Id: <20040726224156.GJ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24323633299886716=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24323633299886716==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replaced schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-sf16fmi.c	2004-06-16 05:20:03.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-sf16fmi.c	2004-07-02 20:46:57.000000000 +0000
@@ -89,8 +89,7 @@ static inline int fmi_setfreq(struct fmi
 
 	outbits(16, RSF16_ENCODE(freq), myport);
 	outbits(8, 0xC0, myport);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ/7);
+	msleep(143);		/* was schedule_timeout(HZ/7) */
 	up(&lock);
 	if (dev->curvol) fmi_unmute(myport);
 	return 0;
@@ -107,8 +106,7 @@ static inline int fmi_getsigstr(struct f
 	val = dev->curvol ? 0x08 : 0x00;	/* unmute/mute */
 	outb(val, myport);
 	outb(val | 0x10, myport);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/7);
+	msleep(143); 		/* was schedule_timeout(HZ/7) */
 	res = (int)inb(myport+1);
 	outb(val, myport);
 	

--===============24323633299886716==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24323633299886716==--

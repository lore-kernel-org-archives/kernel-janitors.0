From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:11:43 +0000
Subject: [Kernel-janitors] [PATCH] video/zoran_device: replace
Message-Id: <20040726231143.GW1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48883438547491348=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48883438547491348==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/zoran_device.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/media/video/zoran_device.c	2004-07-02 21:44:56.000000000 +0000
@@ -1105,8 +1105,7 @@ zr36057_enable_jpg (struct zoran        
 			ZR36057_ISR);
 		btand(~ZR36057_JMC_Go_en, ZR36057_JMC);	// \Go_en
 
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ / 20);
+		msleep(50);
 
 		set_videobus_dir(zr, 0);
 		set_frame(zr, 1);	// /FRAME

--===============48883438547491348==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48883438547491348==--

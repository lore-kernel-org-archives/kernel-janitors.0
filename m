From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:04:13 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 13/17] media/saa7134-ts: replace
Message-Id: <20040920220413.GS2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68557932626440254=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68557932626440254==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/saa7134/saa7134-ts.c	2004-09-13 17:15:39.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/saa7134/saa7134-ts.c	2004-09-20 10:03:35.000000000 -0700
@@ -176,8 +176,7 @@ static void ts_reset_encoder(struct saa7
 	saa_writeb(SAA7134_SPECIAL_MODE, 0x00);
 	mdelay(10);
    	saa_writeb(SAA7134_SPECIAL_MODE, 0x01);
-   	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+   	msleep_interruptible(100);
 }
 
 static int ts_init_encoder(struct saa7134_dev* dev, void* arg) 

--===============68557932626440254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68557932626440254==--

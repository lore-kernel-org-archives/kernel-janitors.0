From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:02:33 +0000
Subject: [Kernel-janitors] [PATCH] video/saa7134-ts: replace
Message-Id: <20040726230233.GV1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============036292039442646473=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726225911.GU1897@us.ibm.com>
In-Reply-To: <20040726225911.GU1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============036292039442646473==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/saa7134/saa7134-ts.c	2004-06-16 05:18:52.000000000 +0000
+++ linux-dev/drivers/media/video/saa7134/saa7134-ts.c	2004-07-12 18:54:50.000000000 +0000
@@ -173,8 +173,7 @@ static void ts_reset_encoder(struct saa7
 	saa_writeb(SAA7134_SPECIAL_MODE, 0x00);
 	mdelay(10);
    	saa_writeb(SAA7134_SPECIAL_MODE, 0x01);
-   	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+   	msleep(100);
 }
 
 static int ts_init_encoder(struct saa7134_dev* dev, void* arg) 

--===============036292039442646473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============036292039442646473==--

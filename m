From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:03:02 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 11/17] media/saa6752hs: replace
Message-Id: <20040920220302.GQ2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============051453679206148184=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============051453679206148184==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/saa7134/saa6752hs.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/saa7134/saa6752hs.c	2004-09-20 15:01:25.000000000 -0700
@@ -168,13 +168,11 @@ static int saa6752hs_chip_command(struct
 		}
 	
 		// wait a bit
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep_interruptible(10);
 	}
 
 	// delay a bit to let encoder settle
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/20);
+	msleep_interruptible(50);
 	
 	// done
   	return status;

--===============051453679206148184==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============051453679206148184==--

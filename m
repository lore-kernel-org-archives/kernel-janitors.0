From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:56:53 +0000
Subject: [Kernel-janitors] [PATCH] video/saa6752hs: replace
Message-Id: <20040726225653.GS1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95171121366793043=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95171121366793043==
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


--- linux-vanilla/drivers/media/video/saa7134/saa6752hs.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/media/video/saa7134/saa6752hs.c	2004-07-12 18:54:32.000000000 +0000
@@ -168,13 +168,11 @@ static int saa6752hs_chip_command(struct
 		}
 	
 		// wait a bit
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 
 	// delay a bit to let encoder settle
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/20);
+	msleep(50);
 	
 	// done
   	return status;

--===============95171121366793043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95171121366793043==--

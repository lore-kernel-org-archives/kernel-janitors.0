From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:53:29 +0000
Subject: [Kernel-janitors] [PATCH] scsi/sata_sx4: replace schedule_timeout()
Message-Id: <20040727225329.GC4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53532375878972061=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53532375878972061==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/sata_sx4.c	2004-06-16 05:18:37.000000000 +0000
+++ linux-dev/drivers/scsi/sata_sx4.c	2004-07-06 00:54:35.000000000 +0000
@@ -1128,8 +1128,7 @@ static unsigned int pdc20621_prog_dimm_g
 	   		error = 0;
 	   		break;     
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((i * 100) * HZ / 1000 + 1);
+		msleep(i*100);
    	}
    	return error;
 }
@@ -1162,8 +1161,7 @@ static unsigned int pdc20621_dimm_init(s
 	readl(mmio + PDC_TIME_CONTROL);
 
 	/* Wait 3 seconds */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(3 * HZ);
+	msleep(3000);
 
 	/* 
 	   When timer is enabled, counter is decreased every internal

--===============53532375878972061==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53532375878972061==--

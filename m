From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:29:37 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 12/16] scsi/sata_sx4: replace
Message-Id: <20040927182937.GA1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2108116163620668=="
List-Id: <kernel-janitors.vger.kernel.org>
To: James.Bottomley@SteelEye.com, jgarzik@pobox.com
Cc: kernel-janitors@lists.osdl.org, linux-ide@vger.kernel.org

--===============2108116163620668==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/ssleep() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as
expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/sata_sx4.c	2004-09-13 17:15:56.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/sata_sx4.c	2004-09-27 11:28:10.000000000 -0700
@@ -1189,8 +1189,7 @@ static unsigned int pdc20621_prog_dimm_g
 	   		error = 0;
 	   		break;     
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((i * 100) * HZ / 1000 + 1);
+		msleep(i * 100);
    	}
    	return error;
 }
@@ -1223,8 +1222,7 @@ static unsigned int pdc20621_dimm_init(s
 	readl(mmio + PDC_TIME_CONTROL);
 
 	/* Wait 3 seconds */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(3 * HZ);
+	ssleep(3);
 
 	/* 
 	   When timer is enabled, counter is decreased every internal

--===============2108116163620668==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2108116163620668==--

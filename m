From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:13:19 +0000
Subject: [Kernel-janitors] [PATCH] s390/lcs: replace schedule_timeout() with
Message-Id: <20040727221319.GF3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============024725762321277323=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============024725762321277323==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/s390/net/lcs.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/s390/net/lcs.c	2004-07-14 16:30:07.000000000 +0000
@@ -1420,7 +1420,7 @@ lcs_resetcard(struct lcs_card *card)
 				   card->dev->name);
 			return 0;
 		}
-		schedule_timeout(3 * HZ);
+		msleep(3000);
 	}
 	PRINT_ERR("Error in Reseting LCS card!\n");
 	return -EIO;

--===============024725762321277323==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============024725762321277323==--

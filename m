From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:19:26 +0000
Subject: [Kernel-janitors] [PATCH 5/5] atm/lanai: replace schedule_timeout()
Message-Id: <20040915181926.GF4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45187639020037551=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45187639020037551==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: msleep() is used instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-mm4-vanilla/drivers/atm/lanai.c	2004-09-09 23:05:55.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/atm/lanai.c	2004-09-10 10:02:07.000000000 -0700
@@ -813,7 +813,7 @@ static void lanai_shutdown_tx_vci(struct
 			DPRINTK("read, write = %d, %d\n", read, write);
 			break;
 		}
-		schedule_timeout(HZ / 25);
+		msleep(40);
 	}
 	/* 15.2.2 - clear out all tx registers */
 	cardvcc_write(lvcc, 0, vcc_txreadptr);

--===============45187639020037551==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45187639020037551==--

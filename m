From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 18:04:18 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-aimslab: replace
Message-Id: <20040726180418.GZ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76090865132137031=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76090865132137031==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of a while-loop and schedule(). Thus
the CPU is given up for the time desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-aimslab.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-aimslab.c	2004-07-02 21:41:46.000000000 +0000
@@ -63,12 +63,7 @@ static void sleep_delay(long n)
 	if(!d)
 		udelay(n);
 	else
-	{
-		/* Yield CPU time */
-		unsigned long x=jiffies;
-		while((jiffies-x)<=d)
-			schedule();
-	}
+		msleep(jiffies_to_msecs(d));
 }
 
 static void rt_decvol(void)

--===============76090865132137031==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76090865132137031==--

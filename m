From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:43:51 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-sf16fmr2: replace
Message-Id: <20040726224351.GK1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033761666397175816=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726224156.GJ1897@us.ibm.com>
In-Reply-To: <20040726224156.GJ1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============033761666397175816==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replaced schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-sf16fmr2.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-sf16fmr2.c	2004-07-02 21:42:03.000000000 +0000
@@ -62,10 +62,7 @@ static void sleep_delay(unsigned long n)
 	if (!d)
 		udelay(n);
 	else
-	{
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(d);
-	}
+		msleep(jiffies_to_msecs(d));
 }
 
 static inline void wait(int n,int port)

--===============033761666397175816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033761666397175816==--

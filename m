From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 17:31:48 +0000
Subject: Re: [Kernel-janitors] [PATCH] radio/radio-sf16fmr2:
Message-Id: <20040727173148.GK2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70387796914059453=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726224156.GJ1897@us.ibm.com>
In-Reply-To: <20040726224156.GJ1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============70387796914059453==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 10:14:49AM -0400, Mark Hollomon wrote:
> since sleep_delay is only called once (with the intent to sleep for 110 
> ms), wouldn't it be better to simply replace the call to sleep_delay 
> with msleep (and remove sleep_delay)?

I wasn't sure if I should leave the function in, in case someone wanted
to modify the driver later. But, if you think it's ok, find this fix below.
Thanks again, Mark.

-Nish


Applys-to: 2.6.7

Description: Replace single invocation of sleep_delay() with msleep() and
remove definition of sleep_delay().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-sf16fmr2.c	2004-06-15 22:19:22.000000000 -0700
+++ linux-dev/drivers/media/radio/radio-sf16fmr2.c	2004-07-27 10:29:49.000000000 -0700
@@ -55,19 +55,6 @@ static int radio_nr = -1;
 #define RSF16_MINFREQ 87*16000
 #define RSF16_MAXFREQ 108*16000
 
-/* from radio-aimslab */
-static void sleep_delay(unsigned long n)
-{
-	unsigned d=n/(1000000U/HZ);
-	if (!d)
-		udelay(n);
-	else
-	{
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(d);
-	}
-}
-
 static inline void wait(int n,int port)
 {
 	for (;n;--n) inb(port);
@@ -153,7 +140,7 @@ static int fmr2_setfreq(struct fmr2_devi
 	fmr2_unmute(port);
 
 	/* wait 0.11 sec */
-	sleep_delay(110000LU);
+	msleep(110);
 
 	/* NOTE if mute this stop radio
 	   you must set freq on unmute */


--===============70387796914059453==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70387796914059453==--

From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 17:29:22 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 15/33] char/istallion: replace
Message-Id: <20040924172922.GE1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5690873176235991=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916170546.GH1777@us.ibm.com>
In-Reply-To: <20040916170546.GH1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============5690873176235991==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 16, 2004 at 10:05:46AM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated. I'm not sure if I did the desired
> thing here, as I got rid of stli_delay() completely. After the
> msleep_interruptible() replacement, stli_delay() would only be used in
> one place. I'm not sure which way is preferred (the original or mine)
> regarding the second change, therefore.
> 
> Description: Use msleep_interruptible() instead of stli_delay() to
> guarantee the task delays as expected. Removed the definition /
> prototype of stli_delay() as it was only called in one other place,
> where I made the direct change to
> set_current_state()/schedule_timeout().
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

<snip>

> @@ -2504,7 +2484,8 @@ static void stli_waituntilsent(struct tt
>  	while (test_bit(ST_TXBUSY, &portp->state)) {
>  		if (signal_pending(current))
>  			break;
> -		stli_delay(2);
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule_timeout(2);

As per Andrew Morton's response, I have used msleep_interruptible(20) in
this case. Please find the corrected patch below.


--- 2.6.9-rc2-vanilla/drivers/char/istallion.c	2004-09-13 17:15:50.000000000 -0700
+++ 2.6.9-rc2/drivers/char/istallion.c	2004-09-24 10:27:24.000000000 -0700
@@ -691,7 +691,6 @@ static int	stli_rawopen(stlibrd_t *brdp,
 static int	stli_rawclose(stlibrd_t *brdp, stliport_t *portp, unsigned long arg, int wait);
 static int	stli_waitcarrier(stlibrd_t *brdp, stliport_t *portp, struct file *filp);
 static void	stli_dohangup(void *arg);
-static void	stli_delay(int len);
 static int	stli_setport(stliport_t *portp);
 static int	stli_cmdwait(stlibrd_t *brdp, stliport_t *portp, unsigned long cmd, void *arg, int size, int copyback);
 static void	stli_sendcmd(stlibrd_t *brdp, stliport_t *portp, unsigned long cmd, void *arg, int size, int copyback);
@@ -1180,7 +1179,7 @@ static void stli_close(struct tty_struct
 
 	if (portp->openwaitcnt) {
 		if (portp->close_delay)
-			stli_delay(portp->close_delay);
+			msleep_interruptible(jiffies_to_msecs(portp->close_delay));
 		wake_up_interruptible(&portp->open_wait);
 	}
 
@@ -1478,25 +1477,6 @@ static int stli_setport(stliport_t *port
 /*****************************************************************************/
 
 /*
- *	Wait for a specified delay period, this is not a busy-loop. It will
- *	give up the processor while waiting. Unfortunately this has some
- *	rather intimate knowledge of the process management stuff.
- */
-
-static void stli_delay(int len)
-{
-#ifdef DEBUG
-	printk("stli_delay(len=%d)\n", len);
-#endif
-	if (len > 0) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(len);
-	}
-}
-
-/*****************************************************************************/
-
-/*
  *	Possibly need to wait for carrier (DCD signal) to come high. Say
  *	maybe because if we are clocal then we don't need to wait...
  */
@@ -2504,7 +2484,7 @@ static void stli_waituntilsent(struct tt
 	while (test_bit(ST_TXBUSY, &portp->state)) {
 		if (signal_pending(current))
 			break;
-		stli_delay(2);
+		msleep_interruptible(20);
 		if (time_after_eq(jiffies, tend))
 			break;
 	}

--===============5690873176235991==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5690873176235991==--

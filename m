From: "chas williams (contractor)" <chas@cmf.nrl.navy.mil>
Date: Thu, 22 Jul 2004 12:36:07 +0000
Subject: [Kernel-janitors] Re: [PATCH] he: replace schedule_timeout() with
Message-Id: <200407221236.i6MCa7w9016397@ginger.cmf.nrl.navy.mil>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62697998381038023=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62697998381038023==

its never been critical that the he sleeps the exact time indicated
but using msleep() doesnt bother me either.

In message <20040719211559.GA5209@us.ibm.com>,Nishanth Aravamudan writes:
>I would appreciate any comments from the janitors list. If this is ok, I
>have many more with similar fixes.
>
>Thanks,
>Nish
>
>
>
>Applys-to: 2.6.7
>
>Description: Uses msleep() instead of schedule_timeout() to guarantee
>the task delays at least the desired time amount.
>
>Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>--- linux-vanilla/drivers/atm/he.c	2004-06-16 05:18:59.000000000 +0000
>+++ linux-dev/drivers/atm/he.c	2004-07-02 17:19:27.000000000 +0000
>@@ -2595,8 +2595,7 @@ he_close(struct atm_vcc *vcc)
> 
> 		while (((tx_inuse = atomic_read(&vcc->sk->sk_wmem_alloc)) > 0) 
>&&
> 		       (retry < MAX_RETRY)) {
>-			set_current_state(TASK_UNINTERRUPTIBLE);
>-			(void) schedule_timeout(sleep);
>+			msleep(jiffies_to_msecs(sleep));
> 			if (sleep < HZ)
> 				sleep = sleep * 2;
> 
>

--===============62697998381038023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62697998381038023==--

From: Michael Hunold <hunold@convergence.de>
Date: Tue, 27 Jul 2004 14:44:36 +0000
Subject: [Kernel-janitors] Re: [PATCH] saa7146_i2c: replace
Message-Id: <41066A54.8080701@convergence.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41653668214081074=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41653668214081074==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello Nishanth,

I'm sorry for the long delay. As I already explained in the mail I sent 
to linux-dvb-maintainer (yes, I'm working on both projects) some mails 
were "caught" by my spam filter and then we had a power failure in our 
company which resulted in a huge mail overload.

> Another fix thanks to Mark Hollomon. The call
> 
> msleep(ms/10);
> 
> will result in rounding errors due to the integer evaluation of ms/10
> before the msleep() call. This leads to 0ms timeouts. Therefore, I have
> reinserted the 1msec offset. Please find the correction below and sorry
> for the repeated repeated patches.

> --- linux-vanilla/drivers/media/common/saa7146_i2c.c	2004-06-15 22:20:04.000000000 -0700
> +++ linux-dev/drivers/media/common/saa7146_i2c.c	2004-07-26 10:27:26.000000000 -0700
> @@ -1,11 +1,11 @@
>  #include <linux/version.h>
>  #include <media/saa7146_vv.h>
>  
> -/* helper function */
> +/* helper function
> +   Note: ms is in terms of tenths of a msec */
>  static void my_wait(struct saa7146_dev *dev, long ms)
>  {
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout((((ms+10)/10)*HZ)/1000);
> +	msleep((ms+10)/10);
>  }

I admit that this "my_wait" functions is totally bogus. It's obsolete 
and it's obviously not doing what's expected (ie. wait some milliseconds).

It's only used in the time-uncritical i2c code of my saa7146 driver. 
When I wrote that code, I obviously wanted to wait a certain amount of ms.

So please do me a favour and nuke that function completely and simply 
replace it with msleep(). It has worked with the broken code before, now 
only the waits will be 10 times longer for some error paths. The normal 
code paths are not affected because either irq based i2c transactions 
are used or tight udelay() loops are performed.

Is msleep() already available in 2.6.x?
How will these patches be included in 2.6?
Who is going to post patches to whom?
Do you need me to sign-off the saa7146 patches or should I prepare and 
send them instead?

CU
Michael.

--===============41653668214081074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41653668214081074==--

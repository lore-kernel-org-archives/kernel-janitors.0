From: Willem Riede <osst@riede.org>
Date: Tue, 27 Jul 2004 23:36:54 +0000
Subject: [Kernel-janitors] Re: [PATCH] scsi/osst: replace schedule_timeout()
Message-Id: <1090971414l.8423l.3l@serve.riede.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/27/2004 06:47:32 PM, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch.

While the exact delay for any schedule_timeout() in osst is usually not
important, because there are outer loops that cause us to wait until the
expected event takes place, I don't mind this change, with one exception:
I don't want to assume the value of HZ, so the values flagged below are
not acceptable.

Willem Riede, osst maintainer.

> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the task
> delays as desired.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/scsi/osst.c	2004-06-15 22:19:22.000000000 -0700
> +++ linux-dev/drivers/scsi/osst.c	2004-07-27 15:45:31.000000000 -0700
[snip]
> -	    set_current_state(TASK_INTERRUPTIBLE);
> -	    schedule_timeout(HZ / 10);
> +	    msleep(100);
                  ^^^^^  must be HZ/10
[snip]
> -	    set_current_state(TASK_INTERRUPTIBLE);
> -	    schedule_timeout(HZ / 10);
> +	    msleep(100);
                  ^^^^^  must be HZ/10
[snip]
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		schedule_timeout (HZ / OSST_POLL_PER_SEC);
> +		msleep(1000 / OSST_POLL_PER_SEC);
                       ^^^^  must be HZ/OSST_POLL_PER_SEC
[snip]
> -						schedule_timeout(HZ / 10);
> +						msleep(100);
                                                      ^^^^^ must be HZ/10



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

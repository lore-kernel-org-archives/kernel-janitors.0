From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 19 Mar 2007 18:44:12 +0000
Subject: Re: [KJ] do all schedule_timeout() calls need to set state first?
Message-Id: <20070319184412.GF774@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703191358530.13393@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703191358530.13393@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19.03.2007 [14:00:53 -0400], Robert P. J. Day wrote:
> 
>   based on what i've been reading, all calls to schedule_timeout()
> *must* first set the current process state to either
> TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE, is that correct?

Yes, but note that setting it directly before is not always necessary,
in particular when used with wait-queues. But, take a look at the
comment heading schedule_timeout():

 * Make the current task sleep until @timeout jiffies have elapsed. The
 * routine will return immediately unless the current task state has
 * been set (see set_current_state()).

>   since i was once again perusing the source tree and noticed the
> following in drivers/hwmon/ams/ams-i2c.c (line 93):
> 
>         while (remaining) {
>                 result = ams_i2c_read(AMS_COMMAND);
>                 if (result = 0 || result & 0x80)
>                         return 0;
> 
>                 remaining = schedule_timeout(remaining);
>         }
> 
> it certainly *seems* that the state isn't being set here.  is that an
> error?  just curious.

Yes, it is. That is why we have schedule_timeout_interruptible() and
schedule_timeout_uninterruptible().

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

From: "Miller, Mike (OS Dev)" <mike.miller@hp.com>
Date: Wed, 28 Jul 2004 22:51:39 +0000
Subject: RE: [Kernel-janitors] RE: [PATCH] cciss: replace schedule_timeout()
Message-Id: <D4CFB69C345C394284E4B78B876C1CF107DBFB7C@cceexc23.americas.cpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <D4CFB69C345C394284E4B78B876C1CF107DBFB62@cceexc23.americas.cpqcorp.net>
In-Reply-To: <D4CFB69C345C394284E4B78B876C1CF107DBFB62@cceexc23.americas.cpqcorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nish,
Sorry I've taken so long to respond. I just figured out yesterday that my Linux mail was not going out :(

I agree about TASK_INTERRUPTIBLE, but in all the 2.6.x code I've looked at we are using TASK_UNINTERRUPTIBLE.
If Greg Kroah-Hartman would care to elaborate on the problems using that I am open to new ideas & suggestions.

Thanks,
mikem
-----Original Message-----
From: Nish Aravamudan [mailto:nish.aravamudan@gmail.com]
Sent: Friday, July 23, 2004 6:27 PM
To: Miller, Mike (OS Dev)
Cc: kernel-janitors@lists.osdl.org
Subject: Re: [Kernel-janitors] RE: [PATCH] cciss: replace
schedule_timeout() with msleep()


uOn Fri, 23 Jul 2004 17:45:55 -0500, Miller, Mike (OS Dev)
<mike.miller@hp.com> wrote:
> You'll have to explain why msleep will guarantee the timeout period whereas 
> schedule_timeout may not. Maybe I'm missing something.

Well, there are two things to consider here:

As a reference, the way the code was written before: 
-               set_current_state(TASK_INTERRUPTIBLE);
-               schedule_timeout(HZ / 10); /* wait 100ms */

1) Since the state is set to TASK_INTERRUPTIBLE, although a 100ms
delay is requested, if a signal is received, then the delay ends
prematurely and the task will resume after the schedule_timeout()
call. Now, if this was the desired effect, then the the patch should
not be applied.

2) However, if a true delay was desired, then TASK_INTERRUPTIBLE
should not have been the set state, but TASK_UNINTERRUPTIBLE should
have been. This would have made the code:
                 set_current_state(TASK_UNINTERRUPTIBLE);
                 schedule_timeout(HZ / 10);
msleep() achieves this exact purpose, but also:
  a) allows the parameter time to be in msecs, which is far clearer IMO; and
  b) guarantees that the task will not continue execution until after
the timeout has expired. Confusingly (at least to me), there are
certain conditions -- the details of which I will have to defer to
Greg Kroah-Hartman -- in which TASK_UNINTERRUPTIBLE'd
schedule_timeout()s may still return before the timeout. The desired
delay is achieved by wrapping the schedule_timeout(timeout) with a
while(timeout) loop. Thus, as long as timeout is non-zero, the task is
deferred. (see msleep()s definition for more details).

Does that help some? Please mail again if you have more questions, or
if something I wrote was unclear.

-Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

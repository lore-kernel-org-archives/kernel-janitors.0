From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 01 Oct 2004 21:09:01 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 2/33] char/cyclades: replace
Message-Id: <20041001210901.GC2110@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26326842509907178=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915212155.GG5778@us.ibm.com>
In-Reply-To: <20040915212155.GG5778@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============26326842509907178==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 01, 2004 at 04:07:04PM -0300, Marcelo Tosatti wrote:
> On Fri, Oct 01, 2004 at 01:10:31PM -0700, Nishanth Aravamudan wrote:
> > On Thu, Sep 30, 2004 at 01:48:18PM -0300, Marcelo Tosatti wrote:
> > > Well have to convert from jiffies (char_time) to msecs, just to 
> > > convert it back again to jiffies in msleep_interruptible().
> > > 
> > > Is this patch actually fixing any problem?
> > 
> > So there are a few things here:
> > 
> > 1) I think the overhead of the conversions is very small in comparison
> > with the eventual call to schedule() and such, so I don't think it's
> > that big of a deal -- *please* correct me if I am wrong, though.
> 
> No you are right the overhead is very small - I'm just trying
> to find a good reason to apply the change.

So I would say there are some good reasons to apply this patch.
Presuming this delay is somewhat long (it's a little hard to determine
this from the code, so your input here would again be appreciated),
having most drivers delay for long times using msleep*() goes a long way
towards consistency IMO. Since your timeout values are variables,
though, this becomes a little more difficult to argue :) Then again, if
we could figure out a way to use seconds (or some other human time-unit)
to express the delays, I think using msleep*() becomes pretty obvious.
Or even if it doesn't happen now for whatever reason, down the road this
makes the change that much easier

> > 2) I am currently trying to determine if it might be possible for the
> > timeout value (char_time, and I guess by extension, timeout) to be
> > expressed in milliseconds instead of jiffies. If you have any input on
> > that, Marcelo (or anyone from the list), I would really appreciate it.
> 
> I do not like the idea very much. 

Out of curiousity, why? Would it be particularly hard to do? If that is
the case, that's fine, I'm just wondering...

> I mean, what is the problem with that piece of code right now?
> 
> ie please educate me about msleep_interruptible()

To be honest, I think the arguments for using msleep() in general are
far stronger. msleep_interruptible() was recently introduced to have the
same effect except allow for a TASK_INTERRUPTIBLE based sleep. Since you
are checking for a signal after returning from schedule_timeout(),
msleep() isn't an option here ... What can be done here, actually, I
just realized is to remove the signal_pending() check, as
msleep_interruptible() does this as well.

There is another thing my patch didn't do, though - the

	current->state = TASK_RUNNING;

call is unnecessary, because schedule_timeout() / msleep_interruptible()
takes care of this.

I have made these changes in the following patch -- please revert the
previous cyclades patch and apply this one. Let me know if this is more
satisfactory (it definitely simplifies the while-loop a bit).

-Nish



Description: Uses msleep_interruptible() instead of schedule_timeout().
This allows the removal of one conditional, as msleep_interruptible()
should only return non-zero if signal_pending(current) is true.
current->state also does not need to be set, as msleep_interruptible()
(actually, schedule_timeout) is guaranteed to return in TASK_RUNNING.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/cyclades.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/cyclades.c	2004-10-01 13:55:19.000000000 -0700
@@ -2717,20 +2717,16 @@ cy_wait_until_sent(struct tty_struct *tt
 #ifdef CY_DEBUG_WAIT_UNTIL_SENT
 	    printk("Not clean (jiff=%lu)...", jiffies);
 #endif
-	    current->state = TASK_INTERRUPTIBLE;
-	    schedule_timeout(char_time);
-	    if (signal_pending(current))
+	    if (msleep_interruptible(jiffies_to_msecs(char_time)))
 		break;
 	    if (timeout && time_after(jiffies, orig_jiffies + timeout))
 		break;
 	}
-	current->state = TASK_RUNNING;
     } else {
 	// Nothing to do!
     }
     /* Run one more char cycle */
-    current->state = TASK_INTERRUPTIBLE;
-    schedule_timeout(char_time * 5);
+    msleep_interruptible(jiffies_to_msecs(char_time * 5));
 #ifdef CY_DEBUG_WAIT_UNTIL_SENT
     printk("Clean (jiff=%lu)...done\n", jiffies);
 #endif
@@ -2860,8 +2856,7 @@ cy_close(struct tty_struct *tty, struct 
     if (info->blocked_open) {
 	CY_UNLOCK(info, flags);
         if (info->close_delay) {
-            current->state = TASK_INTERRUPTIBLE;
-            schedule_timeout(info->close_delay);
+            msleep_interruptible(jiffies_to_msecs(info->close_delay));
         }
         wake_up_interruptible(&info->open_wait);
 	CY_LOCK(info, flags);

--===============26326842509907178==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26326842509907178==--

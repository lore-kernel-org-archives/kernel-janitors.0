From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sun, 13 Aug 2006 23:41:41 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <82faac5b0608131641o4d5d14dbnf5d35e56d8957fc2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry I missed Nishanth Aravamudan's mail

On 8/14/06, Pavel Machek <pavel@suse.cz> wrote:

> > FWIW, here is my poll_event() patch from some time ago updated to
> > 2.6.18-rc4. I think it's closest in spirit to 3). Comments, thoughts?

Was that the right patch ? because it doesn't seem to implement the fix in 3).
I think the easiest fix for this patch would be using number 2)



> > +/**
> > + * poll_event_timeout - check a condition at regular intervals with a timeout
> > + * @condition: Condition to check
> > + * @interval: Number of milliseconds between checks
> > + * @timeout: Time in jiffies to stop checking at
> > + * returns: 0, if condition caused return
> > + *       -ETIME, if timeout
> > + */
> > +#define poll_event_timeout(condition, interval, timeout)             \
> > +({                                                                   \
> > +     int __ret = 0;                                                  \
> > +                                                                     \
> > +     for (;;) {                                                      \
> > +             if (condition)                                          \
> > +                     break;                                          \
> > +             msleep(interval);                                       \
> > +             if (time_after(jiffies, timeout)) {                     \
                             if (condition)
                                     break;
> > +                     __ret = -ETIME;                                 \
> > +                     break;                                          \
> > +             }                                                       \
> > +     }                                                               \
> > +     __ret;                                                          \
> > +})


+#define poll_event_timeout(condition, interval, timeout)             \
+({                                                                   \
+     int __ret = 0;                                                  \
+                                                                     \
+     for (;;) {                                                      \
+             if (condition)                                          \
+                     break;                                          \
+             msleep(interval);                                       \
+             if (time_after(jiffies, timeout)) {                     \
                      if (condition)
                              break;
+                     __ret = -ETIME;                                 \
+                     break;                                          \
+             }                                                       \
+     }                                                               \
+     __ret;                                                          \
+})



> > +/**
> > + * poll_event_interruptible_timeout - check a condition at regular intervals with a timeout, returning early on signals
> > + * @condition: Condition to check
> > + * @interval: Number of milliseconds between checks
> > + * @timeout: Time in jiffies to stop checking at
> > + * returns 0, if condition caused return
> > + *      -EINTR, if a signal
> > + *      -ETIME, if timeout
> > + */
> > +#define poll_event_interruptible_timeout(conditition, interval, timeout)     \
> > +({                                                                           \
> > +     int __ret = 0;                                                          \
> > +                                                                             \
> > +     for (;;) {                                                              \
> > +             if (condition)                                                  \
> > +                     break;                                                  \
> > +             msleep_interruptible(interval);                                 \
> > +             if (signal_pending(current)) {                                  \
> > +                     __ret = -EINTR;                                         \
> > +                     break;                                                  \
> > +             }                                                               \
> > +             if (time_after(jiffies, timeout)) {                             \
                             if (condition)
                                     break;
> > +                     __ret = -ETIME;                                         \
> > +                     break;                                                  \
> > +             }                                                               \
> > +     }                                                                       \
> > +     __ret;                                                                  \
> > +})

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 19 Jan 2010 20:29:38 +0000
Subject: Lots of bugs with current->state = TASK_*INTERRUPTIBLE
Message-Id: <1263932978.31321.53.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org, Greg KH <greg@kroah.com>, Andy Whitcroft <apw@canonical.com>

Peter Zijlstra and I were doing a look over of places that assign
current->state = TASK_*INTERRUPTIBLE, by simply looking at places with:

 $ git grep -A1 'state[[:space:]]*=[[:space:]]*TASK_[^R]'

and it seems there are quite a few places that looks like bugs. To be on
the safe side, everything outside of a run queue lock that sets the
current state to something other than TASK_RUNNING (or dead) should be
using set_current_state().

	current->state = TASK_INTERRUPTIBLE;
	schedule();

is probably OK, but it would not hurt to be consistent. Here's a few
examples of likely bugs:

From drivers/staging/line6/midi.c:

        current->state = TASK_INTERRUPTIBLE;

        while (line6->line6midi->num_active_send_urbs > 0)

From drivers/staging/line6/pod.c:

        current->state = TASK_INTERRUPTIBLE;

        while (param->value = POD_system_invalid) {


Also drivers/macintosh/adb.c looks like there's a bug too.

I'm sure there's others but I stopped looking.

Anyway, this looks like a good janitorial work. Anything that assigns
state outside the rq locks to something other than TASK_RUNNING and that
is not before a schedule() (perhaps even those) should be converted to:

	set_current_task(<state>).

This probably should be checked in checkpatch.pl too, if it is not
already.

-- Steve



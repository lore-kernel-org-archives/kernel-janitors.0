From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 25 Apr 2004 23:25:15 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with
Message-Id: <20040425162515.2b469c16.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47704308770907511=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============47704308770907511==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 25 Apr 2004 20:10:41 -0300 Gustavo Franco <stratus@acm.org> wrote:

| Domen Puncer wrote:
| 
| >On Sat, Apr 24, 2004 at 03:34:44PM -0300, Gustavo Franco wrote:
| >  
| >
| >>Hi list,
| >>
| >>Following what i've said, i'm looking each yield() call to check if it 
| >>needs to be
| >>replaced.I'll send two more patches today and a status message, if 
| >>everything
| >>is ok, i'm planning to complete this task on the next week.
| >>
| >>Thanks,
| >>Gustavo Franco
| >>
| >>--- drivers/scsi/megaraid.c.orig     2004-04-24 13:54:26.000000000 -0300
| >>+++ drivers/scsi/megaraid.c  2004-04-24 13:54:36.000000000 -0300
| >>@@ -1691,7 +1691,7 @@
| >>       for (counter = 0; counter < 10000; counter++) {
| >>               if (!mbox->m_in.busy)
| >>                       return 0;
| >>-               udelay(100); yield();
| >>+               udelay(100); schedule_timeout(1);
| >>    
| >>
| >
| >This makes no sense to me.
| >schedule without set_current_state (also missing in other patches);
| >Why leave udelay?
| >
| >How about something like:
| >	for (counter = 0; counter < 1000; counter++) {
| >		if (!mbox->m_in.busy)
| >			return 0;
| >		set_current_state(TASK_INTERRUPTIBLE);
| >		schedule_timeout(1);
| >
| >counter < 1000 test is on purpose, to get >= 1 second, not 10.
| >
| >  
| >
| Hi Domen,
| 
| My failure, i haven't checked if the set_current_state() was really 
| needed.I'm working
| on the TODO item "Calling yield() Considered Harmful" written by Matthew 
| Wilcox.Since
| set_current_state() isn't cited by him and wasn't by Randy, i'll wait 
| until Randy ask for rediffied
| patches.Randy?

Yes, looks like Domen is correct.  He's right about the source code comment.
Then I looked at 25 source files that use schedule_timeout() and all of
them set current state first.

I'll update the TODO list with this info.

Thanks, all.

--
~Randy

--===============47704308770907511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47704308770907511==--

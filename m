From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:33:59 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/auerswald: replace
Message-Id: <20040728183359.GO1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57834551189581562=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407282023.23796.wolfgang@iksw-muees.de>
In-Reply-To: <200407282023.23796.wolfgang@iksw-muees.de>
To: kernel-janitors@vger.kernel.org

--===============57834551189581562==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2004 at 08:23:23PM +0200, Wolfgang M?es wrote:
> Hello Nishanth,
> 
> On Wednesday 28 July 2004 01:12, Nishanth Aravamudan wrote:
> > I would appreciate any comments from the janitors list.
> >
> > Applys-to: 2.6.7
> >
> > Description: Use msleep() instead of schedule_timeout() to
> > guarantee the task delays for the desired time.
> >
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> >
> >
> > --- linux-vanilla/drivers/usb/misc/auerswald.c	2004-06-16
> 
> I am the author of this driver.
> 
> Can you give me the rationale of the proposed change?
> In what sense is msleep() better/other than schedule_timeout?

Certainly. Some of this is going to be a repetition from previous posts
to the list, but oh well.

In this particular case, the rationale is quite simple. There are
certain situations -- the details of which I will have to defer to Greg
Kroah-Hartman for -- in which a code snippet such as:

set_current_state(TASK_UNINTERRUPTIBLE);
schedule_timeout(some_time);

will not delay as desired, i.e. the task resumes *before* some_time has
elapsed, instead of after. To prevent this condition from occuring,
msleep() wraps the schedule_timeout() in a while-loop on the timeout
value. Thus, as long as the timeout retains a positive value the task
gives the CPU back up and delays again. And once the timeout is 0, the
task is resumed. For the details, I recommend consulting the source
(kernel/timer.c).

Also, and this is less technical, but msleep() allows code to be written
in terms of milliseconds instead of jiffies, which is far clearer to a
person, IMO. All rounding issues are taken care of by msleep() as well,
as it uses msecs_to_jiffies() to calculate the correct delay value for
schedule_timeout().

Does that help?

Thanks,
Nish

--===============57834551189581562==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57834551189581562==--

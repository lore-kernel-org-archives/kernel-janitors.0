From: Michael Hunold <hunold@convergence.de>
Date: Fri, 02 Jul 2004 10:05:33 +0000
Subject: [Kernel-janitors] Re: [linux-dvb-maintainer] msleep() and delay
Message-Id: <40E5336D.30204@convergence.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82854023795577003=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82854023795577003==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 07/01/04 23:10, Nishanth Aravamudan wrote:
> [Not subscribed to linux-dvb, so please CC back if replying from that list]

> I'm working on one of the KernelJanitor/TODO items, specifically 
> converting appropriate calls to schedule_timeout() to msleep() calls 
> (Addendum by Greg KH to original request by Matthew Wilcox (Calling 
> yield() Considered Harmful)). In the process, I have run across the 
> following code [dvb_functions.h::dvb_delay()]:
[snip]
> I am wondering if dvb_delay() needs to run in TASK_INTERRUPTIBLE (it's 
> not the only such case I am seeing right now, but it was the first - if 
> anyone would like me to send the other cases, I'd be happy to). 
> Obviously, if not, then it can be replaced with msleep() calls. If it 
> must, then it probably should be updated to use set_current_state() and 
> msecs_to_jiffies() like msleep() does.

I don't think it's ever necessary to be interruptible for us, so 
mdelay() is suitable.

The idea to have a dvb_delay() function once was to have a 
"os-independend" sleep-function, so the dvb-core can be compiled for 
other unix-flavours, too. Now that the dvb-core is in the mainstream 
kernel, dvb_delay() looks a little bit awkward.

> This is my first try at Janitor-work, so please be patient.

Please send me a patch that kills dvb_delay(), replaces all uses and 
make a compile-time check. (I assume you don't have DVB hardware, right?)

  I'll then give it a try and see if it works as before and take care to 
send the patch to Linus Torvalds / Andrew Morton.

> Thanks,
> Nish

CU
Michael.

--===============82854023795577003==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82854023795577003==--

From: Paul Mackerras <paulus@samba.org>
Date: Sat, 22 Jan 2005 05:25:21 +0000
Subject: [KJ] Re: [PATCH 18/21] ppc64/rtasd: replace schedule_timeout() with
Message-Id: <16881.58305.424934.884018@cargo.ozlabs.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42472060184218918=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42472060184218918==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan writes:

> Description: Replace schedule_timeout() with msleep()/ssleep(). In both cases,
> the current code sleeps in TASK_INTERRUPTIBLE but does not account for early
> wakeups due to signals being caught; therefore I have used TASK_UNINTERRUPTIBLE
> sleeps in both cases. The second sleep is slightly more difficult to convert as
> rtas_event_scan_rate is variable. I have left it as a msleep() call, although
> ssleep() may be more appropriate.

You have a good point about signals, but I don't like the way that
this will elevate the load average by 1 the whole time.  We need to
fix this properly instead.

Paul.

--===============42472060184218918==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42472060184218918==--

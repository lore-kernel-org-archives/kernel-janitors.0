From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:57:07 +0000
Subject: [Kernel-janitors] Re: [PATCH] scsi/osst: replace schedule_timeout()
Message-Id: <20040727235707.GB6107@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52398478254702185=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1090971414l.8423l.3l@serve.riede.org>
In-Reply-To: <1090971414l.8423l.3l@serve.riede.org>
To: kernel-janitors@vger.kernel.org

--===============52398478254702185==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 11:36:54PM +0000, Willem Riede wrote:
> On 07/27/2004 06:47:32 PM, Nishanth Aravamudan wrote:
> >I would appreciate any comments from the janitors list. This is one (of
> >many) cases where I made a decision about replacing
> >
> >set_current_state(TASK_INTERRUPTIBLE);
> >schedule_timeout(some_time);
> >
> >with
> >
> >msleep(jiffies_to_msecs(some_time));
> >
> >msleep() is not exactly the same as the previous code, but I only did
> >this replacement where I thought long delays were *desired*. If this is
> >not the case here, then just disregard this patch.
> 
> While the exact delay for any schedule_timeout() in osst is usually not
> important, because there are outer loops that cause us to wait until the
> expected event takes place, I don't mind this change, with one exception:
> I don't want to assume the value of HZ, so the values flagged below are
> not acceptable.

<snip>

> >-	    set_current_state(TASK_INTERRUPTIBLE);
> >-	    schedule_timeout(HZ / 10);
> >+	    msleep(100);
>                  ^^^^^  must be HZ/10

<snip>

These are not assumptions of any form. By the math:

(HZ / 10 jiffies) * (1 / HZ sec/jiffies) * (1000 msecs/sec) = 100 msecs

The reason for this is the invariant ratio of jiffies to seconds. So I
don't think any changes need to be made to my patch.

Thanks, though, this is an important thing to be sure about.

-Nish

--===============52398478254702185==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52398478254702185==--

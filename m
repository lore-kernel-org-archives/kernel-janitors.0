From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 18:59:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] message/mptbase: replace
Message-Id: <20040814185925.GI1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============092219896536967383=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============092219896536967383==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 
> 
> Thanks,
> Nish
> 
> 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/message/fusion/mptbase.c	2004-06-16 05:19:01.000000000 +0000
> +++ linux-dev/drivers/message/fusion/mptbase.c	2004-07-12 18:56:59.000000000 +0000

could you please rework this one, it doesn't apply anymore to 2.6.8
i could do it but prefer to get next kjt patchset out soon.

a++ maks

ps patchfile output:
patching file drivers/message/fusion/mptbase.c
Hunk #1 succeeded at 3328 (offset 211 lines).
Hunk #2 FAILED at 3560.
Hunk #3 FAILED at 3652.
Hunk #4 FAILED at 3743.
Hunk #5 FAILED at 3769.
Hunk #6 FAILED at 3801.
5 out of 6 hunks FAILED -- saving rejects to file drivers/message/fusion/mptbase.c.rej 

--===============092219896536967383==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============092219896536967383==--

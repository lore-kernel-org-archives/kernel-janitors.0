From: Domen Puncer <domen@coderock.org>
Date: Sun, 25 Apr 2004 18:38:48 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with
Message-Id: <20040425183848.GB1394@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============058803320215242039=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============058803320215242039==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 24, 2004 at 03:34:44PM -0300, Gustavo Franco wrote:
> Hi list,
> 
> Following what i've said, i'm looking each yield() call to check if it 
> needs to be
> replaced.I'll send two more patches today and a status message, if 
> everything
> is ok, i'm planning to complete this task on the next week.
> 
> Thanks,
> Gustavo Franco
> 
> --- drivers/scsi/megaraid.c.orig     2004-04-24 13:54:26.000000000 -0300
> +++ drivers/scsi/megaraid.c  2004-04-24 13:54:36.000000000 -0300
> @@ -1691,7 +1691,7 @@
>        for (counter = 0; counter < 10000; counter++) {
>                if (!mbox->m_in.busy)
>                        return 0;
> -               udelay(100); yield();
> +               udelay(100); schedule_timeout(1);

This makes no sense to me.
schedule without set_current_state (also missing in other patches);
Why leave udelay?

How about something like:
	for (counter = 0; counter < 1000; counter++) {
		if (!mbox->m_in.busy)
			return 0;
		set_current_state(TASK_INTERRUPTIBLE);
		schedule_timeout(1);

counter < 1000 test is on purpose, to get >= 1 second, not 10.

Comments?


	Domen

--===============058803320215242039==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============058803320215242039==--

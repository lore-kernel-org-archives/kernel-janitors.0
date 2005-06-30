From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 30 Jun 2005 16:12:21 +0000
Subject: Re: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <20050630131221.663960a5.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51356141188848614=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120126573.24539.6.camel@localhost>
In-Reply-To: <1120126573.24539.6.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============51356141188848614==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  aLeJ <fuzzy.alej@gmail.com>
Sent on  Thu, 30 Jun 2005 12:16:13 +0200

> --- fs/smbfs/proc.c.orig	2005-06-22 21:33:05.000000000 +0200
> +++ fs/smbfs/proc.c	2005-06-30 12:02:45.000000000 +0200
> @@ -2397,7 +2397,7 @@ smb_proc_readdir_long(struct file *filp,
>  		if (req->rq_rcls == ERRSRV && req->rq_err == ERRerror) {
>  			/* a damn Win95 bug - sometimes it clags if you 
>  			   ask it too fast */
> -			current->state = TASK_INTERRUPTIBLE;
> +			set_current_state(TASK_INTERRUPTIBLE);

the memory barrier is really necessary (as pointed out earlier in the list
by Nishanth Aravamudan)?  if not, __set_current_state does the job.

I'd appreciate some notes/thoughts/tips/whatever on which conditions a
memory barrier is really needed, or, more clearly, when the absence of a
memory barrier breaks stuff.

TIA :)

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============51356141188848614==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51356141188848614==--

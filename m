From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Tue, 13 Jul 2004 23:36:01 +0000
Subject: Re: [Kernel-janitors] [PATCH] Re: no set_current_state() before
Message-Id: <29495f1d04071316362e782433@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5808719335605621=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F41EA6.9000900@us.ibm.com> <1089760052l.26949l.0l@serve.riede.org>
In-Reply-To: <1089760052l.26949l.0l@serve.riede.org>
To: Willem Riede <osst@riede.org>
Cc: Nishanth Aravamudan <nacc@us.ibm.com>, kernel-janitors@lists.osdl.org, osst-users@lists.sourceforge.net, linux-scsi@vger.kernel.org

--===============5808719335605621==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jul 2004 23:07:32 +0000, Willem Riede <osst@riede.org> wrote:
> 
> 
> On 07/13/2004 01:40:54 PM, Nishanth Aravamudan wrote:

<snip>

> > If someone could tell me which state (TASK_INTERRUPTIBLE or
> > TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the
> > calls with msleep().
> 
> You're right, there is a set_current_state(TASK_INTERRUPTIBLE) missing.
> I don't know why we would want to change to use msleep() though.

<snip>

The main reason I see for using msleep() instead is if the task should
sleep for at least 100 ms. Using TASK_INTERRUPTIBLE (or really
anything other than msleep()) is not guaranteed to sleep as long as
requested. If that's ok / desired, then I won't convert it, of course.

Thanks,
Nish

--===============5808719335605621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5808719335605621==--

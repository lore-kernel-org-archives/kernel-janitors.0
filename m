From: Jon Masters <jonmasters@gmail.com>
Date: Fri, 22 Oct 2004 23:30:03 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <35fb2e590410221630f5877ef@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23412028148574371=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============23412028148574371==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Oct 2004 16:26:43 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Any comments would be, as always, appreciated.

>                 /* Wait a little while */
>                 spin_unlock_irqrestore(&lp->hw_lock, flags);
> -               set_current_state(TASK_UNINTERRUPTIBLE);
> -               schedule_timeout(HZ>>2);
> +               msleep(250);
>                 spin_lock_irqsave(&lp->hw_lock, flags);

That delay seems a little long.

Jon.

--===============23412028148574371==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23412028148574371==--

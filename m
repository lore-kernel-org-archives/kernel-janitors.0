From: Jon Smirl <jonsmirl@gmail.com>
Date: Sat, 18 Sep 2004 16:46:42 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 11/33] char/i830_irq:
Message-Id: <9e4733910409180946214d058c@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58680065211606003=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============58680065211606003==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dave, what do you want to do about this one, inline function?
msleep_interuptible is only available on recent kernels.


On Thu, 16 Sep 2004 09:43:49 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc1-mm4-vanilla/drivers/char/drm/i830_irq.c   2004-09-09 23:05:37.000000000 -0700
> +++ 2.6.9-rc1-mm4/drivers/char/drm/i830_irq.c   2004-09-10 10:34:30.000000000 -0700
> @@ -105,7 +105,7 @@ int i830_wait_irq(drm_device_t *dev, int
>                         ret = -EBUSY;   /* Lockup?  Missed irq? */
>                         break;
>                 }
> -               schedule_timeout(HZ*3);
> +               msleep_interruptible(3000);
>                 if (signal_pending(current)) {
>                         ret = -EINTR;
>                         break;
> 
> -------------------------------------------------------
> This SF.Net email is sponsored by: YOU BE THE JUDGE. Be one of 170
> Project Admins to receive an Apple iPod Mini FREE for your judgement on
> who ports your project to Linux PPC the best. Sponsored by IBM.
> Deadline: Sept. 24. Go here: http://sf.net/ppc_contest.php
> --
> _______________________________________________
> Dri-devel mailing list
> Dri-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/dri-devel
> 



-- 
Jon Smirl
jonsmirl@gmail.com

--===============58680065211606003==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58680065211606003==--

From: Jon Smirl <jonsmirl@gmail.com>
Date: Sat, 18 Sep 2004 16:44:51 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 3/33] char/drm_os_linux:
Message-Id: <9e4733910409180944125ab2b7@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75238907008227152=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41493C3D.6090403@tungstengraphics.com>
In-Reply-To: <41493C3D.6090403@tungstengraphics.com>
To: kernel-janitors@vger.kernel.org

--===============75238907008227152==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dave, I just fixed this one in DRM CVS.


On Thu, 16 Sep 2004 00:13:46 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> Re-submission of patch incorporating Alan Cox's suggestion of using
> __set_current_state() and changing the other direct assignment in the
> macro.
> 
> Thanks,
> Nish
> 
> Description: Use set_current_state() instead of direct assignment of
> current->state.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- 2.6.9-rc2-vanilla/drivers/char/drm/drm_os_linux.h   2004-09-13 17:15:48.000000000 -0700
> +++ 2.6.9-rc2/drivers/char/drm/drm_os_linux.h   2004-09-16 00:10:47.000000000 -0700
> @@ -134,7 +134,7 @@ do {                                                                \
>         add_wait_queue(&(queue), &entry);                       \
>                                                                 \
>         for (;;) {                                              \
> -               current->state = TASK_INTERRUPTIBLE;            \
> +               __set_current_state(TASK_INTERRUPTIBLE);                \
>                 if (condition)                                  \
>                         break;                                  \
>                 if (time_after_eq(jiffies, end)) {              \
> @@ -147,7 +147,7 @@ do {                                                                \
>                         break;                                  \
>                 }                                               \
>         }                                                       \
> -       current->state = TASK_RUNNING;                          \
> +       __set_current_state(TASK_RUNNING);                      \
>         remove_wait_queue(&(queue), &entry);                    \
>  } while (0)
> 
> 
> 
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

--===============75238907008227152==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75238907008227152==--

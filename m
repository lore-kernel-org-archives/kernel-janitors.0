From: Dave Airlie <airlied@linux.ie>
Date: Thu, 16 Sep 2004 11:00:36 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 3/33] char/drm_os_linux:
Message-Id: <Pine.LNX.4.58.0409161158300.4200@skynet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24308314382503715=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41493C3D.6090403@tungstengraphics.com>
In-Reply-To: <41493C3D.6090403@tungstengraphics.com>
To: kernel-janitors@vger.kernel.org

--===============24308314382503715==
Content-Type: TEXT/PLAIN; charset=US-ASCII


I'll apply this to my tree and fix up the rest of them in the DRM, and
push it to Linus..

Dave.

On Wed, 15 Sep 2004, Nishanth Aravamudan wrote:

> Any comments would be appreciated.
>
> Description: Use set_current_state() instead of direct assignment of
> current->state.
>
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
> --- 2.6.9-rc1-mm4-vanilla/drivers/char/drm/drm_os_linux.h	2004-09-09 23:05:38.000000000 -0700
> +++ 2.6.9-rc1-mm4/drivers/char/drm/drm_os_linux.h	2004-09-10 10:34:04.000000000 -0700
> @@ -134,7 +134,7 @@ do {								\
>  	add_wait_queue(&(queue), &entry);			\
>  								\
>  	for (;;) {						\
> -		current->state = TASK_INTERRUPTIBLE;		\
> +		set_current_state(TASK_INTERRUPTIBLE);		\
>  		if (condition)					\
>  			break;					\
>  		if (time_after_eq(jiffies, end)) {		\
>
>
> -------------------------------------------------------
> This SF.Net email is sponsored by: thawte's Crypto Challenge Vl
> Crack the code and win a Sony DCRHC40 MiniDV Digital Handycam
> Camcorder. More prizes in the weekly Lunch Hour Challenge.
> Sign up NOW http://ad.doubleclick.net/clk;10740251;10262165;m
> --
> _______________________________________________
> Dri-devel mailing list
> Dri-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/dri-devel
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied at skynet.ie
pam_smb / Linux DECstation / Linux VAX / ILUG person


--===============24308314382503715==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24308314382503715==--

From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 07 Jan 2005 21:39:23 +0000
Subject: [KJ] Re: [PATCH 2/28] net/act200l-sir: replace schedule_timeout()
Message-Id: <20050107213923.GG2924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37343895611858202=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37343895611858202==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2005 at 03:29:41PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. There aren't any waitqueue events in the area, so I believe
> an absolute sleep should be ok.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.10-v/drivers/net/irda/act200l-sir.c	2004-12-24 13:34:30.000000000 -0800
> +++ 2.6.10/drivers/net/irda/act200l-sir.c	2005-01-04 14:57:49.000000000 -0800
> @@ -177,8 +177,7 @@ static int act200l_change_speed(struct s
>  
>  	/* Write control bytes */
>  	sirdev_raw_write(dev, control, 3);
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(msecs_to_jiffies(5));
> +	msleep(5);
>  
>  	/* Go back to normal mode */
>  	sirdev_set_dtr_rts(dev, TRUE, TRUE);

Please ignore this patch, as there is already a more correct one in the
2.6.10-kj patchset. Sorry for the noise.

Thanks,
Nish

--===============37343895611858202==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37343895611858202==--

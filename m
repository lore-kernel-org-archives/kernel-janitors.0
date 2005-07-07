From: Vojtech Pavlik <vojtech@suse.cz>
Date: Thu, 07 Jul 2005 13:28:39 +0000
Subject: [KJ] Re: [PATCH] input/iforce-packets: insert set_current_state()
Message-Id: <20050707132839.GA15164@ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36791053629633463=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36791053629633463==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2004 at 04:28:38PM -0700, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.

The right solution is to use wait_event_interruptible_timeout().
I changed the code to do that. Thanks for the bug report.

(Unfortunately it still isn't perfect, because we shouldn't be checking
the URB status directly, but rather some atomic variable. Not too bad,
though.)

> -Nish
> 
> Description: Inserts set_current_state() before schedule_timeout().
> Without the insertion, schedule_timeout() will return immediately.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-bk7-vanilla/drivers/input/joystick/iforce/iforce-packets.c	2004-10-22 10:41:36.000000000 -0700
> +++ 2.6.9-bk7/drivers/input/joystick/iforce/iforce-packets.c	2004-10-22 14:53:18.000000000 -0700
> @@ -269,8 +269,10 @@ int iforce_get_id_packet(struct iforce *
>  			return -1;
>  		}
>  
> -		while (timeout && iforce->ctrl->status == -EINPROGRESS)
> +		while (timeout && iforce->ctrl->status == -EINPROGRESS) {
> +			set_current_state(TASK_INTERRUPTIBLE);
>  			timeout = schedule_timeout(timeout);
> +		}
>  
>  		set_current_state(TASK_RUNNING);
>  		remove_wait_queue(&iforce->wait, &wait);
> @@ -293,8 +295,10 @@ int iforce_get_id_packet(struct iforce *
>  		set_current_state(TASK_INTERRUPTIBLE);
>  		add_wait_queue(&iforce->wait, &wait);
>  
> -		while (timeout && iforce->expect_packet)
> +		while (timeout && iforce->expect_packet) {
> +			set_current_state(TASK_INTERRUPTIBLE);
>  			timeout = schedule_timeout(timeout);
> +		}
>  
>  		set_current_state(TASK_RUNNING);
>  		remove_wait_queue(&iforce->wait, &wait);
> 

-- 
Vojtech Pavlik
SuSE Labs, SuSE CR

--===============36791053629633463==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36791053629633463==--

From: Greg Ungerer <gerg@snapgear.com>
Date: Tue, 28 Sep 2004 00:32:15 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 4/6] serial/mcfserial:
Message-Id: <4158B10F.5080100@snapgear.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78234908866143016=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920215026.GK2270@us.ibm.com>
In-Reply-To: <20040920215026.GK2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============78234908866143016==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nishanth,

Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected. Use set_current_state() instead
> of direct assignment of current->state.

Looks ok to me.

Regards
Greg



> --- 2.6.9-rc2-vanilla/drivers/serial/mcfserial.c	2004-09-13 17:15:52.000000000 -0700
> +++ 2.6.9-rc2/drivers/serial/mcfserial.c	2004-09-27 14:23:12.000000000 -0700
> @@ -34,6 +34,7 @@
>  #include <linux/serialP.h>
>  #include <linux/console.h>
>  #include <linux/init.h>
> +#include <linux/delay.h>
>  
>  #include <asm/io.h>
>  #include <asm/irq.h>
> @@ -997,7 +998,7 @@ static void send_break(	struct mcf_seria
>  
>  	if (!info->addr)
>  		return;
> -	current->state = TASK_INTERRUPTIBLE;
> +	set_current_state(TASK_INTERRUPTIBLE);
>  	uartp = info->addr;
>  
>  	local_irq_save(flags);
> @@ -1247,8 +1248,7 @@ static void mcfrs_close(struct tty_struc
>  	}
>  	if (info->blocked_open) {
>  		if (info->close_delay) {
> -			current->state = TASK_INTERRUPTIBLE;
> -			schedule_timeout(info->close_delay);
> +			msleep_interruptible(jiffies_to_msecs(info->close_delay));
>  		}
>  		wake_up_interruptible(&info->open_wait);
>  	}
> @@ -1313,8 +1313,7 @@ mcfrs_wait_until_sent(struct tty_struct 
>  			fifo_cnt++;
>  		if (fifo_cnt == 0)
>  			break;
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		schedule_timeout(char_time);
> +		msleep_interruptible(jiffies_to_msecs(char_time));
>  		if (signal_pending(current))
>  			break;
>  		if (timeout && time_after(jiffies, orig_jiffies + timeout))
> 

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a CyberGuard Company            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com

--===============78234908866143016==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78234908866143016==--

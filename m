From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 07 Jan 2005 21:38:21 +0000
Subject: [KJ] Re: [PATCH 1/28] net/3c505: replace schedule_timeout() with
Message-Id: <20050107213821.GF2924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63781198570284792=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63781198570284792==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2005 at 03:25:31PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. There are no waitqueue events in the area, so an
> absolute sleep should be ok.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.10-v/drivers/net/3c505.c	2004-12-24 13:35:49.000000000 -0800
> +++ 2.6.10/drivers/net/3c505.c	2005-01-04 14:57:49.000000000 -0800
> @@ -1327,8 +1327,7 @@ static int __init elp_sense(struct net_d
>  	if (orig_HSR & DIR) {
>  		/* If HCR.DIR is up, we pull it down. HSR.DIR should follow. */
>  		outb(0, dev->base_addr + PORT_CONTROL);
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(30*HZ/100);
> +		msleep(300);
>  		if (inb_status(addr) & DIR) {
>  			if (elp_debug > 0)
>  				printk(notfound_msg, 2);
> @@ -1337,8 +1336,7 @@ static int __init elp_sense(struct net_d
>  	} else {
>  		/* If HCR.DIR is down, we pull it up. HSR.DIR should follow. */
>  		outb(DIR, dev->base_addr + PORT_CONTROL);
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(30*HZ/100);
> +		msleep(300);
>  		if (!(inb_status(addr) & DIR)) {
>  			if (elp_debug > 0)
>  				printk(notfound_msg, 3);

Please ignore this patch, as there is already a more correct one in the
2.6.10-kj patchset. Sorry for the noise.

Thanks,
Nish

--===============63781198570284792==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63781198570284792==--

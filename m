From: Phil Blundell <pb@nexus.co.uk>
Date: Tue, 21 Sep 2004 21:58:02 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/40] net/3c505: replace
Message-Id: <1095803882.2295.3.camel@workhouse.nexus.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============067427730838142574=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============067427730838142574==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Looks good to me.  

Thanks.

p.

On Tue, 2004-09-21 at 14:56 -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep() instead of schedule_timeout()
> to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc2-vanilla/drivers/net/3c505.c	2004-09-13 17:15:46.000000000 -0700
> +++ 2.6.9-rc2/drivers/net/3c505.c	2004-09-14 17:07:02.000000000 -0700
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
> 

--===============067427730838142574==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============067427730838142574==--

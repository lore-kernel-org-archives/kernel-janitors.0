From: David Brownell <david-b@pacbell.net>
Date: Wed, 28 Jul 2004 05:23:48 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/usbnet: replace
Message-Id: <41073864.1050407@pacbell.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95690482441001135=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95690482441001135==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.

Please define and use UNLINK_TIMEOUT_MS, instead.
Or better yet, switch to wait_event() ...


> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/usb/net/usbnet.c	2004-06-16 05:19:31.000000000 +0000
> +++ linux-dev/drivers/usb/net/usbnet.c	2004-07-06 01:14:20.000000000 +0000
> @@ -2550,8 +2550,7 @@ static int usbnet_stop (struct net_devic
>  	while (skb_queue_len (&dev->rxq)
>  			&& skb_queue_len (&dev->txq)
>  			&& skb_queue_len (&dev->done)) {
> -		set_current_state (TASK_UNINTERRUPTIBLE);
> -		schedule_timeout (UNLINK_TIMEOUT_JIFFIES);
> +		msleep(jiffies_to_msecs(UNLINK_TIMEOUT_JIFFIES);
>  		devdbg (dev, "waited for %d urb completions", temp);
>  	}
>  	dev->wait = 0;
> 




--===============95690482441001135==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95690482441001135==--

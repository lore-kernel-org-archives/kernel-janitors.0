From: Marcel Holtmann <marcel@holtmann.org>
Date: Sat, 22 Jan 2005 17:57:28 +0000
Subject: [KJ] Re: [UPDATE PATCH 18/39] net/core: use wait_event_timeout()
Message-Id: <1106416648.8118.3.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0098058913419962757=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120235123.GG2600@us.ibm.com>
	 <1106267534.7955.36.camel@pegasus>  <20050121190909.GD3340@us.ibm.com>
In-Reply-To: <20050121190909.GD3340@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Max Krasnyansky <maxk@qualcomm.com>, BlueZ Mailing List <bluez-devel@lists.sourceforge.net>, kernel-janitors@lists.osdl.org

--===============0098058913419962757==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nishanth,

> Description: Use wait_event_timeout() instead of custom wait-queue code.
> The current code uses TASK_INTERRUPTIBLE but only cares about timing out and the
> wq event taking place (does not actively do anything in response to signals), so
> wait_event_timeout() should be ok.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- 2.6.11-rc1-kj-v/net/bluetooth/hidp/core.c	2005-01-15 16:55:44.000000000 -0800
> +++ 2.6.11-rc1-kj/net/bluetooth/hidp/core.c	2005-01-21 11:07:11.000000000 -0800
> @@ -36,6 +36,7 @@
>  #include <linux/ioctl.h>
>  #include <linux/file.h>
>  #include <linux/init.h>
> +#include <linux/wait.h>
>  #include <net/sock.h>
>  
>  #include <linux/input.h>
> @@ -325,7 +326,6 @@ static int hidp_session(void *arg)
>  	struct sk_buff *skb;
>  	int vendor = 0x0000, product = 0x0000;
>  	wait_queue_t ctrl_wait, intr_wait;
> -	unsigned long timeo = HZ;
>  
>  	BT_DBG("session %p", session);
>  
> @@ -370,28 +370,14 @@ static int hidp_session(void *arg)
>  
>  	hidp_del_timer(session);
>  
> -	if (intr_sk->sk_state != BT_CONNECTED) {
> -		init_waitqueue_entry(&ctrl_wait, current);
> -		add_wait_queue(ctrl_sk->sk_sleep, &ctrl_wait);
> -		while (timeo && ctrl_sk->sk_state != BT_CLOSED) {
> -			set_current_state(TASK_INTERRUPTIBLE);
> -			timeo = schedule_timeout(timeo);
> -		}
> -		set_current_state(TASK_RUNNING);
> -		remove_wait_queue(ctrl_sk->sk_sleep, &ctrl_wait);
> -		timeo = HZ;
> -	}
> +	if (intr_sk->sk_state != BT_CONNECTED)
> +		wait_event_timeout(*(ctrl_sk->sk_sleep),
> +				(ctrl_sk->sk_state == BT_CLOSED), HZ);

and this does not make it look better. For me this is too much pointer
stuff here. I think the interface of wait_event_timeout() is wrong. It
should take a pointer to wait_queue_head_t.

Regards

Marcel



--===============0098058913419962757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0098058913419962757==--

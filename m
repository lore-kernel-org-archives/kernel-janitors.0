From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Date: Sat, 23 Oct 2004 08:20:50 +0000
Subject: [KJ] Re: [PATCH] w1/dscore: replace schedule_timeout() with
Message-Id: <20041023122050.4b018bc5@zanzibar.2ka.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33742207238876976=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33742207238876976==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Oct 2004 16:24:24 -0700
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Uses msleep_interruptible() instead of schedule_timeout()
> to guarantee the task delays as expected.

I'm Ok with your changes, all 4 patches applied, thank you.
They will be sent for inlusion through Greg Kroah-Hartman.

> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-bk7-vanilla/drivers/w1/dscore.c	2004-10-22 10:41:43.000000000 -0700
> +++ 2.6.9-bk7/drivers/w1/dscore.c	2004-10-22 16:00:46.000000000 -0700
> @@ -733,10 +733,8 @@ void ds_disconnect(struct usb_interface 
>  	while (atomic_read(&dev->refcnt)) {
>  		printk(KERN_INFO "Waiting for DS to become free: refcnt=%d.\n",
>  				atomic_read(&dev->refcnt));
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		schedule_timeout(HZ);
>  
> -		if (signal_pending(current))
> +		if (msleep_interruptible(1000))
>  			flush_signals(current);
>  	}
>  

--===============33742207238876976==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33742207238876976==--

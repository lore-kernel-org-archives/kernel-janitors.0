From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 20 Jul 2004 13:02:44 +0000
Subject: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout() with
Message-Id: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52074531208139563=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52074531208139563==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> I would appreciate any comments from the janitors list.
> 
> 
> Applys-to: 2.6.7
> 
> Description: Uses msleep() instead of schedule_timeout() to guarantee
> the task delays at least the desired time amount.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

I'm not sure it makes sense.... so it will just spin once more? Exact
timeout does not seem too critical here.
								Pavel

> --- linux-vanilla/drivers/block/nbd.c	2004-06-16 05:19:01.000000000 +0000
> +++ linux-dev/drivers/block/nbd.c	2004-07-02 17:24:31.000000000 +0000
> @@ -139,8 +139,7 @@ static void nbd_end_request(struct reque
>  		spin_unlock(&lo->queue_lock);
>  		printk(KERN_DEBUG "%s: request %p still in use (%d), waiting\n",
>  		    lo->disk->disk_name, req, req->ref_count);
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(HZ); /* wait a second */
> +		msleep(1000);
>  		spin_lock(&lo->queue_lock);
>  	}
>  	spin_unlock(&lo->queue_lock);

-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.

--===============52074531208139563==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52074531208139563==--

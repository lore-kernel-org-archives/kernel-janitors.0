From: Mark Hollomon <markhollomon@comcast.net>
Date: Tue, 27 Jul 2004 14:14:49 +0000
Subject: Re: [Kernel-janitors] [PATCH] radio/radio-sf16fmr2:
Message-Id: <41066359.8040402@comcast.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============096652462493312941=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726224156.GJ1897@us.ibm.com>
In-Reply-To: <20040726224156.GJ1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============096652462493312941==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

since sleep_delay is only called once (with the intent to sleep for 110 
ms), wouldn't it be better to simply replace the call to sleep_delay 
with msleep (and remove sleep_delay)?

Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
> 
> Thanks,
> Nish
> 
> Applys-to: 2.6.7
> 
> Description: Replaced schedule_timeout() with msleep() to guarantee the
> task delays the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/media/radio/radio-sf16fmr2.c	2004-06-16 05:19:22.000000000 +0000
> +++ linux-dev/drivers/media/radio/radio-sf16fmr2.c	2004-07-02 21:42:03.000000000 +0000
> @@ -62,10 +62,7 @@ static void sleep_delay(unsigned long n)
>  	if (!d)
>  		udelay(n);
>  	else
> -	{
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(d);
> -	}
> +		msleep(jiffies_to_msecs(d));
>  }



-- 
--------------------------
Mark Hollomon

--===============096652462493312941==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============096652462493312941==--

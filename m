From: Domen Puncer <domen@coderock.org>
Date: Wed, 29 Sep 2004 16:30:14 +0000
Subject: [Kernel-janitors] Re: usb/auerswald: reorder set_current_state()
Message-Id: <20040929163014.GB3599@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10684485580657022=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10684485580657022==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/09/04 14:46 -0700, Nishanth Aravamudan wrote:
> +++ 2.6.9-rc2/drivers/usb/misc/auerswald.c	2004-09-27 14:42:24.000000000 -0700
> @@ -626,8 +626,8 @@ static int auerchain_start_wait_urb (pau
>  
>  	while (timeout && !chs.done)
>  	{
> -		timeout = schedule_timeout (timeout);
>  		set_current_state(TASK_UNINTERRUPTIBLE);
> +		timeout = schedule_timeout (timeout);
>  		rmb();
>  	}
>
Now "set_current_state (TASK_RUNNING);" a line under this isn't
needed anymore, right?


	Domen

--===============10684485580657022==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10684485580657022==--

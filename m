From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 18:48:47 +0000
Subject: Re: [Kernel-janitors] [PATCH] dvb/av7110: replace schedule_timeout()
Message-Id: <20040814184847.GG1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============025855274717532684=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============025855274717532684==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list.
> 
> Thanks,
> Nish
> 
> Applys-to: 2.6.7
> 
> Description: Replace dvb_delay() with msleep() to guarantee the
> task delays the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/media/dvb/ttpci/av7110.c	2004-06-16 05:19:37.000000000 +0000
> +++ linux-dev/drivers/media/dvb/ttpci/av7110.c	2004-07-02 18:47:02.000000000 +0000
> @@ -89,7 +89,7 @@ static void recover_arm(struct av7110 *a
>  	DEB_EE(("av7110: %p\n",av7110));
>  
>  	av7110_bootarm(av7110);
> -        dvb_delay(100); 
> +        msleep(100); 
one of the rare trailing space.
>          restart_feeds(av7110);
>  	av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1, av7110->ir_config);
>  }
> @@ -1510,7 +1510,7 @@ err3:
>  	av7110->arm_rmmod = 1;
>  	wake_up_interruptible(&av7110->arm_wait);
>  	while (av7110->arm_thread)
> -		dvb_delay(1);
> +		msleep(1);
>  err2:
>  	av7110_ca_exit(av7110);
>  	av7110_av_exit(av7110);
> @@ -1546,7 +1546,7 @@ static int av7110_detach (struct saa7146
>  	wake_up_interruptible(&av7110->arm_wait);
>  
>  	while (av7110->arm_thread)
> -		dvb_delay(1);
> +		msleep(1);
>  
>  	dvb_unregister(av7110);
>  	


corrected for next kjt.
a++ maks


--===============025855274717532684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============025855274717532684==--

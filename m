From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:41:15 +0000
Subject: [Kernel-janitors] Re: [PATCH] eicon/os_4bri: replace
Message-Id: <20040723174115.GG1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37143878657877138=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37143878657877138==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry for the duplicate patch...

On Fri, Jul 23, 2004 at 10:38:20AM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
> 
> Thanks,
> Nish
> 
> 
> 
> Applys-to: 2.6.7
> 
> Description: Replace diva_os_sleep() with msleep() in all instances. 
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/isdn/hardware/eicon/mntfunc.c	2004-06-16 05:18:54.000000000 +0000
> +++ linux-dev/drivers/isdn/hardware/eicon/mntfunc.c	2004-07-02 18:04:34.000000000 +0000
> @@ -340,7 +340,7 @@ void DIVA_EXIT_FUNCTION mntfunc_finit(vo
>  	int i = 100;
>  
>  	while (diva_mnt_shutdown_xdi_adapters() && i--) {
> -		diva_os_sleep(10);
> +		msleep(10);
>  	}
>  
>  	disconnect_didd();

--===============37143878657877138==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37143878657877138==--

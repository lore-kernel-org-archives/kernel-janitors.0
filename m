From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 20 Sep 2004 16:51:53 +0000
Subject: Re: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040920165153.GA9976@v216-190.vps.tuwien.ac.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84950816830544018=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============84950816830544018==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 20 Sep 2004, Clemens Buchacher wrote:
..
> diff -Nru a/drivers/net/wireless/prism54/islpci_mgt.h b/drivers/net/wireless/prism54/islpci_mgt.h
> --- a/drivers/net/wireless/prism54/islpci_mgt.h	2004-09-20 15:14:54 +02:00
> +++ b/drivers/net/wireless/prism54/islpci_mgt.h	2004-09-20 15:14:54 +02:00
> @@ -31,7 +31,7 @@
>  #define K_DEBUG(f, m, args...) do { if(f & m) printk(KERN_DEBUG args); } while(0)
>  #define DEBUG(f, args...) K_DEBUG(f, pc_debug, args)
>  
> -#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> " __FUNCTION__ "()\n", devname)
> +#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> %s()\n", devname, __FUNCTION__)
TRACE() is used nowhere, there is a better one, which completly
removes it in latest kj tree.
>  
>  extern int pc_debug;
>  #define init_wds 0	/* help compiler optimize away dead code */

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============84950816830544018==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84950816830544018==--

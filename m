From: Steffen Klassert <klassert@mathematik.tu-chemnitz.de>
Date: Thu, 18 Nov 2004 15:47:28 +0000
Subject: Re: [KJ] Re: net/3c59x: module_param conversions
Message-Id: <20041118154728.GC20050@gareth.mathematik.tu-chemnitz.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40123672496214269=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041118142233.GC5645@nd47.coderock.org>
In-Reply-To: <20041118142233.GC5645@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============40123672496214269==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 18, 2004 at 03:22:33PM +0100 or thereabouts, Domen Puncer wrote:

> Anyway, in rc2-mm2:
> --- linux-2.6.10-rc2/drivers/net/3c59x.c        2004-11-14 21:05:31.000000000 -0
> 800
> +++ 25/drivers/net/3c59x.c      2004-11-17 23:21:24.184865960 -0800
> @@ -277,6 +277,7 @@ MODULE_AUTHOR("Donald Becker <becker@scy
>  MODULE_DESCRIPTION("3Com 3c59x/3c9xx ethernet driver "
>                                         DRV_VERSION " " DRV_RELDATE);
>  MODULE_LICENSE("GPL");
> +MODULE_VERSION(DRV_VERSION);
>  
>  MODULE_PARM(debug, "i");
> ^^^
> Doesn't seem converted.

Well, I was not up to date. The conversation was in  2.6.10-rc1-mm3 but
but backed out in -mm4 for some reason.

Steffen

--===============40123672496214269==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40123672496214269==--

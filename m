From: stefan@binarchy.net
Date: Tue, 16 Nov 2004 08:34:07 +0000
Subject: Re: [KJ] [PATCH] MODULE_PARM in drivers/net/ppp_async.c
Message-Id: <20041116083407.GA23559@stud.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35523767464974165=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041115203611.GA6214@voyager>
In-Reply-To: <20041115203611.GA6214@voyager>
To: kernel-janitors@vger.kernel.org

--===============35523767464974165==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2004 at 09:36:11PM +0100, Carlo Perassi wrote:
> Hi.
> Compiling 2.6.10-rc2 with ppp_async.ko I saw a warning about
> MODULE_PARAM.
> I do not know a lot on this topic, anyway I searched a bit about that
> and tried to patch the ppp_async.c file.
> I compiled (without getting the previous warning) and tested ppp with
> the attached patch.
> Please let me know if it is the proper way to patch it.
> --- linux-2.6.10-rc2-orig/drivers/net/ppp_async.c	2004-11-15 21:22:04.000000000 +0100
> +++ linux-2.6.10-rc2-mod/drivers/net/ppp_async.c	2004-11-15 21:21:47.000000000 +0100
> @@ -84,7 +84,7 @@ struct asyncppp {
>  #define SC_RCV_BITS	(SC_RCV_B7_1|SC_RCV_B7_0|SC_RCV_ODDP|SC_RCV_EVNP)
>  
>  static int flag_time = HZ;
> -MODULE_PARM(flag_time, "i");
> +module_param(flag_time, int, 0444);
>  MODULE_PARM_DESC(flag_time, "ppp_async: interval between flagged packets (in clock ticks)");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS_LDISC(N_PPP);


Looks good to me.

stefan

--===============35523767464974165==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35523767464974165==--

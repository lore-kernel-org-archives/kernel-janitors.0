From: Corey Minyard <minyard@acm.org>
Date: Mon, 24 Aug 2009 03:10:44 +0000
Subject: Re: [Openipmi-developer] [PATCH] char/impi: adding __init macro/ fix
Message-Id: <4A9204B4.2030800@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200908230146.56283.PeterHuewe@gmx.de>
In-Reply-To: <200908230146.56283.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>
Cc: Jiri Kosina <trivial@kernel.org>, openipmi-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is correct, I'm fine with it going through the trivial tree.  Thanks.

Acked-by: Corey Minyard <minyard@acm.org>

Peter H=FCwe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
>
> Trivial patch which adds the __init to the module_init function of
> drivers/char/ipmi/ipmy_poweroff.c and corrects the location of __exit for=
 the
> cleanup function.
>
> According to ldd3, page 31 the __exit token hast to be after the return t=
ype.
> Or am I getting something wrong here?
>
> Corey, please have a look at the small patch and either pull it through
> your tree, or please ack' it so Jiri can pull it through the trivial tree.
>
> linux version 2.6.31-rc6 - linus git tree, So 23. Aug 01:38:43 CEST 2009
>
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_p=
oweroff.c
> index a261bd7..2e66b5f 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -691,7 +691,7 @@ static struct ctl_table_header *ipmi_table_header;
>  /*
>   * Startup and shutdown functions.
>   */
> -static int ipmi_poweroff_init(void)
> +static int __init ipmi_poweroff_init(void)
>  {
>  	int rv;
> =20
> @@ -725,7 +725,7 @@ static int ipmi_poweroff_init(void)
>  }
> =20
>  #ifdef MODULE
> -static __exit void ipmi_poweroff_cleanup(void)
> +static void __exit ipmi_poweroff_cleanup(void)
>  {
>  	int rv;
> =20
>
> -------------------------------------------------------------------------=
-----
> Let Crystal Reports handle the reporting - Free Crystal Reports 2008 30-D=
ay=20
> trial. Simplify your report design, integration and deployment - and focu=
s on=20
> what you do best, core application coding. Discover what's new with=20
> Crystal Reports now.  http://p.sf.net/sfu/bobj-july
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
